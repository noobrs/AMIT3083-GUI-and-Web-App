<%-- 
    Document   : orderHistory
    Created on : 6 May 2024, 8:59:42 PM
    Author     : Vin Sen
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="custAuthentication.jsp"%>
<%@page import="java.util.List, entity.Customer, entity.Orders, java.text.SimpleDateFormat" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Order History</title>
        <link rel="shortcut icon" type="image/x-icon" href="/OnlyD/layout/favicon_onlyD.ico">
    </head>
    <body>
        <%
            Customer cust = (Customer)session.getAttribute("customer");
            List<Orders> orderList = cust.getOrdersList();
            SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        %>

        <%@include file="/layout/header.jsp"%>
        <div class="container mt-5" style="margin-bottom:200px">
            <h1 style="color: #FFBE00">Order History</h1>

            <%  if(!orderList.isEmpty()) { %>

            <table class="table table-striped tableDeco">
                <tr style="background-color: #FFBE00">
                    <th>Order ID</th>
                    <th>Order Date</th>
                    <th>Total</th>
                    <th></th>
                </tr>

                <% for(int i = orderList.size()-1; i >= 0; i--){ %>
                <tr>
                    <td><%= orderList.get(i).getOrderid() %></td>
                    <td><%= dateFormat.format(orderList.get(i).getOrderdatetime()) %></td>
                    <td><%= orderList.get(i).getTotal() %></td>
                    <td><a href="../ViewOrderDetails?orderidD=<%=orderList.get(i).getOrderid()%>">Details</a></td>
                </tr>

                <% } %>
            </table>

            <% } else { %>
            <p>no order history found!</p>
            <% } %>

            <div style="display: flex; justify-content: center; flex-wrap: nowrap; margin:20px;">
                <a class="btn yellow_black me-2" href="<%=request.getContextPath() + "/" + application.getInitParameter("indexServlet")%>">Home</a>
            </div> 
        </div>
        <%@include file="/layout/footer.jsp"%>
    </body>
</html>