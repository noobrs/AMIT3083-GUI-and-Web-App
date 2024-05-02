<%-- 
    Document   : deleteStaff
    Created on : 29 Apr 2024, 3:10:26 PM
    Author     : Vin Sen
--%>

<%@page import="entity.Staff"%>
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
            Staff staff = (Staff)session.getAttribute("staffFound");
            if(staff != null){
        %>
        <h1>Delete Staff</h1>
        <form action="../DeleteStaff" method="POST" onsubmit="return window.confirm('Confirm delete this staff?')">
            <table>
                <tr>
                    <td>Staff ID</td>
                    <td><%= staff.getStaffid() %></td>
                </tr>
                <tr>
                    <td>Staff Name</td>
                    <td><%= staff.getName() %></td>
                </tr>
                <tr>
                    <td>Staff Email</td>
                    <td><%= staff.getEmail() %></td>
                </tr>
                <input type="submit" value="Delete Staff">
            </table>
        </form>        
        <%
            } else{
        %>
        Staff not found
        <p><a href="../index.jsp">Back to home page</a></p>
        <%
            }
        %>

        <%@include file="/layout/footer.jsp"%>
    </body>
</html>
