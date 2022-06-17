package com.Servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;


import com.DB.DBConnect;
import com.dao.UserDAO;
import com.entity.User;


@WebServlet("/add_user")
public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			String name = request.getParameter("name");
			String qua = request.getParameter("qua");
			String email = request.getParameter("email");
			String ps = request.getParameter("psw");
			
			UserDAO dao = new UserDAO(DBConnect.getConn());
			
			User u = new User(name,email,ps,qua,"user");
			boolean f = dao.addUser(u);
			
			HttpSession session = request.getSession();
			if(f) {
				session.setAttribute("succMsg","Registration Successfully");
				response.sendRedirect("signup.jsp");
			}else {
				session.setAttribute("succMsg","Something wrong on server");
				response.sendRedirect("signup.jsp");
			}
			
		} catch(Exception e) {
			e.printStackTrace();
		}
		
	}

}
