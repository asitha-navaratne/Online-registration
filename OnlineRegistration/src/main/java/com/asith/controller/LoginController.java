package com.asith.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.asith.dao.UserDao;
import com.asith.model.User;

@WebServlet("/login")
public class LoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String uname = request.getParameter("uname");
		String pass = request.getParameter("pass");
		
		User u = new User();
		u.setUname(uname);
		u.setPass(pass);
		
		int result = UserDao.verifyUser(u);
		
		if(result == 0) {
			u = UserDao.getUser(uname);																/// User verified successfully
			
			if(u != null) {
				HttpSession session = request.getSession();
				session.setAttribute("user",u);														/// Set retrieved user model as session attribute for login validation
				
				response.sendRedirect("profile.jsp");
			}
			else {
				request.setAttribute("errorMessage","An error occurred! Please try again.");		/// Null User object returned from DAO class
				request.getRequestDispatcher("login.jsp").forward(request,response);
			}
			
		}
		else {
			if (result == 1) {
				request.setAttribute("errorMessage","Incorrect user name or password!");			/// User not verified
			}
			else {
				request.setAttribute("errorMessage","An error occurred! Please try again.");		/// The getUser() method terminated prematurely
			}
			request.getRequestDispatcher("login.jsp").forward(request,response);
		}
	}
	
}
