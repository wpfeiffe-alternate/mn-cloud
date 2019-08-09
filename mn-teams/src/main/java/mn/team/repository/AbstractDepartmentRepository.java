package mn.team.repository;

import io.micronaut.configuration.hibernate.jpa.scope.CurrentSession;
import io.micronaut.data.annotation.Repository;
import io.micronaut.data.repository.CrudRepository;
import mn.team.domain.Department;

import javax.persistence.EntityManager;

@Repository
public abstract class AbstractDepartmentRepository implements CrudRepository<Department, Long>
{
    private final EntityManager entityManager;

    public AbstractDepartmentRepository(@CurrentSession EntityManager entityManager)
    {
        this.entityManager = entityManager;
    }
}
