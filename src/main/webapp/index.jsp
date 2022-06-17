<%@page import='com.entity.Jobs' %>
<%@page import='com.DB.DBConnect' %>
<%@page import='com.dao.JobDAO' %>
<%@page import='com.entity.User' %>
<%@page import='java.sql.Connection' %>


<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <!DOCTYPE html>
    <html>

    <head>
        <meta charset="UTF-8">
        <title>Insert title here</title>
        <%@ include file="component/css/css.jsp" %>
            <style type="text/css">
                .back-img {
                    background: url("component/img/background_img.jpg");
                    width: 100%;
                    height: 90vh;
                    backgroung-repeat: no-repeat;
                    background-size: cover;

                }
            </style>
    </head>

    <body>
        <%@ include file="component/css/navbar.jsp" %>
        
        <%-- Connection conn = DBConnect.getConn();
        out.println(conn);--%> 
        
        
                <div class="container-fluid back-img">
                    <div class="text-center">
                        <h1 class=" p-4">
                            Online Job Portal
                        </h1>
                    </div>
                </div>

                <%@ include file="component/css/footer.jsp" %>
    </body>

    </html>