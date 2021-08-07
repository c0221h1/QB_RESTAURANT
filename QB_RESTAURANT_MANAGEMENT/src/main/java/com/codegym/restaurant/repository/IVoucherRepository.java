package com.codegym.restaurant.repository;

import com.codegym.restaurant.model.Voucher;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface IVoucherRepository extends JpaRepository<Voucher, Long> {
}
