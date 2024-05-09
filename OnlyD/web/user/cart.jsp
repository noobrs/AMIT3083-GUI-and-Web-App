<%-- 
    Document   : cart
    Created on : May 3, 2024, 2:16:59 AM
    Author     : Asus
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="custAuthentication.jsp"%>
<%@page import="java.util.List, entity.Productcart, entity.Product, entity.Customer" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Shopping Cart</title>
    </head>
    <body>
        <%@include file="/layout/header.jsp"%>
        <div class="container mt-5" style="margin-bottom: 260px">
            <h1 style="color: #FFBE00">Shopping Cart</h1>

            <%
            // Retrieve the error message from the session attribute
            String errorMessage = (String) session.getAttribute("errorMessage");
            if (errorMessage != null && !errorMessage.isEmpty()) {
            %>
            <div style="color: red;"><%= errorMessage %></div>
            <%
                session.removeAttribute("errorMessage");
            }
            %>

            <% 
            List<Productcart> productcartList = (List<Productcart>) session.getAttribute("productcartList");
            Customer cust = (Customer)session.getAttribute("customer");
            if (productcartList != null && !productcartList.isEmpty()) {
            %>


            <form action="../Checkout" method="post">
                <table class="table table-striped tableDeco" border="1">
                    <tr style="background-color: #FFBE00">
                        <th>Product ID</th>
                        <th>Product Name</th>
                        <th>Price</th>
                        <th>Quantity</th>
                        <th>Checkout</th>
                        <th></th>
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
                <button class="btn yellow_black" type="submit">Checkout</button>
            </form>
  
                <% 
                } else {
                    out.println("No items in the cart.");
                }
                %>
                <br>
            <p>OR</p>
            <a class="btn yellow_black" href="../ViewProduct">Continue Shopping</a>
        </div>
        <%@include file="/layout/footer.jsp"%>
    </body>
</html>