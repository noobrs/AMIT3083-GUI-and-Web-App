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
        <%@include file="/layout/meta.html"%>

    </head>
    <body>
        <%@include file="/layout/header.jsp"%>
        <div class=" mainBody mt-5">
            <div class="dashBoard">
                <div class="card" style="width: 50%; border: 2px #FFBE00 solid; background-color: #25182E; text-align: center" >


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

                    <div class="card-head yellow_black" >
                        <h1>Update Customer</h1> 
                    </div>

                    <div class="card-body" >
                        <form action="../UpdateCustomer" method="POST" onsubmit="return window.confirm('Confirm update this customer?')">
                            <table class="table table-striped tableDeco">
                                <tr>
                                    <td>Username</td>
                                    <td>
                                        <input class="form-control" type="text" name="username" value="<%= enteredUsername %>">
                                    </td>
                                </tr>
                                <tr>
                                    <td>Name</td>
                                    <td>
                                        <input class="form-control" type="text" name="name" value="<%= enteredName %>">
                                    </td>
                                </tr>
                                <tr>
                                    <td>Email</td>
                                    <td>
                                        <input class="form-control" type="text" name="email" value="<%= enteredEmail %>">
                                    </td>
                                </tr>
                                <tr>
                                    <td>Phone Number</td>
                                    <td>
                                        <input class="form-control" type="text" name="phoneNumber" value="<%= enteredPhoneNumber %>">
                                    </td>
                                </tr>
                                <tr>
                                    <td>Password</td>
                                    <td>
                                        <input class="form-control" type="password" name="password" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}">
                                    </td>
                                </tr>
                                <tr>
                                    <td>Re-enter Password</td>
                                    <td>
                                        <input class="form-control" type="password" name="rePassword" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}">
                                    </td>
                                </tr>
                            </table>
                            <input class="btn yellow_black" type="submit" value="Update Customer">
                        </form>
                    </div>

                    <% if(errorMessage != null){ %>
                    <div><%= errorMessage %></div> 
                    <%  }
          } else { %>
                    Customer not found
                    <p><a href="../index.jsp">Back to home page</a></p>
                    <% } %>

                </div>
            </div>
        </div>
        <%@include file="/layout/footer.jsp"%>
    </body>
</html>
