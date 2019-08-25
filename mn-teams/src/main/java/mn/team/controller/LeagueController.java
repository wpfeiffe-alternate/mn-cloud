package mn.team.controller;

import io.micronaut.http.HttpHeaders;
import io.micronaut.http.HttpResponse;
import io.micronaut.http.annotation.*;
import mn.team.domain.League;
import mn.team.repository.LeagueRepository;

import javax.transaction.Transactional;
import javax.validation.Valid;
import java.net.URI;
import java.util.ArrayList;
import java.util.List;

@Controller("/leagues")
public class LeagueController
{
    private final LeagueRepository leagueRepository;

    public LeagueController(LeagueRepository leagueRepository)
    {
        this.leagueRepository = leagueRepository;
    }

    @Get("/")
    public List<League> all() {
        return (ArrayList<League>) leagueRepository.findAll();
    }

    @Get("/{id}")
    public HttpResponse<League> getById(Long id) {
        League found = leagueRepository.findById(id).orElse(null);
        if (found == null) {
            return HttpResponse.notFound();
        }
        return HttpResponse.ok(found);
    }

    @Put("/{id}")
    @Transactional(value = Transactional.TxType.REQUIRED)
    public HttpResponse update(Long id, @Body @Valid League league) {
        if (league.getId() == null || !league.getId().equals(id)) {
            return HttpResponse.badRequest();
        }
        League origLeague = leagueRepository.findById(id).orElse(null);
        if (origLeague == null) {
            return HttpResponse.notFound();
        }
        origLeague.setLeagueName(league.getLeagueName());
        origLeague = leagueRepository.save(origLeague);
        return HttpResponse
            .noContent()
            .header(HttpHeaders.LOCATION, toUri(origLeague).getPath());
    }

    @Post("/")
    public HttpResponse create(@Body @Valid League league) {
        assert league.getId() == null;
        final League updated = leagueRepository.save(league);
        return HttpResponse
            .noContent()
            .header(HttpHeaders.LOCATION, toUri(league).getPath());
    }

    @Delete("/{id}")
    @Transactional(value = Transactional.TxType.REQUIRED)
    public HttpResponse<League> delete(Long id) {
        League found = leagueRepository.findById(id).orElse(null);
        if (found == null) {
            return HttpResponse.notFound();
        }
        leagueRepository.delete(found);
        return HttpResponse.ok(found);
    }

    private URI toUri(League league) {
        return URI.create("/league/" + league.getId());
    }
}
