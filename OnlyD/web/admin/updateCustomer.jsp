<%-- 
    Document   : updateCustomer
    Created on : 29 Apr 2024, 10:00:38 PM
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
            String errorMessage = (String)session.getAttribute("errorMessage");
            
            if(cust != null){
                
                String enteredUsername = (String)session.getAttribute("enteredUsername");
                String enteredName = (String)session.getAttribute("enteredName");
                String enteredEmail = (String)session.getAttribute("enteredEmail");
                String enteredPhoneNumber = (String)session.getAttribute("enteredPhoneNumber");
                
                if(enteredUsername == null || enteredName == null || enteredEmail == null || enteredPhoneNumber == null){
                    enteredUsername = cust.getUsername();
                    enteredName = cust.getName();
                    enteredEmail = cust.getEmail();
                    enteredPhoneNumber = cust.getPhoneNumber();
                }
        %>

        <h1>Update Customer</h1>
        <form action="../UpdateCustomer" method="POST" onsubmit="return window.confirm('Confirm update this customer?')">
            <table>
                <tr>
                    <td>Username</td>
                    <td>
                        <input type="text" name="username" value="<%= enteredUsername %>">
                    </td>
                </tr>
                <tr>
                    <td>Name</td>
                    <td>
                        <input type="text" name="name" value="<%= enteredName %>">
                    </td>
                </tr>
                <tr>
                    <td>Email</td>
                    <td>
                        <input type="text" name="email" value="<%= enteredEmail %>">
                    </td>
                </tr>
                <tr>
                    <td>Phone Number</td>
                    <td>
                        <input type="text" name="phoneNumber" value="<%= enteredPhoneNumber %>">
                    </td>
                </tr>
                <tr>
                    <td>Password</td>
                    <td>
                        <input type="password" name="password">
                    </td>
                </tr>
                <tr>
                    <td>Re-enter Password</td>
                    <td>
                        <input type="password" name="rePassword">
                    </td>
                </tr>
            </table>
            <input type="submit" value="Update Customer">
        </form>
        <% if(errorMessage != null){ %>
        <div><%= errorMessage %></div> 
        <%  }
          } else { %>
        Customer not found
        <p><a href="../index.jsp">Back to home page</a></p>
        <% } %>
        <%@include file="/layout/footer.jsp"%>
    </body>
</html>
