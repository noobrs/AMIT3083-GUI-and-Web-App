<%@page import="java.util.List"%>
<%@page import="entity.Product"%>
<%@page import="entity.Category"%>

<%
  List<Product> productList = (List)session.getAttribute("productListUser");
%>

<form action="../SearchProductByUser" method="get">
    <input type="text" name="productName" placeholder="Product Name" >
    <input type="submit" value="Search"><br/> 
</form>
<br/><br/>
<table border="1">
    <tr>
        <th>Product ID</th>
        <th>Product Name</th>
        <th>Description</th>
        <th>Price (RM)</th>
    </tr>
    <% for (Product product: productList){ %>
    <tr>
        <td><%= product.getProductid() %></td>
        <td><%= product.getName() %></td>
        <td><%= product.getDescription() %> </td>
        <td><%= String.format("%.2f", product.getPrice()) %></td>
    </tr>
    <% } %>
</table>
<br><br>
<p><a href="../index.html">Back to home page</a></p>