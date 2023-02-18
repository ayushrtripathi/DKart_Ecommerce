package com.deloitte.dao;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.deloitte.entities.Order;
import com.deloitte.entities.OrderProducts;
import com.deloitte.utility.HibernateHelper;

public class OrderDAO {
	
	private Session s;
	
	public OrderDAO() {
		s = HibernateHelper.getInstance().openSession();
	}
	
	//Saving Order into the ORDER_TB
	public int saveOrder(Order o) {
		int orderId = 0;
		
		try {
			
			Transaction tx = s.beginTransaction();
			
				orderId = (int) s.save(o);
				
			tx.commit();
			
			
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			s.close();
		}
		
		
		return orderId;
	}

	public int saveOrderProducts(OrderProducts op) {
	int opId = 0;
		
		try {
			
			Transaction tx = s.beginTransaction();
			
				opId = (int) s.save(op);
				
			tx.commit();
			
			
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			s.close();
		}
		
		
		return opId;
	}
}