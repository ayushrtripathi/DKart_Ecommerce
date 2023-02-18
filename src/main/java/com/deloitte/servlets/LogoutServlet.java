package com.deloitte.servlets;

import java.io.PrintWriter;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(urlPatterns={"/LogoutServlet"})
public class LogoutServlet extends HttpServlet{
	
	public LogoutServlet() {
		
	}

	public void doGet(HttpServletRequest request, HttpServletResponse response) {
		//HttpSession hs = request.getSession(); 
		response.setContentType("text/html");
		try(PrintWriter out = response.getWriter()){
			
			HttpSession hs = request.getSession();
			hs.removeAttribute("currentuser");
			response.sendRedirect("login.jsp");
			
			//Above line can also be written as request.getSession().removeAttribute("currentuser");
		}	
		catch(Exception e) {
			e.printStackTrace();
		}
	}
}
