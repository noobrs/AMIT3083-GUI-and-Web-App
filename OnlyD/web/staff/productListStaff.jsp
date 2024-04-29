<%@page import="java.util.List"%>
<%@page import="entity.Product"%>
<%@page import="entity.Category"%>
<%@page import="entity.Staff"%>

<%
  int i = 0;  
  List<Product> productList = (List)session.getAttribute("productListStaff");
%>

<table border="1">
    <tr>
        <th>Product ID</th>
        <th>Product Name</th>
        <th>Description</th>
        <th>Price (RM)</th>
        <th>Stock</th>
        <th>Status</th>
        <th>Category ID</th>
        <th>Staff ID</th>
    </tr>
    <% for (Product product: productList){ %>
    <% 
          Category category = (Category) session.getAttribute("Category" + i);
          Staff staff = (Staff) session.getAttribute("Staff" + i);
    %>
    <tr>
        <td><%= product.getProductid() %></td>
        <td><%= product.getName() %></td>
        <td><%= product.getDescription() %> </td>
        <td><%= String.format("%.2f", product.getPrice()) %></td>
        <td><%= product.getStock() %></td>
        <td><%= product.getStatus() %></td>
        <td><%= category.getCategoryid() %></td>
        <td><%= staff.getStaffid() %></td>
    </tr>
    <% i++; %>
    <% } %>
</table>
<br><br>
<p><a href="../staff/addProduct.jsp">Add Product</a></p>
<p><a href="../LoadProductList">Delete/Update Product</a></p>
<p><a href="../index.html">Back to home page</a></p>