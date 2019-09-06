package mn.team.controller;

import com.fasterxml.jackson.core.JsonParseException;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import io.lettuce.core.api.StatefulRedisConnection;
import io.lettuce.core.api.sync.RedisCommands;
import io.micronaut.http.HttpHeaders;
import io.micronaut.http.HttpResponse;
import io.micronaut.http.annotation.*;
import io.reactivex.Single;
import mn.team.domain.Player;
import mn.team.dto.Employee;
import mn.team.dto.EmployeePlayer;
import mn.team.repository.AbstractPlayerRepository;
import mn.team.repository.PlayerRepository;
import mn.team.service.EmployeesClient;
import mn.team.service.EmployeesOperations;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import javax.inject.Inject;
import javax.transaction.Transactional;
import javax.validation.Valid;
import java.io.IOException;
import java.net.URI;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

@Controller("/players")
public class PlayerController
{
    private static final ObjectMapper objectMapper = new ObjectMapper();
    private static final Logger LOG = LoggerFactory.getLogger(PlayerController.class);

    @Inject
    StatefulRedisConnection<String, String> connection;

    private final PlayerRepository playerRepository;
    private final AbstractPlayerRepository abstractPlayerRepository;
    private final EmployeesOperations employeesOperations;

    public PlayerController(AbstractPlayerRepository abstractPlayerRepository,
                            PlayerRepository playerRepository,
                            EmployeesOperations employeesOperations)
    {
        this.abstractPlayerRepository = abstractPlayerRepository;
        this.playerRepository = playerRepository;
        this.employeesOperations = employeesOperations;
    }

    @Get("/")
    public List<Player> all() {
        return (ArrayList<Player>) playerRepository.findAll();
    }

    @Get("/{id}")
    public HttpResponse<Player> getById(Long id) {
        try {
            RedisCommands<String, String> commands = connection.sync();
            String cacheKey = "Player:" + id.toString();
            String playerString = commands.get(cacheKey);
            Player cached = playerString == null ? null: objectMapper.readValue(playerString, Player.class);
            if (cached != null) {
                LOG.info("Using cached instance of Player");
                return HttpResponse.ok(cached);
            }
            Player found = playerRepository.findById(id).orElse(null);
            if (found == null) {
                return HttpResponse.notFound();
            }
            LOG.info("Caching retrieved instance of Player");
            commands.set(cacheKey, objectMapper.writeValueAsString(found));
            return HttpResponse.ok(found);
        } catch (IOException e) {
            return HttpResponse.serverError();
        }
    }

    @Get("/{id}/extended")
    public HttpResponse<EmployeePlayer> getExtendedById(Long id) {
        Employee employee = employeesOperations.findById(id).blockingGet();
        Player player = playerRepository.findById(id).orElse(null);
        if (player == null || employee == null ) {
            return HttpResponse.notFound();
        }

        player.setFullName(player.getFullName() + "Tes1");
        return HttpResponse.ok(new EmployeePlayer(employee, player));
    }

    @Get("/findBy{?fullName,position}")
    public HttpResponse<List<Player>> getFindBy(@QueryValue Optional<String> fullName, @QueryValue Optional<String> position) {
        if ((fullName.isEmpty() && position.isEmpty()) || (fullName.isPresent() && position.isPresent())) {
            return HttpResponse.badRequest();
        }
        else if (fullName.isPresent()) {
           List<Player> players = playerRepository.findByFullName(fullName.get());
            if (players == null) {
                return HttpResponse.notFound();
            }
            return HttpResponse.ok(players);
        }
        else {
            List<Player> players = playerRepository.findByPosition(position.get());
            if (players == null) {
                return HttpResponse.notFound();
            }
            return HttpResponse.ok(players);
        }
    }

    @Put("/{id}")
    @Transactional(value = Transactional.TxType.REQUIRED)
    public HttpResponse update(Long id, @Body @Valid Player player) {
        if (player.getId() == null || !player.getId().equals(id)) {
            return HttpResponse.badRequest();
        }
        Player origPlayer = playerRepository.findById(id).orElse(null);
        if (origPlayer == null) {
            return HttpResponse.notFound();
        }
        origPlayer.setFullName(player.getFullName());
        origPlayer.setPosition(player.getPosition());
        origPlayer = playerRepository.save(origPlayer);
        return HttpResponse
            .noContent()
            .header(HttpHeaders.LOCATION, toUri(origPlayer).getPath());
    }

    @Post("/")
    public HttpResponse create(@Body @Valid Player player) {
        assert player.getId() == null;
        final Player updated = playerRepository.save(player);
        return HttpResponse
            .noContent()
            .header(HttpHeaders.LOCATION, toUri(player).getPath());
    }

    @Delete("/{id}")
    @Transactional(value = Transactional.TxType.REQUIRED)
    public HttpResponse<Player> delete(Long id) {
        Player found = playerRepository.findById(id).orElse(null);
        if (found == null) {
            return HttpResponse.notFound();
        }
        playerRepository.delete(found);
        return HttpResponse.ok(found);
    }

    private URI toUri(Player player) {
        return URI.create("/player/" + player.getId());
    }
}
