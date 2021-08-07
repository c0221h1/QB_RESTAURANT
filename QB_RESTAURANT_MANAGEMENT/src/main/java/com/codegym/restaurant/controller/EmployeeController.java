package com.codegym.restaurant.controller;

import com.codegym.restaurant.service.employee.EmployeeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

@Controller
public class EmployeeController {

    @Autowired
    public EmployeeService employeeService;
}
