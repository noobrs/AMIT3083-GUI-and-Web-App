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
                        <input type="email" name="email" value="<%= enteredEmail %>">
                    </td>
                </tr>
                <tr>
                    <td>Phone Number</td>
                    <td>
                        <input type="tel" name="phoneNumber" value="<%= enteredPhoneNumber %>"  pattern="[0-9]{3}-[0-9]{7}|[0-9]{2}-[0-9]{8}|[0-9]{3}-[0-9]{8}" placeholder="012-34567890">
                    </td>
                </tr>
                <tr>
                    <td>Password</td>
                    <td>
                        <input type="password" name="password" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}">
                    </td>
                </tr>
                <tr>
                    <td>Re-enter Password</td>
                    <td>
                        <input type="password" name="rePassword" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}">
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
