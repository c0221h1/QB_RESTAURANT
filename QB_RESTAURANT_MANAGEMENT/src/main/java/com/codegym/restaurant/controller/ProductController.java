package com.codegym.restaurant.controller;

import com.codegym.restaurant.model.Category;
import com.codegym.restaurant.model.Product;
import com.codegym.restaurant.service.category.CategoryService;
import com.codegym.restaurant.service.product.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

@RestController
@RequestMapping("/products")
public class ProductController {

    @Autowired
    private ProductService productService;

    @Autowired
    private CategoryService categoryService;

    @GetMapping("/listProduct")
    @PreAuthorize("hasAnyAuthority('ADMIN')")
    public ModelAndView listProduct() {
        return new ModelAndView("/dashboard/product");
    }

    @GetMapping("/allProduct")
    public ResponseEntity<Iterable<Product>> listAllProduct(){
        return new ResponseEntity<>(productService.findAllByOrderByProductIdDesc(),HttpStatus.OK);
    }

    @GetMapping("/allCategory")
    public ResponseEntity<Iterable<Category>> allCategories(){
        return new ResponseEntity<>(categoryService.findAll(), HttpStatus.OK);
    }
}
