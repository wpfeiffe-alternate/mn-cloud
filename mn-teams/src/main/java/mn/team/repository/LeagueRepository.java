package mn.team.repository;

import io.micronaut.data.annotation.Repository;
import io.micronaut.data.repository.CrudRepository;
import mn.team.domain.League;

@Repository
public interface LeagueRepository extends CrudRepository<League, Long>
{
}
