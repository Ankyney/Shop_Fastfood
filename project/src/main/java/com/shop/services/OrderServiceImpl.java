package com.shop.services;

import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.querydsl.core.Tuple;
import com.querydsl.jpa.impl.JPAQuery;
import com.shop.entities.Order;
import com.shop.entities.QOrder;
import com.shop.repository.OrderRepository;

@Service
@Transactional
public class OrderServiceImpl implements OrderService {
  
  @PersistenceContext EntityManager em;
  
	@Autowired
	private OrderRepository repo;

	@Override
	public Iterable<Order> findAll() {
		return repo.findAll();
	}

	@Override
	public Order findOne(Long id) {
		return repo.findById(id).get();
	}

	@Override
	public Long save(Order order) {
	  return repo.save(order).getId();
	}

	@Override
	public void update(Order order) {
	  repo.save(order);
	}

	@Override
	public List<Order> getOrder(short status) {
		return repo.findByStatus(status);
	}

  @Override
  public List<Order> getUserOrders(String name) {
    JPAQuery<Order> query = new JPAQuery<Order>(em);
    QOrder qod = QOrder.order;
    
    return query.from(qod).select(qod).where(qod.customerName.eq(name)).orderBy(qod.created.desc()).fetch();
  }

  @Override
  public Long count() {
    return repo.count();
  }

  @Override
  public Double revenueMonth() {
    JPAQuery<Order> query = new JPAQuery<Order>(em);
    QOrder qod = QOrder.order;
    
    int month = Calendar.getInstance().get(Calendar.MONTH) + 1;
    return query.from(qod).select(qod.total.sum()).where(qod.status.eq(Order.success).and(qod.created.month().eq(month))).fetchOne();
  }

  @Override
  public Map<Integer, Double> revenues() {
    JPAQuery<Tuple> query = new JPAQuery<Tuple>(em);
    QOrder qod = QOrder.order;
    List<Tuple> tuples = query.from(qod).select(qod.created.month(), qod.total.sum()).where(qod.status.eq(Order.success)).groupBy(qod.created.month()).fetch();
    Map<Integer, Double> revenues = new HashMap<>();
    for(Tuple tup: tuples) {
      revenues.put(tup.get(0, Integer.class) , tup.get(1, Double.class));
    }
    
    for(int i = 1; i < 13; i ++) {
      if (!revenues.containsKey(i)) {
        revenues.put(i, 0d);
      }
    }
    return revenues;
  }

  
}
