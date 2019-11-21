package com.shop.entities;
// default package
// Generated Jun 29, 2017 8:24:48 PM by Hibernate Tools 5.2.3.Final

import javax.persistence.Column;
import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
import javax.persistence.Table;

import com.querydsl.core.annotations.QueryInit;

/**
 * OrderDetail generated by hbm2java
 */
@Entity
@Table(name = "order_detail")
public class OrderDetail implements java.io.Serializable {

	private static final long serialVersionUID = 8698619648286741870L;
	
	@EmbeddedId
  @QueryInit({"order.*", "product.*"})
	private OrderDetailId id;
	
	@Column(name = "quantity", nullable = false)
	private int quantity;
	
	@Column(name = "amount", nullable = false)
	private long amount;

	public OrderDetail() {
	}

	public OrderDetail(OrderDetailId id, int quantity, long amount) {
		this.id = id;
		this.quantity = quantity;
		this.amount = amount;
	}

	
	public OrderDetailId getId() {
		return this.id;
	}

	public void setId(OrderDetailId id) {
		this.id = id;
	}
	
	public int getQuantity() {
		return this.quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	
	public long getAmount() {
		return this.amount;
	}

	public void setAmount(long amount) {
		this.amount = amount;
	}

}
