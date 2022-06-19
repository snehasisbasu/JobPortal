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

@WebServlet("/update_profile")
public class UpdateUserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	try{
			int id = Integer.parseInt(request.getParameter("id"));
			String name =request.getParameter("name");
			String qua = request.getParameter("qua");
			String email = request.getParameter("email");
			String ps = request.getParameter("password");
			
            UserDAO dao = new UserDAO(DBConnect.getConn());
			
            User u = new User();
            u.setId(id);
            u.setName(name);
            u.setQualification(qua);
            u.setPassword(ps);
            u.setEmail(email);
            
           
			boolean f = dao.updateUser(u);
			HttpSession session= request.getSession();
			if(f) {
				session.setAttribute("succMsg","Profile update Successfully");
				response.sendRedirect("home.jsp");
			}else {
				session.setAttribute("succMsg","Something wrong on server");
				response.sendRedirect("home.jsp");
			}
			
		} catch(Exception e) {
			e.printStackTrace();
		}
    	
    	
			}


}
