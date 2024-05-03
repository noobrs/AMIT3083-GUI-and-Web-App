<%@page import="java.util.List"%>
<%@page import="entity.Product"%>
<%@page import="entity.Category"%>

<%
    int i = 0; 
  List<Product> productList = (List)session.getAttribute("productListUser");
  List<Category> categoryList = (List)session.getAttribute("categoryListUser");
%>

<form action="../SearchProductByUser" method="get">
    <input type="text" name="productName" placeholder="Product Name" >
    <input type="submit" value="Search" name="searchButton"><br/> 
    <input type="submit" value="List All" name="searchButton"><br/>
    <br/><br/>
    <% for (Category category: categoryList){ 
        if(!category.getCategoryname().equals("NULL")){
    %>
        <input type="submit" value="<%= category.getCategoryname() %> " name="searchButton">
    <% } 
        } %>
</form>
<br/><br/>

<% if (productList.isEmpty()){ %>
<h3> No Product</h3>
<% } else {%>

<table border="1">
    <tr>
        <th>Product ID</th>
        <th>Product Name</th>
        <th>Description</th>
        <th>Price (RM)</th>
        <th>Category Name</th>
    </tr>
    <% for (Product product: productList){ 
    Category categoryP = (Category) session.getAttribute("Category" + i);%>
    <tr>
        <td><%= product.getProductid() %></td>
        <td><%= product.getName() %></td>
        <td><%= product.getDescription() %> </td>
        <td><%= String.format("%.2f", product.getPrice()) %></td>
        <td><%= categoryP.getCategoryname() %></td>
    </tr>
    <% i++;
        } %>
</table>

<% } %>
<br><br>
<p><a href="../index.html">Back to home page</a></p>