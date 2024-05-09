<%@include file="staffAuthentication.jsp"%>
<%@page import="java.util.List"%>
<%@page import="entity.Product"%>
<%@page import="entity.Category"%>
<%@page import="entity.Staff"%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Product List</title>

    </head>
    <%
    //  int i = 0; 
      String msg = null;
      List<Product> productList = (List)session.getAttribute("productListStaff");
      session.setAttribute("path","staff/addProduct.jsp");
    %>
    <body>
        <%@include file="/layout/header.jsp"%>
        <div class="container mt-5">
            <div class="card" style="border: 2px #FFBE00 solid;">
                <div class="card-head yellow_black" style="text-align: center">
                        <h1>Product List</h1>
                    </div>
                <div class="card-body">

                    <table class="table table-striped tableDeco" border="1">
                        <tr style="background-color: #FFBE00">
                            <th>Product ID</th>
                            <th>Product Name</th>
                            <th>Description</th>
                            <th>Price (RM)</th>
                            <th>Stock</th>
                            <th>Status</th>
                            <th>Category Name</th>
                            <th>Last Modified By</th>
                        </tr>
                        <% for (Product product: productList){ %>
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
                            <td><%= product.getCategoryid().getCategoryname() %></td>
                            <td><%= product.getStaffid().getStaffid() + ", " + product.getStaffid().getName() %></td>
                        </tr>
                        <% } %>
                    </table>
                    <div style="display: flex; justify-content: center; flex-wrap: nowrap">
                        <a class="btn yellow_black me-2" href="../staff/staffDashboard.jsp">Dashboard</a>
                        <a class="btn yellow_black me-2" href="../GetCategoryForProduct">Add Product</a>
                        <% if(request.isUserInRole("AdminRole")) { %>
                        <a class="btn yellow_black me-2" href="../LoadProductList">Delete/Update Product</a>
                        <% } else { %>
                        <a class="btn yellow_black me-2" href="../LoadProductList">Update Product</a>
                        <% } %>
                    </div> 
                </div>

            </div>
        </div>

        <%@include file="/layout/footer.jsp"%>
    </body>
</html>
