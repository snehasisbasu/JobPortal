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
//		response.setContentType("text/html");
//		Connection con;
//		PreparedStatement psmt;
		
		try {
//			String driver="com.mysql.jdbc.Driver";
//			Class.forName(driver);
//			String url="jdbc:mysql://localhost:3306/todo";
//			String username="root";
//			String password="thispc";
//			con = DriverManager.getConnection(url, username, password);
			String email=request.getParameter("email");
			String pswd=request.getParameter("password");
////			
//			RequestDispatcher requestDispatcher = request.getRequestDispatcher("/login.jsp");
//			requestDispatcher.include(request, response);
////			
//			System.out.print(email);
			User u = new User();
			HttpSession session = request.getSession();
			
			if("admin@gmail.com".equals(email) && "admin@121".equals(pswd)) {
				session.setAttribute("userobj", u);
				u.setRole("admin");
				response.sendRedirect("admin.jsp");
			}
			else {
				
				UserDAO dao = new UserDAO(DBConnect.getConn());
				User user = dao.login(email, pswd);
				
				if(user!= null) {
					session.setAttribute("userobj", user);
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