<<<<<<< HEAD
package com.codegym.restaurant.service.orderDetail;

import com.codegym.restaurant.model.OrderDetail;
import com.codegym.restaurant.repository.IOrderDetailRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Optional;

@Service
public class OrderDetailService implements IOrderDetailService {

    @Autowired
    private IOrderDetailRepository orderDetailRepository;
    @Override
    public Iterable<OrderDetail> findAll() {
        return orderDetailRepository.findAll();
    }

    @Override
    public Optional<OrderDetail> findById(Long id) {
        return orderDetailRepository.findById(id);
    }

    @Override
    public OrderDetail save(OrderDetail orderDetail) {
        return orderDetailRepository.save(orderDetail);
    }

    @Override
    public void remove(Long id) {
        orderDetailRepository.deleteById(id);
    }
}
=======
package com.codegym.restaurant.service.orderDetail;

import com.codegym.restaurant.model.OrderDetail;
import com.codegym.restaurant.repository.IOrderDetailRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Optional;

@Service
public class OrderDetailService implements IOrderDetailService {

    @Autowired
    private IOrderDetailRepository orderDetailRepository;
    @Override
    public Iterable<OrderDetail> findAll() {
        return orderDetailRepository.findAll();
    }

    @Override
    public Optional<OrderDetail> findById(Long id) {
        return orderDetailRepository.findById(id);
    }

    @Override
    public OrderDetail save(OrderDetail orderDetail) {
        return orderDetailRepository.save(orderDetail);
    }

    @Override
    public void remove(Long id) {
        orderDetailRepository.deleteById(id);
    }
}
>>>>>>> 8c604e44383d00fbd0295616e57c35a2091ab4aa
