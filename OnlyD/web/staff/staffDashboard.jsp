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
//    if(request.isUserInRole("AdminRole")){
//        request.getRequestDispatcher("/admin/adminDashboard.jsp").forward(request, response);
//    }
%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Staff Dashboard</title>
    </head>
    <body>        
        <%@include file="/layout/header.jsp"%>
        <% if(request.isUserInRole("AdminRole")){ %>
        <p>Welcome Admin,</p>
        <% } else { %>
        <p>Welcome staff <%= staff.getStaffid() %> <%= staff.getName() %>,</p>
        <% } %>
        <p>Choose an action:</p>

        <% if(request.isUserInRole("AdminRole")){ %>
        <h2>Staff</h2>
        <a href="../ViewStaff">View All Staffs</a><br>
        <a href="registerStaff.jsp">Add a staff</a><br>        
        <a href="../LoadStaffList">Delete/Update staff</a><br>
        <% } %>

        <h2>Customer</h2>
        <a href="../ViewCustomer">View All Customers</a><br>
        <% if(request.isUserInRole("AdminRole")){ %>
        <a href="../register.jsp">Add a Customer</a><br>        
        <a href="../LoadCustomerList">Delete/Update customer</a><br>
        <% } %>

        <h2>Product</h2>
        <!--        for user-->
        <a href="../ViewProduct">View All Product</a><br>
        <a href="../ViewProductStaff">Add a Product</a><br>        
        <a href="../LoadProductList">Update Product</a><br>

        <h2>Category</h2>
        <a href="../ViewCategory">View Category</a><br>

        <h2>Promotion</h2>
        <a href="../ViewPromotion">View Promotion</a><br>
        <a href="addPromotion.jsp">Add Promotion</a><br>
        <a href="../LoadPromoList">Update Promotion</a><br>
        
        <% if(request.isUserInRole("AdminRole")){ %>
        <h2>Report Generation</h2>
        <a href="#">View TOP 10 Sold Products</a><br>
        <a href="#">View Sales Records</a><br>
        <% } %>

        <%@include file="/layout/footer.jsp"%>
    </body>
</html>
