<%@include file="staffAuthentication.jsp"%>
<%@page import="java.util.List"%>
<%@page  import="entity.Product" %>
<%
  List<Product> productList = (List)session.getAttribute("productList");
%>

<%@include file="/layout/header.jsp"%>
<div class="container mt-5">
    <div class="dashBoard">
        <div class="card card_deco"  style="border: 2px #FFBE00 solid;">
            <div class="card-head yellow_black">
                <h1>Search Product </h1>
            </div>
            <div class="card-body">
                <form action="searchProduct.jsp" method="post">
                    <div class="input-group mb-3">
                        <span class="input-group-text yellow_black">Product ID/Name</span>
                        <select class="form-select" name="productId">
                            <% for (Product product: productList){%>
                            <option value="<%=product.getProductid()%>">
                                <%=product.getProductid() + ". " + product.getName() %>
                                <%}%>
                        </select>
                    </div>
                    <br>
                    <div class="dashBoard">
                        <input class="btn yellow_black me-2" type="submit" value="Update" name="productButton"/>
                        <!<!-- only admin can delete product -->
                        <% if(request.isUserInRole("AdminRole")){ %>
                        <input class="btn reset_dlt_btn" type="submit" value="Delete" name="productButton"/>
                        <% } %>
                        
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

<%@include file="/layout/footer.jsp"%>
