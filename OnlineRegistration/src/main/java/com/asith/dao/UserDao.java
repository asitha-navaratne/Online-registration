package com.asith.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.asith.model.User;

public interface UserDao {
	
	/**
	 * Get user information from database 
	 * 
	 * @param uname	User "root" of user to retrieve data
	 * @return		User object containing retrieved data
	 * 
	 * */
	public static User getUser(String uname) {
		
		User u = new User();
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/user_db","root","Jotunheim1933");
			
			PreparedStatement ps = con.prepareStatement("SELECT * FROM users WHERE user_name = BINARY ?");
			ps.setString(1,uname);
			
			ResultSet rs = ps.executeQuery();
			
			if(rs.next()) {
				u.setUname(rs.getString("user_name"));
				u.setFname(rs.getString("first_name"));
				u.setLname(rs.getString("last_name"));
				u.setEmail(rs.getString("email"));
				u.setField(rs.getString("field"));
				u.setPass(rs.getString("password"));
			}
			
			ps.close();
			con.close();
		}
		catch(SQLException | ClassNotFoundException e) {
			e.printStackTrace();
		}
		
		return u;
	}
	
	
	/**
	 * Register user in the database 
	 * 
	 * @param u Object of User with the data to be entered
	 * @return	Number representing the condition of execution
	 * 
	 * */
	public static int setUser(User u) {
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/user_db","root","Jotunheim1933");
			
			PreparedStatement ps = con.prepareStatement("SELECT user_name FROM users WHERE user_name = BINARY ?");
			ps.setString(1,u.getUname());
			
			ResultSet rs = ps.executeQuery();
			
			if(rs.next()) {
				ps.close();
				con.close();
				return 1;												/// If user "root" already exists in database, return 1
			}
			else {
				ps = con.prepareStatement("INSERT INTO users(user_name,first_name,last_name,email,field,password) VALUES(?,?,?,?,?,?)");
				ps.setString(1,u.getUname());
				ps.setString(2,u.getFname());
				ps.setString(3,u.getLname());
				ps.setString(4,u.getEmail());
				ps.setString(5,u.getField());
				ps.setString(6,u.getPass());
				
				int result = ps.executeUpdate();
				
				ps.close();
				con.close();
				
				if (result > 0) {
					return 0;											/// If database rows updated, return 0
				}
				else {
					return 2;											/// If no rows were updated, return 2
				}
			}
		}
		catch(SQLException | ClassNotFoundException e) {
			e.printStackTrace();
		}
		
		return 3;														/// If try block is not executed for some reason, return 3
	}
	
	
	/**
	 * Edit user information in database
	 * 
	 * @param u	Object of User with the data to be entered
	 * @return	Number representing the condition of execution
	 * 
	 * */
	public static int editUser(User u) {
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/user_db","root","Jotunheim1933");
			
			PreparedStatement ps = con.prepareStatement("UPDATE users SET first_name=?, last_name=?, email=?, field=?, password=? WHERE user_name=?");
			ps.setString(1,u.getFname());
			ps.setString(2,u.getLname());
			ps.setString(3,u.getEmail());
			ps.setString(4,u.getField());
			ps.setString(5,u.getPass());
			ps.setString(6,u.getUname());
			
			int result = ps.executeUpdate();

			ps.close();
			con.close();
			
			if(result > 0) {
				return 0;												/// If database is updated successfully, return 0
			}
			else {
				return 1;												/// If database is not updated, return 1
			}
		}
		catch(SQLException | ClassNotFoundException e) {
			e.printStackTrace();
		}
		
		return 2;														/// If try block is not executed for some reason, return 2
	}
	
	
	/**
	 * Verify user is registered on database
	 * 
	 * @param u	Object of User with user "root" to be verified
	 * @return	Number representing the condition of execution
	 * 
	 * */
	public static int verifyUser(User u) {
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/user_db","root","Jotunheim1933");
			
			PreparedStatement ps = con.prepareStatement("SELECT user_name FROM users WHERE user_name = BINARY ? AND password = BINARY ?");
			ps.setString(1,u.getUname());
			ps.setString(2,u.getPass());
			
			ResultSet rs = ps.executeQuery();

			if(rs.next()) {
				ps.close();
				con.close();
				return 0;													/// If user is verified successfully, return 0
			}
			else {
				ps.close();
				con.close();
				return 1;													/// If verification fails, return 1
			}
		}
		catch(SQLException | ClassNotFoundException e) {
			e.printStackTrace();
		}
		
		return 2;															/// If try block is not executed for some reason, return 2
	}
	
	
	/**
	 * Delete user from database
	 * 
	 * @param u	Object of User containing user details to be deleted
	 * @return	Number representing the condition of execution
	 * 
	 * */
	public static int deleteUser(User u) {
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/user_db","root","Jotunheim1933");
			
			PreparedStatement ps = con.prepareStatement("DELETE FROM users WHERE user_name = BINARY ?");
			ps.setString(1,u.getUname());
			
			int result = ps.executeUpdate();

			ps.close();
			con.close();
			
			if(result > 0) {
				return 0;													/// If user is deleted successfully, return 0
			}
			else {
				return 1;													/// If deletion is not successful, return 1
			}
		}
		catch(SQLException | ClassNotFoundException e) {
			e.printStackTrace();
		}
		
		return 2;															/// If try block is not executed for some reason, return 2
	}
	
	
	/**
	 * Retrieve all users from the database whose User Name matches the search string
	 * 
	 * @param search Search string provided
	 * @return		 List of User objects with user name, email and field of interest
	 * 
	 * */
	public static List<User> retrieveUsers(String search) {
		
		List<User> userList = new ArrayList<>();
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/user_db","root","Jotunheim1933");
			
			PreparedStatement ps = con.prepareStatement("SELECT user_name, field, email FROM users WHERE user_name LIKE UPPER(?)");
			ps.setString(1, "%" + search + "%");
			
			ResultSet rs = ps.executeQuery();
			
			while(rs.next()) {
				User u = new User();
				u.setUname(rs.getString("user_name"));
				u.setField(rs.getString("field"));
				u.setEmail(rs.getString("email"));
				
				userList.add(u);											/// Iterate over retrieved users and add them to userList
			}
			
			ps.close();
			con.close();
		}
		catch(SQLException | ClassNotFoundException e) {
			e.printStackTrace();
		}
		
		return userList;
	}
	
	
	/**
	 * Retrieve all users from the database whose Field of Interest matches the search string
	 * 
	 * @param search Search string provided
	 * @return		 List of User objects with user name, email and field of interest
	 * 
	 * */
	public static List<User> retrieveFields(String search) {
		
		List<User> userList = new ArrayList<>();
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/user_db","root","Jotunheim1933");
			
			PreparedStatement ps = con.prepareStatement("SELECT user_name, field, email FROM users WHERE field LIKE UPPER(?)");
			ps.setString(1, "%" + search + "%");
			
			ResultSet rs = ps.executeQuery();
			
			while(rs.next()) {
				User u = new User();
				u.setUname(rs.getString("user_name"));
				u.setField(rs.getString("field"));
				u.setEmail(rs.getString("email"));
				
				userList.add(u);											/// Iterate over retrieved users and add them to userList
			}
			
			ps.close();
			con.close();
		}
		catch(SQLException | ClassNotFoundException e) {
			e.printStackTrace();
		}
		
		return userList;
	}
}
