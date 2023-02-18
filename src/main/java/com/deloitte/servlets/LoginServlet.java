package com.deloitte.servlets;

import java.io.PrintWriter;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.deloitte.dao.UserDAO;
import com.deloitte.entities.User;

@WebServlet(urlPatterns={"/LoginServlet"})
public class LoginServlet extends HttpServlet{

	public void doPost(HttpServletRequest request, HttpServletResponse response) {
		HttpSession s = request.getSession();
		response.setContentType("text/html");
		
		try(PrintWriter out=response.getWriter()){
			String email = request.getParameter("email");
			String password = request.getParameter("password");
			
			//ServeSide Validation
			
			if(email.isEmpty()) {
				out.println("<h1> Email Id  entered is blank</h1>");
				return;
			}
			
			//Authentication
			//DAO class is only use for data access and nothing else
			
			UserDAO userDao = new UserDAO();
			User u= userDao.getuserByEmailAndPassword(email,password);
			
			if(u==null) {
				s.setAttribute("warning","Invalid Details !! Recheck your credentials");
				response.sendRedirect("login.jsp");
				return;
			}
			else{
				s.setAttribute("currentuser",u);
				//role-based navigation
				if(u.getRole().equals("enduser")) {
					response.sendRedirect("homepage.jsp");
					return;
				}
				else if(u.getRole().equals("admin")) {
					response.sendRedirect("admin.jsp");
					return;
				}
				else {
					out.println("<h1>Role not defined for this user!</h1>");
				}
			}
			
		}
		catch(Exception e){
			e.printStackTrace();
		}
	}
}
