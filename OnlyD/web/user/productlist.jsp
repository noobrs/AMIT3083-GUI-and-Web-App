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
          
          String actionMsg = (String)session.getAttribute("actionMsg");
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

        <% if(actionMsg != null){ %>
        <p><%=actionMsg%></p>
        <% session.removeAttribute("actionMsg"); } %>
          
        <% if(!productList.isEmpty() || productList != null){ %>
        <table border="1">
            <tr>
                <th>Product ID</th>
                <th>Product Name</th>
                <th>Image</th>
                <th>Description</th>
                <th>Price (RM)</th>
                <th>Category</th>
                <th>Current Stock</th>
                <th>More Details</th>
            </tr>
            <% 
                for (Product product: productList){ 
            %>
            <% if(product.getStock() > 0 ) {%>
            <tr>
                <td><a href="../ViewProductDetail?productId=<%= product.getProductid() %>"><%= product.getProductid() %></a></td>
                <td><%= product.getName() %></td>
                <td><img src="<%=request.getContextPath() + "/image/" + product.getImage() %>"></td>
                <td><%= product.getDescription() %> </td>
                <td><%= String.format("%.2f", product.getPrice()) %></td>
                <td><%= product.getCategoryid().getCategoryname() %></td>
                <td><%= product.getStock() %></td>
                <!-- Add an "Add to Cart" button -->
                <td>
                    <form action="../AddToCart" method="POST"> 
                        <input type="number" min="1" value="1" name="quantity">
                        <input type="hidden" name="productId" value="<%= product.getProductid() %>">
                        <input type="submit" value="Add to Cart">
                    </form>



                </td>
            </tr>
            <% } else { 
                continue;
            } 
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