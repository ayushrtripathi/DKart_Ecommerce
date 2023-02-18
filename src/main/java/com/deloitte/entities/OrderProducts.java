package com.deloitte.entities;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.ForeignKey;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "ORDER_PRODUCTS_TB")
public class OrderProducts {

	public OrderProducts() {
//dc
	}

	
	@Id
	@Column(length=50, name="id")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	@Column(length=50, name="quantity")
	private int quantity;
	@Column(length=50, name="pricePerUnit")
	private int pricePerUnit;
	
	@ManyToOne
	@JoinColumn(name="ORDER_ID", nullable=false ,foreignKey= @ForeignKey(name="ORDER_DETAILS"))
	private Order order;
	
	@ManyToOne
	@JoinColumn(name="PRODUCT_ID", nullable=false, foreignKey= @ForeignKey(name="PRODUCT_DETAILS"))
	private Product product;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	public int getPricePerUnit() {
		return pricePerUnit;
	}

	public void setPricePerUnit(int pricePerUnit) {
		this.pricePerUnit = pricePerUnit;
	}

	public Order getOrder() {
		return order;
	}

	public void setOrder(Order order) {
		this.order = order;
	}

	public Product getProduct() {
		return product;
	}

	public void setProduct(Product product) {
		this.product = product;
	}

	/**
	 * @param quantity
	 * @param pricePerUnit
	 * @param order
	 * @param product
	 */
	public OrderProducts(int quantity, int pricePerUnit, Order order, Product product) {
		super();
		this.quantity = quantity;
		this.pricePerUnit = pricePerUnit;
		this.order = order;
		this.product = product;
	}

	@Override
	public String toString() {
		return "OrderProducts [id=" + id + ", quantity=" + quantity + ", pricePerUnit=" + pricePerUnit + ", order="
				+ order + ", product=" + product + "]";
	}
	
	
	
	
	
}
