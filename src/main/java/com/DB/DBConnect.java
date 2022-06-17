package com.DB;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

import jakarta.servlet.ServletException;


public class DBConnect {

	private static Connection conn;
	
	public static Connection getConn() throws ClassNotFoundException, ServletException, SQLException  {
		
		try {
			if(conn==null) {
				Class.forName("com.mysql.cj.jdbc.Driver");
				 final String PASS = ""; 

				conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/jobportal", "root", PASS);
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		
		return conn;
		
	}
}