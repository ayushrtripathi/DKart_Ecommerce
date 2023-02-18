package com.deloitte.dao;


import java.util.List;

import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

import com.deloitte.entities.Category;
import com.deloitte.utility.HibernateHelper;

public class CategoryDAO {
	private Session s;
	
	public CategoryDAO() {// we are making hibernate session here as whebever a object is created constructor is the first to be invoked.
		this.s=HibernateHelper.getInstance().openSession();
	}

	public int saveCategory(Category c) {
		int catId =0;
		
		try {
			Transaction tx= s.beginTransaction(); //transaction is used in order to either save the data altogether or rollback allof it
			catId =(int) s.save(c);
			tx.commit();
		
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			s.close();
		}
		
		return catId;
		
	}
	
	public List<Category> fetchCategories(){
		List<Category> l = null;
		 //populate l
		//Talk to db
		try {
		Query<Category> q= this.s.createQuery("from Category",Category.class); //its like a typecast you are telling it that it should expect queries contaion category class obj
		l = q.getResultList();
		
		}catch(Exception e) {
			e.printStackTrace();
		}
		finally {
			
			s.close();
		}
		
		
		return l;
	}
	
	public Category fetchCategoryById(Integer cid) {
		Category c = null;
		//Retrieve Category from DB
		try {
		c=s.get(Category.class,cid);
		}
		catch(Exception e) {
			e.printStackTrace();
		}finally {
			this.s.close();
		}
		return c;
	}

}
