package com.codegym.restaurant.controller;

import com.codegym.restaurant.model.Voucher;
import com.codegym.restaurant.service.voucher.IVoucherService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.util.Optional;

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
    
    @GetMapping("/add")
    public ModelAndView showCreateForm() {
        ModelAndView modelAndView = new ModelAndView("/dashboard/voucher");
        modelAndView.addObject("voucher", new Voucher());
        return modelAndView;
    }
    
    @PostMapping("/add")
    public ResponseEntity<Optional<Voucher>> addVoucher(@RequestBody Voucher voucher){
        return new ResponseEntity<>(voucherService.save(voucher), HttpStatus.CREATED);
    }
    


}
