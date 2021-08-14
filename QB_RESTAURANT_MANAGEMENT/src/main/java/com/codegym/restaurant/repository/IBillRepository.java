package com.codegym.restaurant.repository;

import com.codegym.restaurant.model.Bill;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.web.bind.annotation.RestController;

@RestController
public interface IBillRepository extends JpaRepository<Bill, Long> {

}
