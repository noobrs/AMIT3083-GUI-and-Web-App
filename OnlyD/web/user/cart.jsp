<%-- 
    Document   : cart
    Created on : May 3, 2024, 2:16:59 AM
    Author     : Asus
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="custAuthentication.jsp"%>
<%@ page import="java.util.List, entity.Productcart, entity.Product" %>
<%@page import="java.util.List, entity.Productcart" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Shopping Cart</title>
</head>
<body>
<%@include file="/layout/header.jsp"%>

<h1>Shopping Cart</h1>

<%
// Retrieve the error message from the session attribute
String errorMessage = (String) session.getAttribute("errorMessage");
if (errorMessage != null && !errorMessage.isEmpty()) {
%>
<div style="color: red;"><%= errorMessage %></div>
<%
}
%>

<% 
List<Productcart> productcartList = (List<Productcart>) session.getAttribute("productcartList");
if (productcartList != null && !productcartList.isEmpty()) {
%>
<form action="../Checkout" method="post">
    <table border="1">
        <tr>
            <th>Product ID</th>
            <th>Product Name</th>
            <th>Price</th>
            <th>Quantity</th>
            <th>Checkout</th>
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
            <td><input type="checkbox" name="selectedProducts" value="<%= product.getProductid() %>"></td> <!-- Add checkbox for each product -->
            <!-- No need for nested form for removal, instead use a link or button -->
            <td><a href="../RemoveFromCart?productId=<%= product.getProductid() %>">Remove</a></td>
        </tr>
        <% 
            }
        } 
        %>
    </table>
    <!-- Checkout button outside the loop -->
    <button type="submit">Checkout</button>
</form>
<% 
} else {
    out.println("No items in the cart.");
}
%>

<br>
<a href="../ViewProduct">Continue Shopping</a>

<%@include file="/layout/footer.jsp"%>
</body>
</html>
