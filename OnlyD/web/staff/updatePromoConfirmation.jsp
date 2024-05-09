<%@include file="staffAuthentication.jsp"%>
<%@page import="entity.Promotion"%>
<%@page import="entity.Staff"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Update Promotion</title>
    </head>
    <body>
        <%
            Promotion promo = (Promotion)session.getAttribute("promotion");
            Staff staff = (Staff)session.getAttribute("staff");
        %>

        <%@include file="/layout/header.jsp"%>
        <div class="container mt-5">
            <div class="dashBoard">
                <div class="card card_deco"  style="border: 2px #FFBE00 solid;">
                    <div class="card-head yellow_black">
                        <h1>Update Promotion</h1>
                    </div>
                    <div class="card-body">
                        <% if(promo != null) { %>
                        <form action="../UpdatePromotion" method="post">
                            <div class="input-group mb-3">
                                <span class="input-group-text yellow_black">
                                    Promotion Code
                                </span>
                                <input class="form-control" type="text" name="promoCode" value="<%=promo.getPromotioncode()%>" required>
                            </div>
                            <div class="input-group mb-3">
                                <span class="input-group-text yellow_black">
                                    Discount Percentage
                                </span>
                                <input class="form-control" type="number" min="0.01" max="100.00" step="0.01" name="discountPercentage" value="<%=promo.getDiscountpercentage()%>">
                            </div>
                            <div class="input-group mb-3">
                                <span class="input-group-text yellow_black">
                                    Redemption Quantity
                                </span>
                                <input class="form-control" type="number" min="1" step="1" name="redemptionQty" value="<%=promo.getRedemptionquantity()%>">
                            </div>

                            <input class="btn yellow_black" type="submit" value="Update Promotion">
                        </form>
                        <% } else { %>
                        Promotion not found
                        <p><a href="<%=request.getContextPath() + "/" + application.getInitParameter("indexServlet")%>">Back to home page</a></p>
                        <% } %>
                    </div>
                </div>
            </div>
        </div>

        <%@include file="/layout/footer.jsp"%>
    </body>
</html>
