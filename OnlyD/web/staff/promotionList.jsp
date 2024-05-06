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
        
        <table>
            <tr>
                <th>Promo Code</th>
                <th>Percentage</th>
                <th>Quantity</th>
                <th>Status</th>
                <th>Last Modified</th>
            </tr>
            <% for(Promotion p : promoList){ %>
            <tr>
                <td><%= p.getPromotioncode() %></td>
                <td><%= p.getDiscountpercentage() %></td>
                <td><%= p.getRedemptionquantity() %></td>
                <td>
                    <% if(p.getStatus() == Promotion.ACTIVE_STATUS) { %>
                    Active
                    <% } else if(p.getStatus() == Promotion.DELETED_STATUS) { %>
                    Deleted
                    <% } else if(p.getStatus() == Promotion.REDEEMED_STATUS) { %>
                    Redeemed
                    <% } %>
                </td>
                <td><%= p.getStaffid().getStaffid() %></td>
            </tr>
            <% } %>
        </table>
        <% } %>
        
        <%@include file="/layout/footer.jsp"%>
    </body>
</html>
