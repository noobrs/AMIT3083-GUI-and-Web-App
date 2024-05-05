<%-- 
    Document   : checkout
    Created on : May 5, 2024, 3:33:01 PM
    Author     : Asus
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.List, entity.Productcart, entity.Product" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            List<Productcart> selected = (List<Productcart>)session.getAttribute("selectedCartItem");
            if(selected != null){
        %>

        <h1>CheckOut!</h1>
        <table>
            <tr>
                <th>Product ID</th>
                <th>Product Name</th>
                <th>Price</th>
                <th>Quantity</th>
            </tr>
            <% 
                for (Productcart cartItem : selected) {
                    Product product = cartItem.getProduct();
                    if (product != null) {
                %>
                <tr>
                    <td><%= product.getProductid() %></td>
                    <td><%= product.getName() %></td>
                    <td><%= String.format("%.2f", product.getPrice()) %></td>
                    <td><%= cartItem.getQuantity() %></td>
                </tr>
                <%
                    }}
                %>                
        </table>
        <% } %>
    </body>
</html>