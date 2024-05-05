<%-- 
    Document   : staffDashboard
    Created on : 26 Apr 2024, 4:36:31 PM
    Author     : Vin Sen
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="entity.Staff" %>
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
        <p>Welcome staff <%= staff.getStaffid() %> <%= staff.getName() %>,</p>
        <p>Choose an action:</p>

        <h2>Customer</h2>
        <a href="../ViewCustomer">View All Customers</a><br>

        <h2>Product</h2>
        <!--        for user-->
        <a href="../ViewProduct">View All Product</a><br>
        <a href="../ViewProductStaff">Add a Product</a><br>        
        <a href="../LoadProductList">Update Product</a><br>

        <h2>Category</h2>
        <a href="../ViewCategory">View Category</a><br>

        <%@include file="/layout/footer.jsp"%>
    </body>
</html>
