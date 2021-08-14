package com.codegym.restaurant.service.bill;

import com.codegym.restaurant.model.Bill;
import com.codegym.restaurant.repository.IBillRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Optional;

@Service
public class BillService implements IBillService{
	@Autowired
	private IBillRepository billRepository;
	
	@Override
	public Iterable<Bill> findAll () {
		return billRepository.findAll();
	}
	
	@Override
	public Optional<Bill> findById (Long id) {
		return billRepository.findById(id);
	}
	
	@Override
	public Bill save (Bill bill) {
		return billRepository.save(bill);
	}
	
	@Override
	public void remove (Long id) {
	billRepository.deleteById(id);
	}
}
