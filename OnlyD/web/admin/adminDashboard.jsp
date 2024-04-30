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
        <title>Admin Dashboard</title>
    </head>
    <body>
        <%@include file="../layout/header.jsp"%>        
        
        <%
            String statusMsg = (String)session.getAttribute("statusMsg");
            if(statusMsg != null){
        %>
        <div><%= statusMsg %></div>
        <%
            session.removeAttribute("statusMsg");
            }
        %>
        
        <h2>Staff</h2>
        <a href="../ViewStaff">View All Staffs</a><br>
        <a href="registerStaff.jsp">Add a staff</a><br>        
        <a href="../LoadStaffList">Delete/Update staff</a><br>
        
        <h2>Customer</h2>
        <a href="../ViewCustomer">View All Customers</a><br>
        <a href="../register.jsp">Add a Customer</a><br>        
        <a href="../LoadCustomerList">Delete/Update customer</a><br>
        
        <h2>Product</h2>
        <a href="#">View All Product</a><br>
        <a href="#">Add a Product</a><br>        
        <a href="#">Delete/Update Product</a><br>
        <form action="../logout">
            <input type="submit" value="Log Out">
        </form>
        <%= request.isUserInRole("AdminRole") %><br>
        
        
        <%@include file="../layout/footer.jsp"%>
    </body>
</html>
