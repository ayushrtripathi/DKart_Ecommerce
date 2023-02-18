package com.deloitte.servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.deloitte.entities.User;
import com.deloitte.utility.HibernateHelper;

//if you have both web.xml file configured with url mapping of this servlet along with @webservlet annotations. error might come. use any one of it. delete the web.xml file if needed.
@WebServlet(urlPatterns={"/RegistrationServlet"})
public class RegistrationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public RegistrationServlet() {
        super();

    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
	
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			response.setContentType("text/html"); //this tells how your content needs to be printed
			Session s = null;
			//PrintWriter x = response.getWriter(); //helps us write in htmlpages through java
		try(PrintWriter x = response.getWriter()) {
			String userName = request.getParameter("userName");
			String emailId = request.getParameter("emailId");
			String password = request.getParameter("password");
			String phone = request.getParameter("phone");
			String address = request.getParameter("address");

			//Server Side validation
			if(userName.isEmpty()) {
				x.println("Name is blank");
				return;
			}
			
			User u = new User(userName, emailId, password, phone, address,"default.jpg","enduser");
			
			//Use hibernate "Session" to save object to DB
			//Session from SessionFactory for Hibernate
			
			s = HibernateHelper.getInstance().openSession();
			HttpSession hs = request.getSession();
			Transaction t = s.beginTransaction();
			int uId = (int) s.save(u); //will create a record in db and return something which is serializable (int type)
			//once you get a uId you can know that its successfull.
			t.commit();
			s.close();
			
			x.println("<h1>User Successfully Registered!</h1><br>");
			x.println("User ID generated >> "+ uId);
			
			String m = ("User id is successfully registered : "+uId);
			hs.setAttribute("success", m);
			
			response.sendRedirect("registration.jsp");
			x.close();
		}
		catch(Exception e){
			e.printStackTrace();
		}
		finally {
			s.close();
		}
	}

}
