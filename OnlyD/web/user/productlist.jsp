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
        <div class="container-fluid mt-5">

            <% if(actionMsg != null){ %>
            <p><%=actionMsg%></p>
            <% session.removeAttribute("actionMsg"); } %>   
            <div class="row ">
                <div class="col-2">
                    <h4>Search Filter</h4>
                    <form action="../SearchProductByUser" method="get">
                        <input class="btn" type="text" name="productName" placeholder="Product Name">
                        <input class="btn" type="submit" value="Search" name="searchButton"><br/> 

                        <br/><br/>
                        <% 
                            if(categoryList != null){
                            for (Category category: categoryList){ 
                            if(!category.getCategoryname().equals("NULL")){
                        %>
                        <input class="btn" type="submit" value="<%= category.getCategoryname() %> " name="searchButton"></br>
                        <%  } 
                            } 
                            }       
                        %>
                        <input class="btn" type="submit" value="List All" name="searchButton"><br/>
                    </form>
                </div>
                <br/><br/>

                <% if(!productList.isEmpty() || productList != null){ %>
                <div class="col-10" style="display:flex; flex-wrap: wrap">
                    <% 
                        for (Product product: productList){ 
                    %>
                    <% if(product.getStock() > 0 ) {%>

                    <div class="col-3 m-3"> 
                        <div class="card" style="min-height: 640px; padding: 20px">
                            <img style="height: 300px; width: 100%; margin: auto" src="<%=request.getContextPath() + "/image/" + product.getImage() %>">
                            <div class="card-body">
                                <h5 class="card-title"><a href="../ViewProductDetail?productId=<%= product.getProductid() %>"><%= product.getProductid() %></a></h5>
                                <h5><%= product.getName() %></h5>
                                <p><%= product.getCategoryid().getCategoryname() %></p>
                                <p class="card-text"><%= product.getDescription() %> </p>
                                <h5><%= String.format("%.2f", product.getPrice()) %></h5>
                                <p><%= product.getStock() %></p>
                                <!-- only show add cart button to guest or customer -->
                                <% if((Boolean)session.getAttribute("isStaff") == null && !request.isUserInRole("AdminRole")) { %>
                                <form action="../AddToCart" method="POST"> 
                                    <input type="number" min="1" value="1" name="quantity">
                                    <input type="hidden" name="productId" value="<%= product.getProductid() %>">
                                    <input type="submit" value="Add to Cart">
                                </form>
                                <% } %>
                            </div>
                        </div>
                    </div>
                    <% } else { 
                        continue;
                    } 
                    } 
                    %>
                    <!--</table>-->
                    <%
                        } else{
                    %>
                    No product found!
                    <% } %>

                </div>
                <br><br>
            </div>
            <p><a href="<%=request.getContextPath() + "/" + application.getInitParameter("indexServlet")%>">Back to home page</a></p>
        </div>
        <%@include file="/layout/footer.jsp"%>
    </body>
</html>