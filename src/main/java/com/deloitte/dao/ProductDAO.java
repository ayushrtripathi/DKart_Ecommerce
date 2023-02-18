package com.deloitte.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

import com.deloitte.entities.Category;
import com.deloitte.entities.Product;
import com.deloitte.utility.HibernateHelper;

public class ProductDAO {
private Session s;
	
	public ProductDAO() {
		s = HibernateHelper.getInstance().openSession();
	}

	public int saveProduct(Product p) {
		int pId = 0;
		
		try {
			Transaction tx = s.beginTransaction();
			pId = (int) s.save(p);
			tx.commit();		
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			s.close();
		}
		
		
		return pId;
	}
	
	
	///	pDao.fetchProducts();
//fetch only selectrd category
	//pDao.fetchProductsByCatId(catId);
	
	public List<Product> fetchProducts(){
		List<Product> p1= null;
		
		try {
			//Writing HQL
			//using Query
			//getResultList()- all the respective BD records for specified object
			Query<Product> p= this.s.createQuery("from Product ",Product.class); //its like a typecast you are telling it that it should expect queries contaion category class obj
			p1 = p.getResultList();
			
			}catch(Exception e) {
				e.printStackTrace();
			}
		finally {
			s.close();
		}
		return p1;
	}
	
	public List<Product> fetchProductsByCatId(Integer catId){
		List<Product> p1= null;
		
		try {
			//Writing HQL
			//using Query
			//getResultList()- all the respective BD records for specified object
			Query<Product> q= this.s.createQuery("from Product as p where "
													+ "p.category.categoryId =: cid ",Product.class); //its like a typecast you are telling it that it should expect queries contaion category class obj
			q.setParameter("cid",catId);
			p1 = q.getResultList();
			
			}catch(Exception e) {
				e.printStackTrace();
			}
		finally {
			s.close();
		}
		return p1;
	}

	public Product fetchProductById(Integer pId) {
		// TODO Auto-generated method stub
		Product p = null;
				try {
					p = s.get(Product.class, pId);
				}catch(Exception e) {
					e.printStackTrace();
				}finally {
					s.close();
				}
		return p;
	}
}
