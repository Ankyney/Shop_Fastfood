package com.shop.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.shop.entities.Category;
import com.shop.repository.CategoryRepository;

@Service
public class CategoryServiceImpl implements CategoryService {

	@Autowired
	private CategoryRepository cateRepo;

	@Override
	public List<Category> findAll() {
		return cateRepo.findAll();
	}

	@Override
	public List<Category> search(String q) {
		return cateRepo.findByNameContaining(q);
	}

	@Override
	public Category findOne(long id) {
		return cateRepo.findById(id).get();
	}

	@Override
	public void save(Category category) {
		cateRepo.save(category);
	}

	@Override
	public void delete(long id) {
		cateRepo.deleteById(id);
	}

}
