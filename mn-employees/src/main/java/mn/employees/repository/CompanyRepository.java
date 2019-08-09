package mn.employees.repository;

import io.micronaut.data.annotation.Repository;
import io.micronaut.data.repository.CrudRepository;
import mn.employees.domain.Company;

@Repository
public interface CompanyRepository extends CrudRepository<Company, Long>
{
}
