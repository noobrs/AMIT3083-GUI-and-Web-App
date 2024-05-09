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
<style>
        .rolling-banner {
  width: 100%;
  height: 300px; /* Adjust as needed */
  overflow: hidden;
  position: relative;
}

.banner-images {
  width: 300%; /* 3 images side by side */
  height: 100%;
  display: flex;
  animation: roll 10s linear infinite;
}

.banner-images img {
  width: 100%; /* Each image takes 33.33% of the container width */
  height: 100%;
  object-fit: cover; /* Ensure images cover the entire area */
}

/*@keyframes roll {
  0% {
    transform: translateX(0);
  }
  100% {
    transform: translateX(-100%);
  }
}*/
</style>
    <body>
        <%@include file="layout/header.jsp"%>
        <div class="rolling-banner">
            <div class="banner-images">
                   <% if(productList != null){
                        for(Product p : productList){%>
                        <a href="ViewProductDetail?productId=<%=p.getProductid()%>"><img src="<%= request.getContextPath() + "/image/" + p.getImage()%>"></a>
                <% 
                    } 
                  }
                %>
            </div>
        </div>
            <%if(promotionList != null){%>
                
            <table border="1">
                <tr>
                    <th>Promotion Code</th>
                    <th>Discount Percentage</th>
                    
                </tr>
                <%for(Promotion po: promotionList){%>
                <tr>
                    <th><%=po.getPromotioncode()%></th>
                    <th><%=po.getDiscountpercentage()%></th>
                </tr>
                <% } %>
            </table>
        <% } %>
        <%@include file="layout/footer.jsp"%> 
    </body>
</html>