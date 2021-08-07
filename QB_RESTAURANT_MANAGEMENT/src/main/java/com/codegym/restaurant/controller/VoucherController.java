package com.codegym.restaurant.controller;

import com.codegym.restaurant.model.Voucher;
import com.codegym.restaurant.service.voucher.IVoucherService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

@RestController
@RequestMapping("/vouchers")
public class VoucherController {

    @Autowired
    public IVoucherService voucherService;

    @GetMapping("")
    @PreAuthorize("hasAnyAuthority('ADMIN')")
    public ModelAndView listPromotion() {
        ModelAndView modelAndView = new ModelAndView("/dashboard/voucher");
        modelAndView.addObject("voucher", voucherService.findAll());
        return modelAndView;
    }
    
    @GetMapping("/all")
    public ResponseEntity<Iterable<Voucher>> listAllPromotion(){
        return new ResponseEntity<>(voucherService.findAll(), HttpStatus.OK);
    }



}
