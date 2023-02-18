package com.deloitte.entities;

import java.sql.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="ORDER_TB")
public class Order {

	public Order() {
		//default constructor
	}
	
	@Id
	@Column(length=50, name="id")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	
	@Column(length=50, name="orderNbr")
	private String orderNbr;
	
	@Column(length=50, name="userId")
	private int userId;
	
	@Column(name="orderDate")
	private Date orderDate;
	
	

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getOrderNbr() {
		return orderNbr;
	}

	public void setOrderNbr(String orderNbr) {
		this.orderNbr = orderNbr;
	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public Date getOrderDate() {
		return orderDate;
	}

	public void setOrderDate(Date orderDate) {
		this.orderDate = orderDate;
	}

	/**
	 * @param orderNbr
	 * @param userId
	 * @param orderDate
	 */
	public Order(String orderNbr, int userId, Date orderDate) {
		super();
		this.orderNbr = orderNbr;
		this.userId = userId;
		this.orderDate = orderDate;
	}

	@Override
	public String toString() {
		return "Order [id=" + id + ", orderNbr=" + orderNbr + ", userId=" + userId + ", orderDate=" + orderDate + "]";
	}
	
	
}
