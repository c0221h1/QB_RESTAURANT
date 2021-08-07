package com.codegym.restaurant.service.employee;


import com.codegym.restaurant.model.Employee;
import com.codegym.restaurant.security.UserPrincipal;
import org.springframework.security.core.userdetails.UserDetailsService;

public interface IEmployeeService extends UserDetailsService {
    Iterable<Employee> findAll();
    Employee createUser(Employee employee);

    UserPrincipal findByUsername(String username);
}
