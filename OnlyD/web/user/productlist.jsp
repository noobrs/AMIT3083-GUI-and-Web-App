<%@page import="java.util.List"%>
<%@page import="entity.Product"%>
<%@page import="entity.Category"%>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Product List</title>
    </head>
    <body>

        <%@include file="/layout/header.jsp"%>
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
            <% 
                if(categoryList != null){
                for (Category category: categoryList){ 
                if(!category.getCategoryname().equals("NULL")){
            %>
            <input type="submit" value="<%= category.getCategoryname() %> " name="searchButton">
            <%  } 
                } 
                }       
            %>
        </form>
        <br/><br/>

        <%
          if(!productList.isEmpty() || productList != null){
        %>
        <table border="1">
            <tr>
                <th>Product ID</th>
                <th>Product Name</th>
                <th>Description</th>
                <th>Price (RM)</th>
                <th>Category</th>
                <th>Current Stock</th>
            </tr>
            <% 
                for (Product product: productList){ 
                Category categoryP = (Category) session.getAttribute("Category" + i);
            %>
            <tr>
                <td><%= product.getProductid() %></td>
                <td><%= product.getName() %></td>
                <td><%= product.getDescription() %> </td>
                <td><%= String.format("%.2f", product.getPrice()) %></td>
                <td><%= categoryP.getCategoryname() %></td>
                <td><%= product.getStock() %></td>
                <!-- Add an "Add to Cart" button -->
                <td>
                    <% if(product.getStock() > 0 ) {%>
                    <form action="../AddToCart" method="POST"> 
                        <input type="number" min="1" value="1" name="quantity">
                        <input type="hidden" name="productId" value="<%= product.getProductid() %>">
                        <input type="submit" value="Add to Cart">
                    </form>
                    <% } else { %>
                    Out of Stock!
                    <% } %>
                </td>
            </tr>
            <% 
                i++;
                } 
            %>
        </table>
        <%
            } else{
        %>
        No product found!
        <% } %>
        <br><br>
        <p><a href="<%=request.getContextPath()%>/">Back to home page</a></p>
        <%@include file="/layout/footer.jsp"%>
    </body>
</html>