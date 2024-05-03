<%-- 
    Document   : staffDashboard
    Created on : 26 Apr 2024, 4:36:31 PM
    Author     : Vin Sen
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="entity.Staff, entity.Customer" %>
<jsp:useBean id="staff" class="entity.Staff" scope="session"></jsp:useBean>

<%@include file="staffAuthentication.jsp"%>
<%
    if(request.isUserInRole("AdminRole")){
        request.getRequestDispatcher("/admin/adminDashboard.jsp").forward(request, response);
    }
%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Staff Dashboard</title>
    </head>
    <body>        
        <%@include file="/layout/header.jsp"%>
        <p><%= staff.getStaffid() %></p>
        <p><%= staff.getName() %></p>
        <p><%= staff.getEmail() %></p>
        <p><%= staff.getPassword() %></p>

        <form action="../logout">
            <input type="submit" value="log out">
        </form>

        <%@include file="/layout/footer.jsp"%>
    </body>
</html>
