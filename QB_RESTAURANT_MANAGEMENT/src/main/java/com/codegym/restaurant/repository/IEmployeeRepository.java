package com.codegym.restaurant.repository;

import com.codegym.restaurant.model.Employee;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.Optional;


@Repository
public interface IEmployeeRepository extends JpaRepository<Employee, Long> {
    Employee findByUsername(String username);

    Optional<Employee> findEmployeeByPhone(Integer phoneNumber);
}
