package mn.team.repository;

import io.micronaut.data.annotation.Repository;
import io.micronaut.data.repository.CrudRepository;
import mn.team.domain.Department;

import java.util.List;

@Repository
public interface DepartmentRepository extends CrudRepository<Department, Long>
{
    List<Department> findByDeptCode(String deptCode);
}
