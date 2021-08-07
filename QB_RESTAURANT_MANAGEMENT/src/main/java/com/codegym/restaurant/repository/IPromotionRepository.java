package com.codegym.restaurant.repository;

import com.codegym.restaurant.model.Promotion;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface IPromotionRepository  extends JpaRepository<Promotion, Long> {
}
