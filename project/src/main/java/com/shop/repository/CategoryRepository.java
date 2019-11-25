package com.shop.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.shop.entities.Category;

public interface CategoryRepository extends JpaRepository<Category, Long> {
	
	  List<Category> findByNameContaining(String q);
	
}
