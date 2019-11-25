package com.shop.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.shop.entities.OrderDetail;
import com.shop.entities.OrderDetailId;

public interface OrderDetailRepository extends JpaRepository<OrderDetail, OrderDetailId>{
  
  List<OrderDetail> findByIdOrderId(Long id);
}
