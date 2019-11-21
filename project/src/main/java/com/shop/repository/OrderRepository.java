package com.shop.repository;

import java.util.List;

import org.springframework.data.repository.CrudRepository;

import com.shop.entities.Order;

public interface OrderRepository extends CrudRepository<Order, Long>  {
  List<Order> findByStatus(short status);
  
}
