package mn.team.repository;

import io.micronaut.data.annotation.Repository;
import io.micronaut.data.repository.CrudRepository;
import mn.team.domain.Company;

@Repository
public interface CompanyRepository extends CrudRepository<Company, Long>
{
}
