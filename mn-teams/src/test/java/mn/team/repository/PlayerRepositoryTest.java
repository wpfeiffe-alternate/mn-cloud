package mn.team.repository;

import io.micronaut.test.annotation.MicronautTest;
import mn.team.domain.Player;
import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.Test;

import javax.inject.Inject;
import java.util.List;

@MicronautTest
public class PlayerRepositoryTest
{
    @Inject
    PlayerRepository playerRepository;

    @Test
    void testGet() {
        List<Player> playerList = (List<Player>) playerRepository.findAll();
        Assertions.assertTrue((playerList != null));
        Assertions.assertEquals(playerList.size(), 250);
    }

    @Test
    void testGetByPosition() {
        List<Player> playerList = playerRepository.findByPosition("Catcher");
        Assertions.assertTrue((playerList != null));
        Assertions.assertEquals(playerList.size(), 65);

    }



}
