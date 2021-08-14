package com.codegym.restaurant.controller;

import com.codegym.restaurant.service.bill.IBillService;
import com.codegym.restaurant.service.order.IOrderService;
import com.codegym.restaurant.service.voucher.IVoucherService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

@RestController
public class BillController {
	@Autowired
	public IOrderService orderService;
	
	@Autowired
	public IBillService billService;
	
	@GetMapping ("/listBill")
	@PreAuthorize ("hasAnyAuthority('ADMIN')")
	public ModelAndView listAllBill() {
		ModelAndView modelAndView = new ModelAndView("/dashboard/bill/listBill");
		return modelAndView;
	}
	
}
