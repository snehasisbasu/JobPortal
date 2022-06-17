package com.Servlet;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import com.entity.Jobs;
import com.dao.JobDAO;
import com.DB.DBConnect;


@WebServlet("/update")
public class UpdateJobServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try{
			int id = Integer.parseInt(req.getParameter("id"));
			String title =req.getParameter("title");
			String location = req.getParameter("location");
			String category = req.getParameter("category");
			String status = req.getParameter("status");
			String desc = req.getParameter("desc");
			
			
			
			Jobs j = new Jobs();
			j.setId(id);
			j.setTitle(title);
			j.setDescriptor(desc);
			j.setLocation(location);
			j.setStatus(status);
			j.setCategory(category);
							
			HttpSession session = req.getSession();
			
			JobDAO dao = new JobDAO(DBConnect.getConn());
			boolean f = dao.updateJobs(j);
			if(f){
				session.setAttribute("succMsg","Job Update Successfully..");
				resp.sendRedirect("view_jobs.jsp");
			}
			else{
				session.setAttribute("succMsg","Something on server");
				resp.sendRedirect("view_jobs.jsp");
			}
			}
		catch(Exception e){
			e.printStackTrace();
			}
		}		
}
