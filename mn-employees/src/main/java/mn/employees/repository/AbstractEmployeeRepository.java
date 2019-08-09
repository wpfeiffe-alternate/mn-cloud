package mn.employees.repository;

import io.micronaut.configuration.hibernate.jpa.scope.CurrentSession;
import io.micronaut.data.annotation.Repository;
import io.micronaut.data.repository.CrudRepository;
import mn.employees.domain.Employee;

import javax.persistence.EntityManager;
import javax.transaction.Transactional;

@Repository
public abstract class AbstractEmployeeRepository implements CrudRepository<Employee, Long>
{
    private final EntityManager entityManager;

    public AbstractEmployeeRepository(@CurrentSession EntityManager entityManager)
    {
        this.entityManager = entityManager;
    }

    @Transactional(value = Transactional.TxType.REQUIRED)
    public Employee update(Employee employee) {
        return this.entityManager.merge(employee);
    }
}
