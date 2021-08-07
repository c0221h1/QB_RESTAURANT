package com.codegym.restaurant.service.promotion;

import com.codegym.restaurant.model.Promotion;
import com.codegym.restaurant.repository.IPromotionRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Optional;

@Service
public class PromotionService  implements IPromotionService{

    @Autowired
    private IPromotionRepository promotionRepository;
    @Override
    public Iterable<Promotion> findAll() {
        return promotionRepository.findAll();
    }

    @Override
    public Optional<Promotion> findById(Long id) {
        return promotionRepository.findById(id);
    }

    @Override
    public void save(Promotion promotion) {
        promotionRepository.save(promotion);
    }

    @Override
    public void remove(Long id) {
        promotionRepository.deleteById(id);
    }
}
