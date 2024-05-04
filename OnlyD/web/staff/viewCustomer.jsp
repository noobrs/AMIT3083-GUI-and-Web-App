<%@include file="staffAuthentication.jsp"%>
<%@page import="entity.Customer, java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>All Customers</title>
    </head>
    <body>
        <%@include file="/layout/header.jsp"%>
        
        <%
            List<Customer> custList = (List<Customer>)session.getAttribute("custList");
            if(custList != null){
        %>
        
        <table>
            <tr>
                <th>Name</th>
                <th>Username</th>
                <th>Email</th>
                <th>Phone Number</th>
            </tr>
            <% for(Customer c:custList){ %>
            <tr>
                <td><%= c.getName() %></td>
                <td><%= c.getUsername() %></td>
                <td><%= c.getEmail() %></td>
                <td><%= c.getPhoneNumber() %></td>
            </tr>
            <% } %>
        </table>
        
        <% } else { %>
        <p>Empty Customer Record</p>
        <% } %>
        
        <%@include file="/layout/footer.jsp"%>
    </body>
</html>
