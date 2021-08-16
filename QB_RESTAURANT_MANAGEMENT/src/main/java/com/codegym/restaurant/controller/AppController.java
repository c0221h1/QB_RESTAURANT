package com.codegym.restaurant.controller;

import com.codegym.restaurant.model.Order;
import com.codegym.restaurant.service.order.IOrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

@RestController
@RequestMapping("/app")
public class AppController {
    @Autowired
    private IOrderService orderService;

    private String getPrincipal() {
        String userName = null;
        Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        if (principal instanceof UserDetails) {
            userName = ((UserDetails) principal).getUsername();
        } else {
            userName = principal.toString();
        }
        return userName;
    }

    @GetMapping
    @PreAuthorize("hasAnyAuthority('STAFF')")
    public ModelAndView getAllProductPage() {
        ModelAndView modelAndView = new ModelAndView("/client/app");
        modelAndView.addObject("userInfo", getPrincipal());
        return modelAndView;
    }

    @PostMapping("/createOrder")
    public ResponseEntity<Order> createOrder(@RequestBody Order order) {
        return new ResponseEntity<>(orderService.save(order), HttpStatus.CREATED);
    }

    @GetMapping("/getOrder/{id}")
    public ResponseEntity<Order> getOrderByIdTable(@PathVariable Long id) {
        return new ResponseEntity<>(orderService.findByTableId(id).get(), HttpStatus.OK);
    }
}
