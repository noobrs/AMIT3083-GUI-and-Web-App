<%@page import="java.util.List"%>
<%@page import="entity.Product"%>
<%@page import="entity.Category"%>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Product List</title>
        <link rel="shortcut icon" type="image/x-icon" href="/OnlyD/layout/favicon_onlyD.ico">
    </head>
    <body>

        <%@include file="/layout/header.jsp"%>
        <%
          int i = 0; 
          List<Product> productList = (List<Product>)session.getAttribute("productListUser");
          List<Category> categoryList = (List<Category>)session.getAttribute("categoryListUser");
          
          if(productList == null || categoryList == null){
            response.sendRedirect("../ViewProduct");
            return;
            //request.getRequestDispatcher("/ViewProduct").forward(request, response);
            }
          
          String actionMsg = (String)session.getAttribute("actionMsg");
        %>
        <div class="container-fluid mt-5">
            <div class="row ">
                <div class="col-2 yellow_black" style="text-align: center; border-top-right-radius: 10px; border-bottom-right-radius: 10px">
                    <h4 class="mt-3">Search Filter</h4>
                    <form action="../SearchProductByUser" method="get">

                        <div class="input-group" style=" width: fit-content">
                            <input style="width:74%; background-color: #FFFFFF" class="btn" type="text" name="productName" placeholder="Product Name" >
                            <input class="btn" style="background-color: #25182E; color: #FFFFFF; border-bottom-right-radius: 10px; border-top-right-radius: 10px; " type="submit" value="Search" name="searchButton"><br/> 
                        </div>
                        <br>
                        <h5>Category:</h5>
                        <% 
                            if(categoryList != null){
                            for (Category category: categoryList){ 
                            if(!category.getCategoryname().equals("NULL")){
                        %>
                        <input class="btn mb-2 filter_btn" type="submit" value="<%= category.getCategoryname() %> " name="searchButton"></br>
                        <%  } 
                            } 
                            }       
                        %>
                        <input class="btn filter_btn" style="background-color: #25182E; color: #FFFFFF; width: 100px;" type="submit" value="List All" name="searchButton"><br/>
                    </form>
                </div>
                <div class="col-1"></div>
                <br/><br/>
                <div class="col-9">
                    <% if(actionMsg != null){ %>
                    <h4 style="color: red; text-align: center"><%=actionMsg%></h4>
                    <% session.removeAttribute("actionMsg"); } %>
                    <div class="row row-cols-3" style="margin-left: 30px">
                        <% if(!productList.isEmpty()){ %>

                        <% 
                            for (Product product: productList){ 
                        %>
                        <% if(product.getStock() > 0 ) {%>

                        <div class="col-3 p-0 m-1" style="border: 2px #25182E solid; border-radius: 7px" > 
                            <div class="card" style="min-height: 550px;">
                                <div style="display: flex; justify-content: center; margin: auto;">
                                    <img style="height: 100%; width: 100%; margin: auto" src="<%=request.getContextPath() + "/image/" + product.getImage() %>">
                                </div>
                                <div class="card-body yellow_black" style="max-height: 270px; ">
                                    <h5 class=" visually-hidden"><a href="../ViewProductDetail?productId=<%= product.getProductid() %>"><%= product.getProductid() %></a></h5>
                                    <h4 class="card-title" ><a style="text-decoration: none; color: #25182E;" href="../ViewProductDetail?productId=<%= product.getProductid() %>"><%= product.getName() %></a></h4>
                                    <p><%= product.getCategoryid().getCategoryname() %></p>
                                    <p> </p>
                                    <h5>RM <%= String.format("%.2f", product.getPrice()) %></h5>
                                    <p>In-stock:  <%= product.getStock() %></p>
                                    <!-- only show add cart button to guest or customer -->
                                    <% if((Boolean)session.getAttribute("isStaff") == null && !request.isUserInRole("AdminRole")) { %>
                                    <form action="../AddToCart" method="POST"> 
                                        <input class="btn" style="width:60%; background-color: #FFFFFF; border:1px #25182E solid;" type="number" min="1" value="1" name="quantity">
                                        <input type="hidden" name="productId" value="<%= product.getProductid() %>">
                                        <input class="btn" style="background-color: #25182E; color: #FFFFFF; border-bottom-right-radius: 10px; border-top-right-radius: 10px; " type="submit" value="Add to Cart">
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

                        <%
                            } else {
                        %>
                        <h4 style="text-align: center">No product found!</h4>
                        <% } %>
                    </div>
                </div>
                <br><br>
            </div>
        </div>
        <%@include file="/layout/footer.jsp"%>
    </body>
</html>

