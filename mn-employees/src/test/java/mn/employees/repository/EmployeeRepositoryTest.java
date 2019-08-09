package mn.employees.repository;

import io.micronaut.test.annotation.MicronautTest;
import mn.employees.domain.Employee;
import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.Test;

import javax.inject.Inject;
import java.util.List;

@MicronautTest
public class EmployeeRepositoryTest
{
    @Inject
    EmployeeRepository employeeRepository;

    @Test
    void testGet() {
        List<Employee> employeeList = (List<Employee>) employeeRepository.findAll();
        Assertions.assertTrue((employeeList != null));
        Assertions.assertEquals(employeeList.size(), 250);
    }

    @Test
    void testGetByActive() {
        List<Employee> employeeList = employeeRepository.findByActive(false);
        Assertions.assertTrue((employeeList != null));
        Assertions.assertEquals(employeeList.size(), 65);

    }



}
