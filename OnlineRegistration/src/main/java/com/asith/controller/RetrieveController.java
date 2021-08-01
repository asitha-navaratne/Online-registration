package com.asith.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.asith.dao.UserDao;
import com.asith.model.User;

@WebServlet("/retrieve")
public class RetrieveController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		HttpSession session = request.getSession();
		User u = (User) session.getAttribute("user");

		if (u == null) {
			response.sendRedirect("login.jsp");
		}
		else {
			
			List<User> userList = UserDao.retrieveUsers(u.getUname(), u.getField());

			if (userList != null) {
				request.setAttribute("userList", userList);
			} else {
				request.setAttribute("errorMessage", "An error occurred! Please try again.");
			}
			request.getRequestDispatcher("users.jsp").forward(request, response);
		}
	}

}
