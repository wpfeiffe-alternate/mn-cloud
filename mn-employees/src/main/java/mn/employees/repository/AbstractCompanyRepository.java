package mn.employees.repository;

import io.micronaut.configuration.hibernate.jpa.scope.CurrentSession;
import io.micronaut.data.annotation.Repository;
import io.micronaut.data.repository.CrudRepository;
import mn.employees.domain.Company;

import javax.persistence.EntityManager;

@Repository
public abstract class AbstractCompanyRepository implements CrudRepository<Company, Long>
{
    private final EntityManager entityManager;

    public AbstractCompanyRepository(@CurrentSession EntityManager entityManager)
    {
        this.entityManager = entityManager;
    }

}
