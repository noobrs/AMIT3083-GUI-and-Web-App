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
        <h1>Delete Promotion</h1>
        <form action="../DeletePromotion" method="post" onsubmit="return window.confirm('Are you sure you want to delete this promotion?')">
            <table border="0">
                <tr>
                    <td>Promotion Code</td>
                    <td><input type="text" name="id"
                               value="<%=promotion.getPromotioncode()%>" readonly></td>
                </tr>
                <tr>
                    <td>Discount Percentage</td>
                    <td><input type="text" name="discountPercentage"  value="<%=String.format("%.2f", promotion.getDiscountpercentage())%>" readonly></td>
                </tr>
                <tr>
                    <td>Available Quantity</td>
                    <td><input type="text" name="redemptionQty" size="50" value="<%= promotion.getRedemptionquantity() %>" readonly></td>
                </tr>
                <tr>
                    <td>Last modified by</td>
                    <td><input type="text" name="staffId" size="50" value="<%= promotion.getStaffid().getStaffid() %>" readonly></td>
                </tr>
            </table>
            <input type="submit" value="Delete Promotion">

        </form>
        <%} else {%>
        Promotion not found
        <p><a href="<%=request.getContextPath()%>">Back to home page</a></p>
        <%}%>
        
        <%@include file="/layout/footer.jsp"%>
    </body>
</html>
