<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <!DOCTYPE html>
    <html>

    <head>
        <meta charset="UTF-8">
        <title>SignUp Page</title>
        <%@ include file="component/css/css.jsp" %>
    </head>

    <body style="background-color: #f0f1f2">
        <%@ include file="component/css/navbar.jsp" %>

            <div class="container-fluid">
                <div class="row p-5">
                    <div class="col-md-4 offset-md-4">
                        <div class="card-body">
                            <div class="text-center">
                                <i class="fa fa-user-plus fa-2x" aria-hidden="true"></i>
                                <h5>Registration</h5>
                            </div>
                            
                            <c:if test="${not empty succMsg }">
                            <h4 class="test-center test-success">${succMsg }</h4>
                            <c:remove var = "succMsg"/>
                            </c:if>
                            
                        </div>
                    </div>
                </div>
            </div>

            <form action="add_user" class="container" method = "post">
                <div class="form-group">


                    <label for="exampleInputPassword1">Enter Full Name</label>
                    <input type="text" class="form-control" id="exampleInputPassword1" placeholder="Full Name" name="name">

                    <label for="exampleInputPassword1">Enter Qualification</label>
                    <input type="text" class="form-control" id="exampleInputPassword1" placeholder="Qualification" name="qua">

                    <label for="exampleInputEmail1">Enter Email</label>
                    <input type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp"
                        placeholder="Enter email" name="email">

                </div>
                <div class="form-group">
                    <label for="exampleInputPassword1">Enter Password</label>
                    <input type="password" class="form-control" id="exampleInputPassword1" placeholder="Password" name="psw">
                </div>
                <div class="form-group">
                    <button type="submit" class="btn btn-primary">Register</button>
                </div>
            </form>
    </body>

    </html>