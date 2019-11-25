package com.shop.services;

import java.util.List;

import com.shop.entities.OrderDetail;

public interface OrderDetailService {

	List<OrderDetail> findByOrderID(Long id);
	
	void save(OrderDetail orderDetail);
	
	void update(OrderDetail orderDetail);
	
	void save(List<OrderDetail> list);

}
