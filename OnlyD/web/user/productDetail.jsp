<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="entity.Product"%>
<%@page import="entity.Category"%>

<%
    Product p = (Product) session.getAttribute("TempProductDetail");
%>

<html>
    <body>
        <%@include file="/layout/header.jsp"%>

        <div class="container">
            <div class="row" style="margin: 50px 0 50px 0; background-color: #FFBE00; height: 500px; border-radius: 10px">
                <div class="col-6" style="max-height: 90%; margin: auto; display: flex; justify-content: center">
                    <img style="height: 350px; " src="<%= request.getContextPath() + "/image/" + p.getImage()%>">
                </div>


                <div class="col-6" style="padding: 20px; border-left: 2px #25182E solid; display: flex; flex-direction: column; justify-content: center ">
                    <h1><%= p.getName() %></h1>
                    <h5><%= p.getCategoryid().getCategoryname() %></h5>
                    </br>
                    <p >
                        <%= p.getDescription() %> 
                    </p>
                    <h3>RM <%= String.format("%.2f", p.getPrice()) %></h3>
                    <h5>In-stock: <%= p.getStock() %></h5>
                    <div> 
                        <% if((Boolean)session.getAttribute("isStaff") == null && !request.isUserInRole("AdminRole")) { %>
                        <form action="../AddToCart" method="POST" > 
                            <input class="btn" style="width:60%; background-color: #FFFFFF; border:1px #25182E solid;" type="number" min="1" value="1" name="quantity">
                            <input type="hidden" name="productId" value="<%= p.getProductid() %>">
                            <input class="btn" style="background-color: #25182E; color: #FFFFFF; border-bottom-right-radius: 10px; border-top-right-radius: 10px; " type="submit" value="Add to Cart">
                        </form>
                        <% } %>
                    </div>

                </div>
            </div>

        </div>



        <%@include file="/layout/footer.jsp"%>
    </body>
</html>