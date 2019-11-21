package com.shop.services;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.shop.entities.OrderDetail;
import com.shop.repository.OrderDetailRepository;

@Service
@Transactional
public class OrderDetailServiceImpl implements OrderDetailService {
  
  @Autowired OrderDetailRepository repo;
  
	@Override
	public List<OrderDetail> findByOrderID(Long id) {
		return  repo.findByIdOrderId(id);
	}

	@Override
	public void save(OrderDetail entity) {
		repo.save(entity);
	}

	@Override
	public void update(OrderDetail entity) {
	  repo.save(entity);
	}

  @Override
  public void save(List<OrderDetail> list) {
    repo.saveAll(list);
  }

	
}
