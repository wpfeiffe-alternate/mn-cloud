package mn.team.repository;

import io.micronaut.data.annotation.Repository;
import io.micronaut.data.repository.CrudRepository;
import mn.team.domain.Player;

import java.util.List;

@Repository
public interface PlayerRepository extends CrudRepository<Player, Long>
{
    List<Player> findByFullName(String fullName);
    List<Player> findByPosition(String position);
}
