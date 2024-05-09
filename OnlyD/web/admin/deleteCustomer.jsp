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
        <title>Delete Customer</title>
    </head>
    <body>
        <%@include file="/layout/header.jsp"%>
        <div class="container mt-5">
            <div class="dashBoard">
                <div class="card card_deco"  style="border: 2px #FFBE00 solid;">

                    <%
                        Customer cust = (Customer)session.getAttribute("custFound");
                        if(cust != null){
                    %>
                    <div class="card-head yellow_black">
                        <h1>Delete Customer</h1>
                    </div>
                    <div class="card-body">
                        <form action="../DeleteCustomer" method="POST" onsubmit="return window.confirm('Confirm delete this customer?')">
                            <div class="input-group mb-3">
                                <span class="input-group-text yellow_black" id="basic-addon1">   
                                    Username
                                </span>
                                <input type="text" name="staffID" value=" <%= cust.getUsername() %>" class="form-control" readonly>
                            </div>

                            <div class="input-group mb-3">
                                <span class="input-group-text yellow_black" id="basic-addon1">   
                                    Name
                                </span>
                                <input type="text" name="staffID" value="<%= cust.getName() %>" class="form-control" readonly>
                            </div>

                            <div class="input-group mb-3">
                                <span class="input-group-text yellow_black" id="basic-addon1">   
                                    Email
                                </span>
                                <input type="text" name="staffID" value=" <%= cust.getEmail() %>" class="form-control" readonly>
                            </div>

                            <div class="input-group mb-3">
                                <span class="input-group-text yellow_black" id="basic-addon1">   
                                    Phone Number
                                </span>
                                <input type="text" name="staffID" value=" <%= cust.getPhoneNumber() %>" class="form-control" readonly>
                            </div>


                            <input class="btn reset_dlt_btn" type="submit" value="Delete Customer">

                        </form>
                    </div>

                    <%
                        } else{
                    %>
                    Customer not found
                    <p><a href="<%=request.getContextPath() + "/" + application.getInitParameter("indexServlet")%>">Back to home page</a></p>
                    <%
                        }
                    %>
                </div>
            </div>
        </div>


        <%@include file="/layout/footer.jsp"%>
    </body>
</html>
