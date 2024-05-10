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

            <%
            String loginSucccessMsg = (String)session.getAttribute("loginSucccessMsg");
            if(loginSucccessMsg != null){
            %>
            <h4 style="text-align: center"><%= loginSucccessMsg %></h4>
            <%
                session.removeAttribute("loginSucccessMsg");
                }
            %>

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
                    <div class="carousel-item <% if(i==0){ %>active<% } %>" >
                        <a href="ViewProductDetail?productId=<%=p.getProductid()%>" style="display: flex; justify-content: center">
                            <img  src="<%= request.getContextPath() + "/image/" + p.getImage()%>" class="d-block" height="600px" alt="Product Image" >
                        </a>
                        <div class="carousel-caption d-none d-md-block" style="background-color:#FFBE00;">
                            <h4>TOP <%= i+1 %> Most popular item sold !</h4>
                            <h5><%=p.getName()%></h5>
                        </div>
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


            <h1 style="color:#FFBE00">Use promotion coupon code for discounts !</h1>
            <div class="container row mb-5 yellow_black" style="padding:20px; height: 300px; display: flex; flex-wrap: nowrap; align-content: center; border-radius: 10px; overflow-y: scroll">
                <% 
                    int maxPromotionsToShow = 4; // Change this value to the desired maximum number of promotions to display
                    int promotionCount = 0; // Counter variable to keep track of the number of displayed promotions
                    if(promotionList != null){
                        for(Promotion po: promotionList){
//                            if(promotionCount >= maxPromotionsToShow){
//                                break; // Stop iterating if the maximum number of promotions to display has been reached
//                            }
                %>

                <div class="col-3">
                    <div class="card" style="height: 100%">
                        <div class="card-body">
                            <h5 class="card-title">Coupon Code</h5>
                            <h4><%=po.getPromotioncode()%></h4>
                            <p class="card-text">Discount Percentage</p>
                            <h4><%=po.getDiscountpercentage()%>%</h4>
                            <p>Remaining: <%=po.getRedemptionquantity()%></p>
                        </div>
                    </div>
                </div>

                <%
                            promotionCount++; // Increment the promotion counter after displaying each promotion
                        }
                    }
                %>
            </div>
            <br>
            <div class="container mb-5 mt-5" style=" text-align: center">
                <a href="<%=request.getContextPath()%>/ViewProduct" class="btn yellow_black"><h2>See More</h2></a>
            </div>

        </div>
        <%@include file="layout/footer.jsp"%> 
    </body>
</html>