<%-- 
    Document   : cart
    Created on : May 3, 2024, 2:16:59 AM
    Author     : Asus
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.util.List, entity.Productcart, entity.Product" %>
<%@page import="java.util.List, entity.Productcart" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Shopping Cart</title>
    </head>
    <body>
    <h1>Shopping Cart</h1>
    
    <% 
    List<Productcart> productcartList = (List<Productcart>) session.getAttribute("productcartList");
    if (productcartList != null && !productcartList.isEmpty()) {
    %>
    <table border="1">
        <tr>
            <th>Product ID</th>
            <th>Product Name</th>
            <th>Price</th>
            <th>Quantity</th>
        </tr>
        <% 
        for (Productcart cartItem : productcartList) {
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
            }
        } 
        %>
    </table>
    <% 
    } else {
        out.println("No items in the cart.");
    }
    %>
    
    <br>
    <a href="productlist.jsp">Continue Shopping</a>
    <!-- Add checkout button or other options as needed -->
</body>
</html>
