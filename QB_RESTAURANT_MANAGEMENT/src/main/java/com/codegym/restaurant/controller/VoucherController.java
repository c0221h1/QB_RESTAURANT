package com.codegym.restaurant.controller;

import com.codegym.restaurant.model.Product;
import com.codegym.restaurant.model.Voucher;
import com.codegym.restaurant.service.voucher.IVoucherService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.util.Date;
import java.util.Optional;

@RestController
@RequestMapping()
public class VoucherController {

    @Autowired
    public IVoucherService voucherService;

    @GetMapping("/vouchers")
    @PreAuthorize("hasAnyAuthority('ADMIN')")
    public ModelAndView listAllVoucher() {
        ModelAndView modelAndView = new ModelAndView("/dashboard/voucher/voucher");
        return modelAndView;
    }
    
    @GetMapping("/voucherExpired")
    @PreAuthorize("hasAnyAuthority('ADMIN')")
    public ModelAndView listAllVoucherExpired() {
        ModelAndView modelAndView = new ModelAndView("/dashboard/voucher/voucher_expired");
        return modelAndView;
    }
    
    @GetMapping("/vouchers/allVoucherValid")
    public ResponseEntity<Iterable<Voucher>> listVoucherValid(){
        return new ResponseEntity<>(voucherService.findAllByVoucherValid(), HttpStatus.OK);
    }
    
    @GetMapping("/voucherExpired/allVoucherExpired")
    public ResponseEntity<Iterable<Voucher>> listVoucherExpired(){
        Iterable<Voucher> list = voucherService.findAllByVoucherExpired();
        for(Voucher voucher : list){
            voucher.setStatus(false);
            voucherService.save(voucher);
        }
        return new ResponseEntity<>(list, HttpStatus.OK);
    }

    @PostMapping("/vouchers/add")
    public ResponseEntity<Voucher> addVoucher(@RequestBody Voucher voucher){
        return new ResponseEntity<>(
                  voucherService.save(voucher), HttpStatus.CREATED);
    }
    
    @GetMapping("/vouchers/{id}")
    public ResponseEntity<Voucher> voucherResponseEntity(@PathVariable Long id){
        Voucher voucherOptional = voucherService.findById(id).get();
        return new ResponseEntity<>(voucherOptional,HttpStatus.OK);
    }
    
    @PutMapping ("/vouchers/edit")
    public ResponseEntity<Voucher> editVoucher(@RequestBody Voucher voucher ){
        Optional <Voucher> voucherOptional = voucherService.findById(voucher.getVoucherId());
        if (!voucherOptional.isPresent()) {
            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
        }else{
//            Date date = new Date();
//            if (voucher.getBeginDate().getTime()<= date.getTime() && voucher.getEndDate().getTime() >= date.getTime()){
//                voucher.setStatus(true);
//            }else {
//                voucher.setStatus(false);
//            }
            return new ResponseEntity<>(voucherService.save(voucher),HttpStatus.OK);
        }
    }
    
    @PutMapping("/changeVoucherStatus")
    public ResponseEntity<Voucher> changeVoucherStatus(@RequestBody Voucher voucher){
        Optional <Voucher> voucherOptional = voucherService.findById(voucher.getVoucherId());
        if (!voucherOptional.isPresent()) {
            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
        }else{
            voucherOptional.get().setStatus(voucher.isStatus());
            return new ResponseEntity<>(voucherService.save(voucherOptional.get()),HttpStatus.OK);
        }
    }
    
    @DeleteMapping("/deleteVoucher/{id}")
    public ResponseEntity<Voucher> deleteVoucher(@PathVariable Long id) {
        Optional <Voucher> voucherOptional = voucherService.findById(id);
        if (!voucherOptional.isPresent()) {
            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
        }
        voucherService.remove(id);
        return new ResponseEntity<>(HttpStatus.OK);
    }
    
}
