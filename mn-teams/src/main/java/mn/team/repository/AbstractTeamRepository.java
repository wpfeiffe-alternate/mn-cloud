package mn.team.repository;

import io.micronaut.configuration.hibernate.jpa.scope.CurrentSession;
import io.micronaut.data.annotation.Repository;
import io.micronaut.data.repository.CrudRepository;
import mn.team.domain.Team;

import javax.persistence.EntityManager;

@Repository
public abstract class AbstractTeamRepository implements CrudRepository<Team, Long>
{
    private final EntityManager entityManager;

    public AbstractTeamRepository(@CurrentSession EntityManager entityManager)
    {
        this.entityManager = entityManager;
    }
}
