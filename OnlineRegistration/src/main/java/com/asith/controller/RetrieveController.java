package com.asith.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.asith.dao.UserDao;
import com.asith.model.User;

@WebServlet("/retrieve")
public class RetrieveController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String search = request.getParameter("search");
		String option = request.getParameter("option");

		List<User> userList = null;

		if (option.equals("uname")) {
			userList = UserDao.retrieveUsers(search);
		} 
		else if (option.equals("field")) {
			userList = UserDao.retrieveFields(search);
		}
		
		if (userList != null) {
			if(userList.isEmpty()) {
				request.setAttribute("userList", userList);
				request.setAttribute("errorMessage", "No users found!");
			}
			else {
				request.setAttribute("userList", userList);
			}
		} 
		else {
			request.setAttribute("userList", userList);
			request.setAttribute("errorMessage", "An error occurred! Please try again.");
		}
		request.getRequestDispatcher("users.jsp").forward(request, response);
	}
}
