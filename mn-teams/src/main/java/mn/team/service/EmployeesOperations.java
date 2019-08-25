package mn.team.service;

import io.reactivex.Flowable;
import io.reactivex.Single;
import mn.team.dto.Employee;

public interface EmployeesOperations {
    Flowable<Employee> findAll();
    Single<Employee> findById(Long id);
}
