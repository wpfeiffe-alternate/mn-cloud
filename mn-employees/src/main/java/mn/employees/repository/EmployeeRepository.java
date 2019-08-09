package mn.employees.repository;

import io.micronaut.data.annotation.Repository;
import io.micronaut.data.repository.CrudRepository;
import mn.employees.domain.Employee;

import java.util.List;

@Repository
public interface EmployeeRepository extends CrudRepository<Employee, Long>
{
    List<Employee> findByFirstName(String firstName);
    List<Employee> findByActive(Boolean active);
}
