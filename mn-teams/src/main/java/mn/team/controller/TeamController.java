package mn.team.controller;

import com.sun.istack.Nullable;
import io.micronaut.http.HttpHeaders;
import io.micronaut.http.HttpResponse;
import io.micronaut.http.annotation.*;
import mn.team.domain.Team;
import mn.team.repository.TeamRepository;

import javax.transaction.Transactional;
import javax.validation.Valid;
import java.net.URI;
import java.util.ArrayList;
import java.util.List;

@Controller("/teams")
public class TeamController
{
    private final TeamRepository teamRepository;

    public TeamController(TeamRepository teamRepository)
    {
        this.teamRepository = teamRepository;
    }

    @Get("/")
    public List<Team> all() {
        return (ArrayList<Team>) teamRepository.findAll();
    }

    @Get("/{id}")
    public HttpResponse<Team> getById(Long id) {
        Team found = teamRepository.findById(id).orElse(null);
        if (found == null) {
            return HttpResponse.notFound();
        }
        return HttpResponse.ok(found);
    }

    @Get("/findBy{?teamCode}")
    public HttpResponse<List<Team>> getFindBy(@QueryValue @Nullable String teamCode) {
        if (teamCode == null) {
            return HttpResponse.badRequest();
        }
        else {
            return HttpResponse.ok(teamRepository.findByTeamCode(teamCode));
        }
    }



    @Put("/{id}")
    @Transactional(value = Transactional.TxType.REQUIRED)
    public HttpResponse update(Long id, @Body @Valid Team team) {
         if (team.getId() == null || !team.getId().equals(id)) {
            return HttpResponse.badRequest();
        }
        Team origTeam = teamRepository.findById(id).orElse(null);
        if (origTeam == null) {
            return HttpResponse.notFound();
        }
        origTeam.setTeamCode(team.getTeamCode());
        origTeam.setTeamName(team.getTeamName());
        origTeam = teamRepository.save(origTeam);
        return HttpResponse
            .noContent()
            .header(HttpHeaders.LOCATION, toUri(origTeam).getPath());
    }

    @Post("/")
    public HttpResponse create(@Body @Valid Team team) {
        assert team.getId() == null;
        final Team updated = teamRepository.save(team);
        return HttpResponse
            .noContent()
            .header(HttpHeaders.LOCATION, toUri(team).getPath());
    }

    @Delete("/{id}")
    @Transactional(value = Transactional.TxType.REQUIRED)
    public HttpResponse<Team> delete(Long id) {
        Team found = teamRepository.findById(id).orElse(null);
        if (found == null) {
            return HttpResponse.notFound();
        }
        teamRepository.delete(found);
        return HttpResponse.ok(found);
    }

    private URI toUri(Team team) {
        return URI.create("/team/" + team.getId());
    }
}
