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
    public ResponseEntity<Iterable<Voucher>> listVoucher(){
        return new ResponseEntity<>(voucherService.findAllByEndDateDesc(), HttpStatus.OK);
    }
    
    @GetMapping("/add")
    public ModelAndView showCreateForm() {
        ModelAndView modelAndView = new ModelAndView("/dashboard/voucher");
        modelAndView.addObject("voucher", new Voucher());
        return modelAndView;
    }
    
    @PostMapping("/add")
    public ResponseEntity<Voucher> addVoucher(@RequestBody Voucher voucher){
        return new ResponseEntity<>(voucherService.save(voucher), HttpStatus.CREATED);
    }
    
    @PutMapping("/edit/{id}")
    public ResponseEntity<Voucher> editVoucher(@RequestBody Voucher voucher, @PathVariable Long id){
        Optional <Voucher> voucherOptional = voucherService.findById(id);
        if (!voucherOptional.isPresent()) {
            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
        }
        return new ResponseEntity<>(voucherService.save(voucher),HttpStatus.OK);
    }
    
    @GetMapping("/{id}")
    public ResponseEntity<Voucher> voucherResponseEntity(@PathVariable Long id){
        Voucher voucherOptional = voucherService.findById(id).get();
        return new ResponseEntity<>(voucherOptional,HttpStatus.OK);
    }
    
    @DeleteMapping("/delete/{id}")
    public ResponseEntity<Voucher> deleteVoucher(@PathVariable Long id) {
        Optional <Voucher> voucherOptional = voucherService.findById(id);
        if (!voucherOptional.isPresent()) {
            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
        }
        voucherService.remove(id);
        return new ResponseEntity<>(HttpStatus.NO_CONTENT);
    }
    
//    @PostMapping("/{id}")
//    public ResponseEntity<Voucher> restoreVoucher(@PathVariable Long id) {
//        Optional<Voucher> voucherOptional = voucherService.findById(id);
//        if (!voucherOptional.isPresent()) {
//            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
//        }
//        voucherService.restoreVoucherById(id);
//        return new ResponseEntity<>(HttpStatus.NO_CONTENT);
//    }
//
//
//    @GetMapping("/hiddenVoucher")
//    public ModelAndView getAllVoucherHiddenPage() {
//        ModelAndView modelAndView = new ModelAndView("/dashboard/voucher/hiddenVoucher");
//        modelAndView.addObject("hiddenVouchers",voucherService.findAllVoucher_idDesc());
//        return modelAndView;
//    }
    
}
