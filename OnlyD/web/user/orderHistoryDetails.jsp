<%-- 
    Document   : orderHistoryDetails
    Created on : 6 May 2024, 9:31:50 PM
    Author     : Vin Sen
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="custAuthentication.jsp"%>
<%@page import="java.util.List, entity.Customer, entity.Orders, entity.Productorder, entity.Product, java.text.SimpleDateFormat" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Order Details</title>
    </head>
    <body>
        <%
            Customer cust = (Customer)session.getAttribute("customer");
            Orders selectedOrder = (Orders)session.getAttribute("selectedOrderD");
            List<Productorder> productorderList = selectedOrder.getProductorderList();
            SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        %>

        <%@include file="/layout/header.jsp"%>
        
        <h1>Order Details</h1>
        <% if(!productorderList.isEmpty()) { %>
        <p>Order ID : <%= selectedOrder.getOrderid()%></p>
        <p>Order Date : <%= dateFormat.format(selectedOrder.getOrderdatetime())%></p>
        <p>Shipping address : <%= selectedOrder.getShippingaddress()%></p>

        <table>
            <tr>
                <th>Product Name</th>
                <th>Quantity</th>
            </tr>
        <% for(Productorder po : productorderList) { %>
        <tr>
            <td><%= po.getProduct().getName() %></td>
            <td><%= po.getQuantity() %></td>
        </tr>
        <% } %>       
        </table>

        <p>Payment Type : <%= selectedOrder.getPaymenttype()%></p>
        <p>Subtotal : <%= selectedOrder.getSubtotal()%></p>
        <p>Discount : <%= selectedOrder.getTotaldiscount()%></p>
        <p>Shipping fee : <%= selectedOrder.getShippingfee()%></p>
        <p>Total : <%= selectedOrder.getTotal()%></p>
        <% } %>
        
        <%@include file="/layout/footer.jsp"%>
    </body>
</html>
