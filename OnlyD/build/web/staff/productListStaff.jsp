<%@page import="java.util.List"%>
<%@page import="entity.Product"%>
<%@page import="entity.Category"%>
<%@page import="entity.Staff"%>

<%
  int i = 0; 
  //String catName = null;
  String msg = null;
  List<Product> productList = (List)session.getAttribute("productListStaff");
  //session.setAttribute("path","staff/addProduct.jsp");
  //List<Category> categoryList = (List)session.getAttribute("categoryListProduct");
%>

<table border="1">
    <tr>
        <th>Product ID</th>
        <th>Product Name</th>
        <th>Description</th>
        <th>Price (RM)</th>
        <th>Stock</th>
        <th>Status</th>
        <th>Category Name</th>
        <th>Staff ID</th>
    </tr>
    <% for (Product product: productList){ %>
    <% 
          Category categoryP = (Category) session.getAttribute("Category" + i);
//          for (Category category: categoryList){
//            if(categoryP.getCategoryid() == category.getCategoryid()){
//                catName = category.getCategoryname();
//                break;
//            }
//          } 
          Staff staff = (Staff) session.getAttribute("Staff" + i);
    %>
    <tr>
        <td><%= product.getProductid() %></td>
        <td><%= product.getName() %></td>
        <td><%= product.getDescription() %> </td>
        <td><%= String.format("%.2f", product.getPrice()) %></td>
        <td><%= product.getStock() %></td>
        <%if(product.getStatus() == 0) { %>
        <td> Deleted </td>
        <%}else{ %>
        <td> Active </td>
        <% } %>
        <td><%= categoryP.getCategoryid() %></td>
        <td><%= staff.getStaffid() %></td>
    </tr>
    <% i++; %>
    <% } %>
</table>
<br><br>
<p><a href="../GetCategoryForProduct">Add Product</a></p>
<p><a href="../LoadProductList">Delete/Update Product</a></p>
<p><a href="../index.html">Back to home page</a></p>