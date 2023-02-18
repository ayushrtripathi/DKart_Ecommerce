package com.deloitte.dao;

import org.hibernate.Session;

import com.deloitte.entities.User;
import com.deloitte.utility.HibernateHelper;

public class UserDAO {

	public User getuserByEmailAndPassword(String email, String password) {
		// TODO Auto-generated method stub
		//2-> execute the query 'q' -> method/API offered by "Hibernate" session
		//this will give a hibernate session = connection object
		
		//transaction is used only for inserting,deleting and changing data in db.
		Session s = HibernateHelper.getInstance().openSession();
		
		String q = "from User where email =: e and password =: p";
		User u = null;
		try {
	//1-> Set the values of e&p -> email and password
	//2-> execute the query 'q' -> method/API offered by "Hibernate" session
		
		u = (User)	s.createQuery(q)
						.setParameter("e", email)
						.setParameter("p", password)
						.uniqueResult(); //this is how you set a parameter for query and get a unique result
						
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		finally {
			s.close();
		}
		
		return u;
		
	}

}
