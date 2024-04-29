<%-- 
    Document   : adminDashboard
    Created on : 26 Apr 2024, 2:35:12 PM
    Author     : Vin Sen
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <%@include file="../layout/meta.html"%>
        <title>Admin Dashboard</title>
    </head>
    <body>
        <%@include file="../layout/header.jsp"%>
        
        <a href="registerStaff.jsp">Add a staff</a><br>        
        <a href="../LoadStaffList">Delete/Update staff</a><br>
        <form action="../logout">
            <input type="submit" value="Log Out">
        </form>
        <%= request.isUserInRole("AdminRole") %><br>
        
        
        <%@include file="../layout/footer.jsp"%>
    </body>
</html>
