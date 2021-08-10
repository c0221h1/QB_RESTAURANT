package com.codegym.restaurant.service.voucher;

import com.codegym.restaurant.model.Voucher;
import com.codegym.restaurant.service.IGeneralService;
import org.springframework.data.jpa.repository.Query;

import java.util.Optional;

public interface IVoucherService extends IGeneralService<Voucher> {
	
	Iterable<Voucher> findAllByVoucherValid();
	
	Iterable<Voucher> findAllByVoucherExpired();
	
	void changeVoucherStatus();
}