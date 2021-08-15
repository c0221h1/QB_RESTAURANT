package com.codegym.restaurant.service.voucher;

import com.codegym.restaurant.model.Voucher;
import com.codegym.restaurant.service.IGeneralService;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.Optional;

public interface IVoucherService extends IGeneralService<Voucher> {
	
	Iterable<Voucher> findAllByVoucherValid();
	
	Iterable<Voucher> findAllByVoucherExpired();
	
	Iterable<Voucher> findAllByVoucherIsDeleted();
<<<<<<< HEAD

	Iterable<Voucher> findVouchersIsApply();
=======
>>>>>>> 8c604e44383d00fbd0295616e57c35a2091ab4aa
}
