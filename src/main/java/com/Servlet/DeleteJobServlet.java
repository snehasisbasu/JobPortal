package com.Servlet;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import com.DB.DBConnect;
import com.dao.JobDAO;
//import java.sql.Connection;


@WebServlet("/delete")
public class DeleteJobServlet extends HttpServlet{
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {	
		try {
			int id = Integer.parseInt(req.getParameter("id"));
			JobDAO dao = new JobDAO(DBConnect.getConn());
			boolean f = dao.deleteJobs(id);
			
			HttpSession session = req.getSession();
			
			if (f) {
				session.setAttribute("succMsg", "Job Delete Sucessfully..");
				resp.sendRedirect("view_jobs.jsp");
			}else {
				session.setAttribute("succMsg", "Something Went Wrong");
				resp.sendRedirect("view_jobs.jsp");
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
