package com.codegym.restaurant.repository;

import com.codegym.restaurant.model.Employee;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;


@Repository
public interface IEmployeeRepository extends JpaRepository<Employee, Long> {
    Employee findByUsername(String username);
}