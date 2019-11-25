package com.shop.repository;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.shop.entities.Product;

public interface ProductRepository extends JpaRepository<Product, Long> {

  Optional<Product> findById(Long id);
  
	List<Product> findByNameContaining(String q);
	
	Product findByName(String name);
	
	List<Product> findByPriceBetween(Long from, Long to);
	
	
	List<Product> findByCategoryIdAndPriceBetween(Long id, Long from, Long to);
	
	List<Product> findByCategoryId(Long id);

	@Query(value = "select * FROM product ORDER BY views DESC limit ?1", nativeQuery = true)
	List<Product> findMostViewed(int max);
	
	/*@Query(value = "SELECT product.id, product.name, product.price, product.image, COUNT(product.id) FROM order_detail JOIN product on order_detail.product_id = product.id GROUP BY product_id order BY COUNT(product_id) DESC LIMIT ?1", nativeQuery = true)
	List<Product> findBestSeller(int max);*/
}
