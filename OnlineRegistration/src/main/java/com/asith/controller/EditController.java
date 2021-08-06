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

@WebServlet("/edit")
public class EditController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String uname = request.getParameter("uname");				/// User name
		String fname = request.getParameter("fname");				/// First name
		String lname = request.getParameter("lname");				/// Last name
		String email = request.getParameter("email");				/// Email
		String field = request.getParameter("field");				/// Field of interest
		String pass = request.getParameter("pass");				/// Password
		String cpass = request.getParameter("cpass");				/// Confirm password
		
		if(pass.equals(cpass)) {
			
			User u = new User();
			u.setUname(uname);
			u.setFname(fname);
			u.setLname(lname);
			u.setEmail(email);
			u.setField(field);
			u.setPass(pass);
			
			int result = UserDao.editUser(u);
			
			if(result == 0) {
				HttpSession session = request.getSession();
				session.setAttribute("user",u);												/// Update User object that was set as session attribute
				
				response.sendRedirect("profile.jsp");											/// Database was updated successfully
			}
			else {
				if(result == 1) {
					request.setAttribute("errorMessage","Data was not entered into database! Please try again.");			/// Database was not updated properly
				}
				if(result == 2) {
					request.setAttribute("errorMessage","An error occurred! Please try again.");					/// The editUser() method terminated prematurely
				}
				request.getRequestDispatcher("edit.jsp").forward(request,response);
			}
			
		}
		else {
			request.setAttribute("errorMessage","Passwords do not match!");
			request.getRequestDispatcher("edit.jsp").forward(request,response);								/// Password and Confirm Password did not match
		}
	}

}
