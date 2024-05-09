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
        <div class="container mt-5">
            <div class="dashBoard">
                <div class="card card_deco"  style="border: 2px #FFBE00 solid;">

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
                    <div class="card-head yellow_black">
                        <h1>Update Customer</h1>
                    </div>
                    <div class="card-body">

                        <form action="../UpdateCustomer" method="POST" onsubmit="return window.confirm('Confirm update this customer?')">
                            <div class="input-group mb-3">
                                <span class="input-group-text yellow_black" id="basic-addon1">
                                    Username
                                </span>
                                <input class="form-control" type="text" name="username" value="<%= enteredUsername %>">
                            </div>
                            <div class="input-group mb-3">
                                <span class="input-group-text yellow_black" id="basic-addon1">
                                    Name
                                </span>
                                <input class="form-control" type="text" name="name" value="<%= enteredName %>">
                            </div>
                            <div class="input-group mb-3">
                                <span class="input-group-text yellow_black" id="basic-addon1">
                                    Email
                                </span>
                                <input class="form-control" type="email" name="email" value="<%= enteredEmail %>">
                            </div>
                            <div class="input-group mb-3">
                                <span class="input-group-text yellow_black" id="basic-addon1">
                                    Phone Number
                                </span>
                                <input class="form-control" type="tel" name="phoneNumber" value="<%= enteredPhoneNumber %>"  pattern="[0-9]{3}-[0-9]{7}|[0-9]{2}-[0-9]{8}|[0-9]{3}-[0-9]{8}" placeholder="012-34567890">
                            </div>
                            <div class="input-group mb-3">
                                <span class="input-group-text yellow_black" id="basic-addon1">
                                    Password
                                </span>
                                    <input class="form-control" type="password" name="password" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}">
                            </div>
                            <div class="input-group mb-3">
                                <span class="input-group-text yellow_black" id="basic-addon1">
                                    Re-enter Password
                                </span>
                                <input class="form-control" type="password" name="rePassword" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}">
                            </div>
                            <div>
                                <input class="btn yellow_black me-2" type="submit" value="Update Customer">
                            </div>
                        </form>

                    </div>
                </div>
            </div>
        </div>
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
