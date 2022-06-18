<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login Page</title>
<%@ include file="/component/css/css.jsp" %>
</head>
<body style="background-color: #f0f1f2">
<%@ include file="/component/css/navbar.jsp" %>
<div class="container-fluid">
<div class="row p-5">
<div class="col-md-4 offset-md-4">
<div class="card-body">
<div class="text-center">
<i class="fa fa-user-plus fa-2x" aria-hidden="true"></i>
<h5>Login Page</h5>
</div>
<c:if test = "${not empty succMsg}">
	<h4 class = "alert alert-danger" role="alert">${succMsg}</h4>
	<c:remove var="succMsg"/>
</c:if>
</div>
</div>
</div>
</div>

<form action="login" method="post" class="container">
  <div class="form-group">
    <label for="exampleInputEmail1">Enter Email</label>
    <input type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" name="email" placeholder="Enter email">
  
  </div>
  <div class="form-group">
    <label for="exampleInputPassword1">Enter Password</label>
    <input type="text" class="form-control" id="exampleInputPassword1" name="password" placeholder="Password">
  </div>
  
  <button type="submit" class="btn btn-primary">Login</button>
</form>
</body>
</html>