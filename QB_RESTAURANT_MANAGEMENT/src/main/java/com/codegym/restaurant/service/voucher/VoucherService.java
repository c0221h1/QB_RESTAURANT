package com.codegym.restaurant.service.voucher;

import com.codegym.restaurant.model.Voucher;
import com.codegym.restaurant.repository.IVoucherRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Optional;

@Service
public class VoucherService implements IVoucherService {

    @Autowired
    private IVoucherRepository promotionRepository;
    @Override
    public Iterable<Voucher> findAll() {
        return promotionRepository.findAll();
    }

    @Override
    public Optional<Voucher> findById(Long id) {
        return promotionRepository.findById(id);
    }

    @Override
    public void save(Voucher voucher) {
        promotionRepository.save(voucher);
    }

    @Override
    public void remove(Long id) {
        promotionRepository.deleteById(id);
    }
}
