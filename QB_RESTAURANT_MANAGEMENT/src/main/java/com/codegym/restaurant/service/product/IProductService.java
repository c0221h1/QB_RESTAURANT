package com.codegym.restaurant.service.product;

import com.codegym.restaurant.model.Product;
import com.codegym.restaurant.service.IGeneralService;

public interface IProductService extends IGeneralService<Product> {
    Iterable<Product> findAllByOrderByProductIdDesc();
}
