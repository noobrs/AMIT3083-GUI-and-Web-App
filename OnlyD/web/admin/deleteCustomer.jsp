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
        <title>Delete customer Page</title>
        <%@include file="/layout/meta.html"%>

    </head>
    <body>
        <%@include file="/layout/header.jsp"%>
        <div class=" mainBody mt-5">
            <div class="dashBoard">
                <div class="card" style="width: 50%; border: 2px #FFBE00 solid; background-color: #25182E; text-align: center" >
                    <%
                    Customer cust = (Customer)session.getAttribute("custFound");
                    if(cust != null){
                    %>
                    <div class="card-head yellow_black">
                        <h1>Delete Customer</h1>
                    </div>
                    <div class="card-body">
                        <form action="../DeleteCustomer" method="POST" onsubmit="return window.confirm('Confirm delete this customer?')">
                            <table class="table table-striped tableDeco">
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
                            </table>
                            <div style="display: flex; justify-content: center">
                                <input class="btn" style="background-color: #CA1F3D; color: #FFFFFF" type="submit" value="Delete Customer">
                            </div>
                        </form>
                    </div>

                    <%
                        } else{
                    %>
                    Customer not found
                    <p><a href="../index.jsp">Back to home page</a></p>
                    <%
                        }
                    %>
                </div>
            </div>
        </div>
        <%@include file="/layout/footer.jsp"%>
    </body>
</html>
