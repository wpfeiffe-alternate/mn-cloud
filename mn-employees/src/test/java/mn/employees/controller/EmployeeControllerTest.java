package mn.employees.controller;

import io.micronaut.context.ApplicationContext;
import io.micronaut.core.type.Argument;
import io.micronaut.http.HttpRequest;
import io.micronaut.http.HttpResponse;
import io.micronaut.http.HttpStatus;
import io.micronaut.http.client.HttpClient;
import io.micronaut.runtime.server.EmbeddedServer;
import mn.employees.domain.Employee;
import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.Test;

import java.util.List;

//@MicronautTest
public class EmployeeControllerTest {
    private static EmbeddedServer server;
    private static HttpClient client;

    @BeforeAll
    public static void setupServerClient() {
        server = ApplicationContext.run(EmbeddedServer.class);
        client = server
            .getApplicationContext()
            .createBean(HttpClient.class, server.getURL());
    }

    @AfterAll
    public static void stopServerClient() {
        if(server != null) {
            server.stop();
        }
        if(client != null) {
            client.stop();
        }
    }

    @Test
    void testGet()
    {
        HttpResponse<List<Employee>> response = client.toBlocking().exchange(HttpRequest.GET("/employees"), Argument.listOf(Employee.class));
        Assertions.assertEquals(response.getStatus(), HttpStatus.OK);
        Assertions.assertTrue(response.getBody().isPresent());
        Assertions.assertEquals(response.getBody().get().size(), 250);
    }

    @Test
    void testGetByActive()
    {
        HttpResponse<List<Employee>> response = client.toBlocking().exchange(HttpRequest.GET("/employees/findBy?active=true"), Argument.listOf(Employee.class));
        Assertions.assertEquals(response.getStatus(), HttpStatus.OK);
        Assertions.assertTrue(response.getBody().isPresent());
        Assertions.assertEquals(response.getBody().get().size(), 185);
    }
}
