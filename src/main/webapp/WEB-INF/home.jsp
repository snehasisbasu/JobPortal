<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 
<%@page import=com.DB.DBConnect %> 
<%@page import=com.entity.Jobs %>
<%@page import="java.util.List" %>
<%@page import="com.DB.DBConnect" %>
<%@page import="com.dao.JobDAO" %>

<%@ taglib prefix='c' uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false" %>
        
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>User: HOME</title>
<%@ include file="component/css/css.jsp" %>
</head>
<body style="background-color: #f0f1f2">

	<%@include file="component/css/navbar.jsp" %>
	
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<h5 class="text-center text-primary">All Jobs</h5>
				
			<%--	<c:if test ="${not empty succMsg}">
				<h4 class="text-center text-danger">${succMsg}</h4>
				<c:remove var="succMsg"/>
				</c:if>  --%>
				
				<div class="card">
					<div class="card-body">
						<form class="form-inline"action="more_view.jsp" method="get">
							<div class="form-group col-md-5 mt-1" >
								<h5>Location</h5>
							</div>
							
							<div class="form-group col-md-4 mt-1">
								<h5>Category</h5>
							</div >
							
							<div class="form-group col-md-5">
								<select name="loc" class="custom-select" id="inlineFormCustomlecPref">
								<option selected value="lo">Choose...</option>
								<option value="Odisha">Odisha</option>
								<option value="Jharkhand">Jharkhand</option>
								<option value="Gujurat">Gujurat</option>
								<option value="Bhubaneswar">Bhubaneswar</option>
								<option value="Delhi">Delhi</option>
								<option value="Banglore">Banglore</option>
								<option value="Chennai">Chennai</option>
								<option value="Hydrabad">Hydrabad</option>
								</select>
							</div>
							
							<div class= "form-group col-md-5">
							<select class="custom-select" id="inlineFormCustomlecPref" name="cat">
							<option value="ca" selected>Choose.. </option>
							<option value="IT">IT</option>
							<option value="Devloper">Devloper </option>
							<option value="Banking">Banking </option>
							<option value="Engineer">Engineer </option>
							<option value= "Teacher">Teacher </option>
							</select>
							</div>
							
							<button class="btn btn-success">Submit </button>
							
						</form>
					</div>
				</div>
			</div>
			</div>
			</div>
			
			<% JobDao dao = new JobDao(DBConnect.getConn());
			List<Jobs> list = dao.getAllJobsForUser();
			for(Job j : list){
			%>
			
			<div class="card mt-2">
				<div class="card-body">
				<div class="text-center text-primary">
					<i class="far fa-clipboard fa-2x"></i>
				</div>
				
				<h6> <%= j.getTitle()%> </h6>
				
				<%
				if(j.getDescriptor().lenght() > 0 && j.getDescriptor().length()< 120){
				%>
				<p><% j.getDescriptor()%>.
				</p>
				
				<% 
				} else{
				%>
				
				<p><%=j.getDescriptor().substring(0,120) %>...</p>
				
				<% 
				}
				%>
				
				<br>
				
				<div class="form-row">
					
					<div class="form-group col-md-3">
						<input type="text" class="form-control form-sm" value="Location: <%=j.getLocation()%>"readonly>
					</div>
					
					<div class="form-group col-md-3">
						<input type="text" class="form-control form-sm" value="Category:<%=j.getCategory()%>"readonly>
					</div>
					
				</div>
				
				<h6>Publish Date:
				<%=j.getPdate().toString() %></h6>
				
				<div class="text-center">
				
				<a href="one_view.jsp?id = <%=j.get.Id()%>"
				 class="btn btn-sm bg-success text-white"> View More </a>
				
				</div>
			</div>	
		 </div>
	
	<%
	}
	%>

</body>
</html>