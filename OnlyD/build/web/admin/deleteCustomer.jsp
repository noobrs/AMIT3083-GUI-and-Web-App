<%-- 
    Document   : deleteCustomer
    Created on : 29 Apr 2024, 9:49:08 PM
    Author     : Vin Sen
--%>
<%@page import="entity.Customer"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%@include file="/layout/header.jsp"%>
        
        <%
            Customer cust = (Customer)session.getAttribute("custFound");
            if(cust != null){
        %>
        <h1>Delete Customer</h1>
        <form action="../DeleteCustomer" method="POST" onsubmit="return window.confirm('Confirm delete this customer?')">
            <table>
                <tr>
                    <td>Username</td>
                    <td><%= cust.getUsername() %></td>
                </tr>
                <tr>
                    <td>Name</td>
                    <td><%= cust.getName() %></td>
                </tr>
                <tr>
                    <td>Email</td>
                    <td><%= cust.getEmail() %></td>
                </tr>
                <tr>
                    <td>Phone Number</td>
                    <td><%= cust.getPhoneNumber() %></td>
                </tr>
                <input type="submit" value="Delete Customer">
            </table>
        </form>
        <%
            } else{
        %>
        Customer not found
        <p><a href="../index.jsp">Back to home page</a></p>
        <%
            }
        %>
        <%@include file="/layout/footer.jsp"%>
    </body>
</html>
