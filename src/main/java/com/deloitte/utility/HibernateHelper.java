package com.deloitte.utility;

import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

public class HibernateHelper {
	
	private static SessionFactory s;
	
	public static SessionFactory getInstance() {
		
		//create a SessionFactory
		
		if(s == null) {
				s = new Configuration()
						.configure("hibernate.cfg.xml")
						.buildSessionFactory();
		}
		return s;

	}
}
