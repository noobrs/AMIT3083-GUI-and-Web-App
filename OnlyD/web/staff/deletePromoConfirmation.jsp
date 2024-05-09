<%@include file="staffAuthentication.jsp"%>
<%@page import="entity.Promotion"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Delete Promotion</title>
    </head>
    <body>
        <%
    Promotion promotion = (Promotion) session.getAttribute("promotion");
    if (promotion != null) {
        %>
        <%@include file="/layout/header.jsp"%>
        <div class="container mt-5">
            <div class="dashBoard">
                <div class="card card_deco"  style="border: 2px #FFBE00 solid;">
                    <div class="card-head yellow_black">
                        <h1>Delete Promotion</h1>
                    </div>
                    <div class="card-body">
                        <form action="../DeletePromotion" method="post" onsubmit="return window.confirm('Are you sure you want to delete this promotion?')">
                            <div class="input-group mb-3">
                                <span class="input-group-text yellow_black">
                                    Promotion Code
                                </span>
                                <input class="form-control" type="text" name="id" value="<%=promotion.getPromotioncode()%>" readonly>
                            </div>

                            <div class="input-group mb-3">
                                <span class="input-group-text yellow_black">
                                    Discount Percentage
                                </span>
                                <input class="form-control" type="text" name="discountPercentage"  value="<%=String.format("%.2f", promotion.getDiscountpercentage())%>" readonly>
                            </div>

                            <div class="input-group mb-3">
                                <span class="input-group-text yellow_black">
                                    Available Quantity
                                </span>
                                <input class="form-control" type="text" name="redemptionQty" size="50" value="<%= promotion.getRedemptionquantity() %>" readonly>
                            </div>

                            <div class="input-group mb-3">
                                <span class="input-group-text yellow_black">
                                    Last modified by
                                </span>
                                <input class="form-control" type="text" name="staffId" size="50" value="<%= promotion.getStaffid().getStaffid() %>" readonly>
                            </div>

                            <div style="display: flex; justify-content: center; flex-wrap: nowrap">
                                <a class="btn yellow_black me-2" href="../staff/staffDashboard.jsp">Dashboard</a>
                                <input class="btn reset_dlt_btn" type="submit" value="Delete Promotion">
                            </div>
                        </form>
                        <%} else {%>
                        Promotion not found
                        <p><a href="<%=request.getContextPath()%>">Back to home page</a></p>
                        <%}%>
                    </div>
                </div>
            </div>
        </div>


        <%@include file="/layout/footer.jsp"%>
    </body>
</html>
