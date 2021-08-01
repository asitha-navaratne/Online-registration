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

@WebServlet("/delete")
public class DeleteController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String pass = request.getParameter("pass");
		
		HttpSession session = request.getSession();
		User u = (User)session.getAttribute("user");																	/// Gets User object that was set as session attribute during login
		
		if(u.getPass().equals(pass)) {
			
			int result = UserDao.deleteUser(u);
			
			if(result == 0) {
				session.removeAttribute("user");																		/// Remove User object set as session attribute
				session.invalidate();																					/// Invalidates current session and removes any objects that were bound to the session
				
				response.sendRedirect("login.jsp");																		/// Successfully deleted user from database
			}
			else {
				request.setAttribute("errorMessage","An error occurred! Please try again.");
				request.getRequestDispatcher("delete.jsp").forward(request,response);									/// User was not deleted from the database
			}
		}
		else {
			request.setAttribute("errorMessage","Password is incorrect!");
			request.getRequestDispatcher("delete.jsp").forward(request,response);										/// Incorrect password entered
		}
	}

}
