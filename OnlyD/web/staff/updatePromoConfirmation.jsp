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

        <h1>Update Promotion</h1>
        <% if(promo != null) { %>
        <form action="../UpdatePromotion" method="post">
            <table>
                <tr>
                    <td>Promotion Code</td>
                    <td>
                        <input type="text" name="promoCode" value="<%=promo.getPromotioncode()%>" required>
                    </td>
                </tr>
                <tr>
                    <td>Discount Percentage</td>
                    <td>
                        <input type="number" min="0.01" max="100.00" step="0.01" name="discountPercentage" value="<%=promo.getDiscountpercentage()%>">             
                    </td>
                </tr>
                <tr>
                    <td>Redemption Quantity</td>
                    <td>
                        <input type="number" min="1" step="1" name="redemptionQty" value="<%=promo.getRedemptionquantity()%>">
                    </td>
                </tr>
            </table>
                    <input type="submit" value="Update Promotion">
        </form>
        <% } else { %>
        Promotion not found
        <p><a href="<%=request.getContextPath()%>">Back to home page</a></p>
        <% } %>
        <%@include file="/layout/footer.jsp"%>
    </body>
</html>
