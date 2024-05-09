<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="entity.Product"%>
<%@page import="entity.Promotion"%>
<!DOCTYPE html>

<%
      List<Product> productList = (List<Product>)session.getAttribute("productListImage");
      List<Promotion> promotionList = (List<Promotion>)session.getAttribute("promotionListHome");
    if(productList == null || promotionList == null){
        response.sendRedirect("SearchDetailForHome"); 
    }
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title><%= application.getInitParameter("storeName")%></title>
    </head>
    <body>
        <%@include file="layout/header.jsp"%>
        <div class="container">
            <div id="carouselExampleIndicators" class="carousel carousel-dark slide" data-bs-ride="carousel" style="margin: 50px 0 50px 0">
                <div class="carousel-indicators">
                    <% if(productList != null){
            for(int i = 0; i < productList.size(); i++){ %>
                    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="<%=i%>" <% if(i==0){ %>class="active"<% } %> aria-label="Slide <%=i+1%>"></button>
                    <% } } %>
                </div>
                <div class="carousel-inner">
                    <% if(productList != null){
                        for(int i = 0; i < productList.size(); i++){ 
                            Product p = productList.get(i); %>
                    <div class="carousel-item <% if(i==0){ %>active<% } %>">
                        <a href="ViewProductDetail?productId=<%=p.getProductid()%>"><img  src="<%= request.getContextPath() + "/image/" + p.getImage()%>" class="d-block w-100" alt="Product Image"></a>
                    </div>
                    <% } } %>
                </div>
                <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
                    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                    <span class="visually-hidden">Previous</span>
                </button>
                <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
                    <span class="carousel-control-next-icon" aria-hidden="true"></span>
                    <span class="visually-hidden">Next</span>
                </button>
            </div>
        </div>


        <%if(promotionList != null){%>
        <%for(Promotion po: promotionList){%>
        <div class="row">
            <div class="col-2">
                <div class="card">
                    <div class="card-body">
                        <h5 class="card-title">Promotion Code</h5>

                        <h3><%=po.getPromotioncode()%></h3>
                        <p class="card-text">Discount Percentage</p>
                        <h4><%=po.getDiscountpercentage()%></h4>
                    </div>
                </div>
            </div>
        </div>
        <% } %>
        <% } %>
        <%@include file="layout/footer.jsp"%> 
    </body>
</html>