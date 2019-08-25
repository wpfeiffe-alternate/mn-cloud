package mn.team.repository;

import io.micronaut.data.annotation.Repository;
import io.micronaut.data.repository.CrudRepository;
import mn.team.domain.Team;

import java.util.List;

@Repository
public interface TeamRepository extends CrudRepository<Team, Long>
{
    List<Team> findByTeamCode(String teamCode);
}
