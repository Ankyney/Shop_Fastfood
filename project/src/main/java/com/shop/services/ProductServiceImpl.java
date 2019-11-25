package com.shop.services;

import java.util.List;
import java.util.stream.Collectors;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.querydsl.core.Tuple;
import com.querydsl.jpa.impl.JPAQuery;
import com.shop.entities.Category;
import com.shop.entities.Product;
import com.shop.entities.QOrderDetail;
import com.shop.entities.QProduct;
import com.shop.repository.ProductRepository;

@Service
@Transactional
public class ProductServiceImpl implements ProductService {

	@Autowired
	private ProductRepository repo;

	@PersistenceContext
	private EntityManager entityManager;
	
	@Override
	public Iterable<Product> findAll() {
		// TODO Auto-generated method stub
		return repo.findAll();
	}

	@Override
	public List<Product> search(String q) {
		// TODO Auto-generated method stub
		return repo.findByNameContaining(q);
	}

	@Override
	public Product findOne(Long id) {
		// TODO Auto-generated method stub
		return repo.findById(id).get();
	}

	@Override
	public void save(Product product) {
		// TODO Auto-generated method stub
	  repo.save(product);
	}

	@Override
	public void delete(Long id) {
		// TODO Auto-generated method stub
	  repo.deleteById(id);
	}

	@Override
	@SuppressWarnings("unchecked")
	public List<Product> searchByCateID(Long id) {
		return repo.findByCategoryId(id);
	}

	@Override
	@SuppressWarnings("unchecked")
	public List<Product> SearchByPriceRange(Long from, Long to) {
		// TODO Auto-generated method stub
		return repo.findByPriceBetween(from, to);
	}

	@Override
	@SuppressWarnings("unchecked")
	public List<Product> SearchByCateAndPriceRange(Long id, Long from, Long to) {
		return repo.findByCategoryIdAndPriceBetween(id, from, to);
	}

  @Override
	public void update(Product product) {
		// TODO Auto-generated method stub
		repo.save(product);
	}

	@Override
	@SuppressWarnings("unchecked")
	public List<Product> getByBestSeller(int topNumber) {
	  JPAQuery<Tuple> query = new JPAQuery<>(entityManager); 
	  QProduct prod = QProduct.product;
	  QOrderDetail od = QOrderDetail.orderDetail;

	  return query.select(prod.id, prod.name, prod.price, prod.image, prod.id.count(), prod.category.id)
	       .from(prod, od)
	       .where(prod.id.eq(od.id.product.id))
         .groupBy(prod.id)
         .orderBy(prod.id.desc())
	       .fetch().stream().map( i -> {
	         Product p = new Product();
	         p.setId(i.get(0, Long.class));
	         p.setName(i.get(1, String.class));
	         p.setPrice(i.get(2, Long.class));
	         p.setImage(i.get(3, String.class));
	         Category c = new Category();
	         c.setId(i.get(4, Long.class));
	         p.setCategory(c);
	         return p;
	       }).collect(Collectors.toList());
	}

	@Override
	@SuppressWarnings("unchecked")
	public List<Product> getByMostViews(int topNumber) {
		// TODO Auto-generated method stub
		return repo.findMostViewed(topNumber);
	}

	@Override
	public Product findByName(String name) {
		// TODO Auto-generated method stub
		return repo.findByName(name);
	}

  @Override
  public Long count() {
    return repo.count();
  }
}
