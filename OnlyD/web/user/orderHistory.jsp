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
    </head>
    <body>
        <%
            Customer cust = (Customer)session.getAttribute("customer");
            List<Orders> orderList = cust.getOrdersList();
            SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        %>

        <%@include file="/layout/header.jsp"%>

        <h1>Order History</h1>
        <%  if(!orderList.isEmpty()) { %>

        <table>
            <tr>
                <th>Order ID</th>
                <th>Order Date</th>
                <th>Total</th>
            </tr>
            <% for(Orders order : orderList){ %>
            
            <tr>
                <td><%= order.getOrderid() %></td>
                <td><%= dateFormat.format(order.getOrderdatetime()) %></td>
                <td><%= order.getTotal() %></td>
                <td><a href="../ViewOrderDetails?orderidD=<%=order.getOrderid()%>">Details</a></td>
            </tr>
            
            <% } %>
        </table>

        <% } else { %>
        <p>no order history found!</p>
        <% } %>
        <%@include file="/layout/footer.jsp"%>
    </body>
</html>
