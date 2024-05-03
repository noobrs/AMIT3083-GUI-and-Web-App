<%@page import="java.util.List"%>
<%@page import="entity.Product"%>

<%
  List<Product> productList = (List)session.getAttribute("productListUser");
%>

<table border="1">
    <tr>
        <th>Product ID</th>
        <th>Product Name</th>
        <th>Description</th>
        <th>Price (RM)</th>
        <th>Action</th> <!-- New column for the "Add to Cart" button -->
    </tr>
    <% for (Product product: productList){ %>
        <tr>
            <td><%= product.getProductid() %></td>
            <td><%= product.getName() %></td>
            <td><%= product.getDescription() %> </td>
            <td><%= String.format("%.2f", product.getPrice()) %></td>
            <!-- Add an "Add to Cart" button -->
            <td>
                <form action="../AddToCart" method="POST"> 
                    <input type="hidden" name="productId" value="<%= product.getProductid() %>">
                    <input type="submit" value="Add to Cart">
                </form>
            </td>
        </tr>
    <% } %>
</table>
<br><br>
<p><a href="../index.html">Back to home page</a></p>