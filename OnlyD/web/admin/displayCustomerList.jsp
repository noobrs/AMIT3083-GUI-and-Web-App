<%-- 
    Document   : displayCustomerList
    Created on : 29 Apr 2024, 9:40:01 PM
    Author     : Vin Sen
--%>
<%@page import="java.util.List, entity.Customer"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    List<Customer> custList = (List)session.getAttribute("custList");
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Customer List</title>
    </head>
    <body>
        <%@include file="/layout/header.jsp"%>
        <div class="container mt-5">
            <div class="dashBoard">
                <div class="card card_deco"  style="border: 2px #FFBE00 solid;">
                    <div class="card-head yellow_black">
                        <h1>Search Customer</h1>
                    </div>
                    <div class="card-body">
                        <form action="searchCustomer.jsp" method="POST">
                            <div class="input-group mb-3">
                                <span class="input-group-text yellow_black" id="basic-addon1">    
                                    Customer Username
                                </span>
                                <select class="form-select" name="username">
                                    <%
                                        for(Customer c:custList){
                                    %>
                                    <option value="<%=c.getUsername()%>">
                                        <%=c.getUsername()%>
                                    </option>
                                    <%
                                        }
                                    %>
                                </select>
                            </div>

                            <div style="display: flex; justify-content: center; flex-wrap: nowrap; margin:20px;">
                                <a class="btn yellow_black me-2" href="../staff/staffDashboard.jsp">Dashboard</a>
                                <input class="btn yellow_black me-2" type="submit" value="Update Customer" name="button"/>  
                                <input class="btn reset_dlt_btn"  type="submit" value="Delete Customer" name="button"/>                
                            </div>

                        </form>
                    </div>
                </div>
            </div>
        </div>


        <%@include file="/layout/footer.jsp"%>
    </body>
</html>
