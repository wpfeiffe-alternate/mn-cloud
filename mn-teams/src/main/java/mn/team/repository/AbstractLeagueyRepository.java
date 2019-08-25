package mn.team.repository;

import io.micronaut.configuration.hibernate.jpa.scope.CurrentSession;
import io.micronaut.data.annotation.Repository;
import io.micronaut.data.repository.CrudRepository;
import mn.team.domain.League;

import javax.persistence.EntityManager;

@Repository
public abstract class AbstractLeagueyRepository implements CrudRepository<League, Long>
{
    private final EntityManager entityManager;

    public AbstractLeagueyRepository(@CurrentSession EntityManager entityManager)
    {
        this.entityManager = entityManager;
    }

}
