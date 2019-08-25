package mn.team.service;

import io.micronaut.http.annotation.Get;
import io.micronaut.http.client.annotation.Client;
import io.reactivex.Flowable;
import io.reactivex.Single;
import mn.team.dto.Employee;

@Client(id = "mn-employees")
public interface EmployeesClient extends EmployeesOperations {
    @Get("/employees")
    Flowable<Employee> finalAll();

    @Get("/employees/{id}")
    Single<Employee> findById(Long id);
}
