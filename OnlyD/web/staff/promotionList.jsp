<%@include file="staffAuthentication.jsp"%>
<%@page import="entity.Promotion, java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Promotion List</title>
    </head>
    <body>
        <%
            List<Promotion> promoList = (List<Promotion>)session.getAttribute("promoList");
            if(promoList != null){
        %>

        <%@include file="/layout/header.jsp"%>
        <div class="container mt-5">
            <div class="dashBoard">
                <div class="card card_deco"  style="border: 2px #FFBE00 solid;">
                    <div class="card-head yellow_black">
                        <h1>Promotion List</h1>
                    </div>
                    <div class="card-body">
                        <table class="table table-striped tableDeco" border="1">
                            <tr style="background-color: #FFBE00">
                                <th>Promo Code</th>
                                <th>Percentage</th>
                                <th>Quantity</th>
                                <th>Status</th>
                                <th>Last Modified</th>
                            </tr>
                            <% for(Promotion p : promoList){ %>
                            <% if(p.getStatus() == Promotion.DELETED_STATUS) { continue; } %>

                            <tr>
                                <td><%= p.getPromotioncode() %></td>
                                <td><%= p.getDiscountpercentage() %></td>
                                <td><%= p.getRedemptionquantity() %></td>
                                <td>
                                    <% if(p.getStatus() == Promotion.ACTIVE_STATUS) { %>
                                    Active
                                    <% } else if(p.getStatus() == Promotion.REDEEMED_STATUS) { %>
                                    Redeemed
                                    <% } %>
                                </td>
                                <td><%= p.getStaffid().getStaffid() %></td>
                            </tr>
                            <% } %>
                        </table>

                        <div style="display: flex; justify-content: center; flex-wrap: nowrap">
                            <a class="btn yellow_black me-2" href="../staff/staffDashboard.jsp">Dashboard</a>
                            <a class="btn yellow_black me-2" href="../staff/addPromotion.jsp">Add Promotion</a>
                            <a class="btn yellow_black me-2" href="../LoadPromoList">Delete/Update Promotion</a>
                        </div> 
                        <% } %>
                    </div>
                </div>
            </div>
        </div>
        <%@include file="/layout/footer.jsp"%>
    </body>
</html>
