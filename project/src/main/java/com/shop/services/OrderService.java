package com.shop.services;

import java.util.List;
import java.util.Map;

import com.shop.entities.Order;

public interface OrderService {

	Iterable<Order> findAll();
	
	List<Order> getOrder(short status);

	Order findOne(Long id);

	Long save(Order order);

	void update(Order order);

	List<Order> getUserOrders(String username);
	
	Long count();
	
	Double revenueMonth();
	
	Map<Integer, Double> revenues();
}
