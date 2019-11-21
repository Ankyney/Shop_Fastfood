package com.shop.services;

import java.util.List;

import com.shop.entities.Category;

public interface CategoryService {
	
    List<Category> findAll();

    List<Category> search(String q);

    Category findOne(long id);

    void save(Category category);

    void delete(long id);
	
}
