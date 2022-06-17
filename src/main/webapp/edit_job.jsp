<%@page import='com.entity.Jobs' %>
<%@page import='com.DB.DBConnect' %>
<%@page import='com.dao.JobDAO' %>
<%@page import='com.entity.User' %>


<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix='c' uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit Jobs</title>
<%@include file="component/css/css.jsp" %>

</head>
<body style="backgrond-color: #f0f1f2;">
<%@include file="component/css/navbar.jsp" %>

	<div class="continer p-2">
		<div class="col-md-10 offset-md-1">
			<div class="card">
				<div class="card-body">
					<div class="text-center text-success">
						<i class="fa fa-user-friends fa-3x"></i>
						<!--<c:if test = "${not empty succMsg}">
							<div class = "alert alert-sucess" role="alert">${succMsg}</div>
							<c:remove var="succMsg"/>
						</c:if> -->
						
						<%int id = Integer.parseInt(request.getParameter("id"));
						JobDAO dao = new JobDAO(DBConnect.getConn());
						Jobs j = dao.getJobById(id);
						%>
						
						
						
						<h5>Edit Jobs</h5>
					</div>
					<form action="update" method="post">
					<input type = "hidden" value="<%=j.getId() %>" name="id">
						<div class="form-group">
							<label>Enter Title</label><input type="text" name="title" required class="form-control" value ="<%=j.getTitle() %>">
						</div>
						<div class="form-row">
							<div class="form-group col-md-4">
							<label>Location</label><select name="location" class="custom-select" id="inline">
							<option value = "<%=j.getLocation()%>"><%=j.getLocation()%></option>
							<option value="Odisha">Odisha</option>
							<option value="Jharkhand">Jharkhand</option>
							<option value="Gujurat">Gujurat</option>
							<option value="Bhubaneswar">Bhubaneswar</option>
							<option value="Delhi">Delhi</option>
							<option value="Banglore">Bangalore</option>
							<option value="Chennai">Chennai</option>
							<option value="Hydrabad">Hydrabad</option>
							</select>
							</div>
							<div class="form-group col-md-4">
								<label>Category</label><select class="custom-select" id="inline" name="category">
								<option value="<%=j.getCategory()%>"><%=j.getCategory()%></option>
								<option value="IT">IT</option>
								<option value="Devloper">Developer</option>
								<option value="Banking">Banking</option>
								<option value="Engineer">Engineer</option>
								<option value="Teacher">Teacher</option>
								</select>
							</div>
							<div class="form-group col-md-4">
							<label>Status</label><select class="form-control" name="status">
								<option class="Active" value="<%=j.getStatus() %>"><%=j.getStatus() %></option>
								<option class="Active" value="Active">Active</option>
								<option class="InActive" value="InActive">Inactive</option>
								</select>
							</div>
						</div>
						<div class="for-group">
						<label> Enter Description <i class='far fa-edit' style='font-size:15px ; color:green'></i></label>
						<textarea rows="6" cols="" name="desc" class="form-control"><%=j.getDescriptor() %></textarea>
						 </div>
						 <br>
						 <button class="btn btn-success">Update Job</button>
					</form>
				</div>
			</div>
		</div>
	</div>
</body>
</html>