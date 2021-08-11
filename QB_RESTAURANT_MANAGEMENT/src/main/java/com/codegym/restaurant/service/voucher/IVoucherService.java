package com.codegym.restaurant.service.voucher;

import com.codegym.restaurant.model.Voucher;
import com.codegym.restaurant.service.IGeneralService;
import org.springframework.data.jpa.repository.Query;

public interface IVoucherService extends IGeneralService<Voucher> {
//	@Query ("select v from Voucher v where v.endDate >= current_date  order by v.voucherId desc")
	Iterable<Voucher> findAllByEndDateDesc();
}
