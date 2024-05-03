<%-- 
    Document   : cart
    Created on : May 3, 2024, 2:16:59 AM
    Author     : Asus
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
        List<Productcart> productcartList = session.getAttribute("productcartList");
        if(productcartList != null){
            if(productcartList.isEmpty()){
            
            }else{
        %>        
        <table border="1">
            <tr>
                <th>Product ID</th>
                <th>Product Name</th>
                <th>Price</th>
                <th>Quantity</th>
            </tr>
            
<!--            <tr>
                <td>1</td>
                <td>Product 1</td>
                <td>$10.00</td>
                <td>2</td>
                <td>$20.00</td>
            </tr>-->
            
            <% for (Product product: productList){ %>
    <% 
          Category categoryP = (Category) session.getAttribute("Category" + i);
          Staff staff = (Staff) session.getAttribute("Staff" + i);
    %>
    <tr>
        <td><%= product.getProductid() %></td>
        <td><%= product.getName() %></td>
        <td><%= String.format("%.2f", product.getPrice()) %></td>
        <td><%= product.getStock() %></td>

        <% } %>
    </tr>

        </table>
        <%      }
            } else %>
        no cart found!
        <% } %>
        <br>
        <a href="user/productlist.jsp">Continue Shopping</a>
        <!-- Add checkout button or other options as needed -->
    </body>
</html>
