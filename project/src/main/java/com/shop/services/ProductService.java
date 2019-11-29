package com.shop.services;

import java.util.List;

import com.shop.entities.Product;
import com.shop.entities.Users;

public interface ProductService {

	Iterable<Product> findAll();

	List<Product> search(String q);
	
	List<Users> findbyrole();
	
	List<Product> searchByCateID(Long id);
	
	List<Product> SearchByPriceRange(Long from, Long to);
	
	List<Product> SearchByCateAndPriceRange(Long id, Long from, Long to);
	
	Product findOne(Long id);
	
	Product findByName(String name);
	
	List<Product> getByBestSeller(int topNumber);
	
	List<Product> getByMostViews(int topNumber);

	void save(Product product);
	
	void update(Product product);

	void delete(Long id);
	
	void update(Users users);
	
	Long count();
}
