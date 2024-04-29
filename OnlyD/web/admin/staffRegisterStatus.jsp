<%-- 
    Document   : staffRegisterStatus
    Created on : 29 Apr 2024, 1:44:41 PM
    Author     : Vin Sen
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Staff Register Status</title>
    </head>
    <body>
        <%@include file="../layout/header.jsp"%>
        
        <%
        String message = (String)session.getAttribute("staffRegSuccess");
        if(message == null){
        response.sendRedirect("registerStaff.jsp");
            }
        %>
        <%= message %>
        
        Go to <a href="../staff/staffLogin.jsp">Staff Login</a><br>
        Back to <a href="adminDashboard.jsp">Dashboard</a><br>
        <%@include file="../layout/footer.jsp"%>
        
        <%
        session.removeAttribute("staffRegSuccess");
        %>
    </body>
</html>
