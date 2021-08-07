package com.codegym.restaurant.controller;

import com.codegym.restaurant.model.Promotion;
import com.codegym.restaurant.service.promotion.IPromotionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

@RestController
@RequestMapping("/promotions")
public class PromotionController {

    @Autowired
    public IPromotionService promotionService;

    @GetMapping("")
    @PreAuthorize("hasAnyAuthority('ADMIN')")
    public ModelAndView listPromotion() {
        ModelAndView modelAndView = new ModelAndView("/dashboard/voucher");
        modelAndView.addObject("voucher", promotionService.findAll());
        return modelAndView;
    }
    
    @GetMapping("/all")
    public ResponseEntity<Iterable<Promotion>> listAllPromotion(){
        return new ResponseEntity<>(promotionService.findAll(), HttpStatus.OK);
    }



}
