package com.Servlet;

import java.io.IOException;

import com.DB.DBConnect;
import com.dao.UserDAO;
//import java.sql.DriverManager;
//import java.sql.PreparedStatement;
//import java.sql.SQLException;
//import java.sql.Connection;
//import java.io.PrintWriter;
import com.entity.User;

//import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;


@WebServlet("/login")
public class LoginServlet extends HttpServlet{
	private static final long serialVersionUID = 1L;
    

    public LoginServlet() {
        super();
    }

    
    
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		try {
			String email=request.getParameter("email");
			String password=request.getParameter("password");
			User admin = new User();
			HttpSession session = request.getSession();
			
			if("admin@gmail.com".equals(email) && "admin@121".equals(password)) {
				session.setAttribute("userobj", admin);
				admin.setRole("admin");
				response.sendRedirect("admin.jsp");
			}
			else {
				
				UserDAO dao = new UserDAO(DBConnect.getConn());
				User user = dao.login(email, password);
				
				if(user!= null) {
					session.setAttribute("userobj", user);
					user.setRole("user");
					response.sendRedirect("home.jsp");
				}else {
					session.setAttribute("succMsg", "Invalid Email & Password");
					response.sendRedirect("login.jsp");
				}
			}
//			con.close();
//			
//			   
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
}
