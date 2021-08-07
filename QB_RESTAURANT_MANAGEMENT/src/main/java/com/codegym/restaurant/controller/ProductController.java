package com.codegym.restaurant.controller;

import com.codegym.restaurant.model.Category;
import com.codegym.restaurant.model.Product;
import com.codegym.restaurant.service.category.CategoryService;
import com.codegym.restaurant.service.product.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.util.Optional;

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
    
    @GetMapping("/listCategory")
    @PreAuthorize("hasAnyAuthority('ADMIN')")
    public ModelAndView listCategory() {
        return new ModelAndView("/dashboard/product");
    }
    
    @GetMapping("/allProduct")
    public ResponseEntity<Iterable<Product>> listAllProduct(){
        return new ResponseEntity<>(productService.findAllByOrderByProductIdDesc(),HttpStatus.OK);
    }
    
    @GetMapping("/allCategory")
    public ResponseEntity<Iterable<Category>> allCategory(){
        return new ResponseEntity<>(categoryService.findAll(), HttpStatus.OK);
    }
    
    @PostMapping("/createProduct")
    public ResponseEntity<Product> createProduct(@RequestBody Product product){
        return new ResponseEntity<>(productService.save(product),HttpStatus.CREATED);
    }
    
    @DeleteMapping("/{id}")
    public ResponseEntity<Product> deleteProduct(@PathVariable Long id) {
        Optional<Product> productOptional = productService.findById(id);
        if (!productOptional.isPresent()) {
            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
        }
        productService.remove(id);
        return new ResponseEntity<>(HttpStatus.NO_CONTENT);
    }
}
