package com.codegym.restaurant.controller;


import com.codegym.restaurant.model.Desk;
import com.codegym.restaurant.service.desk.DeskService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

@RestController
public class DeskController {

    @Autowired
    private DeskService deskService;

    @GetMapping("/desk")
    public ModelAndView listProduct() {
        return new ModelAndView("/dashboard/desk");
    }

    @GetMapping("/allDesk")
    public ResponseEntity<Iterable<Desk>> listAllDesk(){
        return new ResponseEntity<>(deskService.findAll(), HttpStatus.OK);
    }

}
