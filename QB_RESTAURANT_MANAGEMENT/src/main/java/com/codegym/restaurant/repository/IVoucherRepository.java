package com.codegym.restaurant.repository;

import com.codegym.restaurant.model.Voucher;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.Optional;

@Repository
public interface IVoucherRepository extends JpaRepository<Voucher, Long> {

	@Modifying
	@Query ("select v from Voucher v where v.endDate >= current_date  order by v.beginDate desc")
	Iterable<Voucher> findAllByVoucherValid();
	
	@Query("update Voucher  v set v.status = false where v.endDate  < current_date ")
	void changeVoucherStatus();
	
	@Modifying
	@Query ("select v from Voucher v where v.endDate < current_date ")
	Iterable<Voucher> findAllByVoucherExpired();
	

	
	
//	@Transactional
//	@Modifying
//	@Query("update Voucher v set v.isExpired = true where v.voucherId = :id")
//	void deleteVoucherById(@Param ("id") Long id);
//
//	@Query("select v from Voucher v where v.isExpired = true order by v.voucher_id desc")
//	Iterable<Voucher> findAllVoucher_idDesc();
//
//	@Transactional
//	@Modifying
//	@Query("update Voucher v set v.isExpired = false where v.voucher_id = :id")
//	void restoreVoucherById(@Param("id") Long id);
}
