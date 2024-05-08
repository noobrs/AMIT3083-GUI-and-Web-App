<%@include file="/staff/staffAuthentication.jsp"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Add Promotion</title>
    </head>
    <body>
        <%@include file="/layout/header.jsp"%>

        <h1>Add Promotion</h1>
        <form action="../AddPromo" method="POST">
            Promotion Code:
            <input type="text" name="promoCode" required="required" ><br>
            Discount Percentage:
            <input type="number" min="0.01" max="100.00" step="0.01" name="discountPercentage" value="${AddPromotion.discountPercentage}" size="50"><br>
            Redemption Quantity:
            <input type="number" min="1" step="1" name="redemptionQty"><br>
            <input type="submit" value="Add">
            <input type="reset" value="Reset">
        </form>
            
        <%
            String statusMsg = (String)session.getAttribute("statusMsg");
            if(statusMsg != null){
        %>
            <%= statusMsg %>
        <%
            session.removeAttribute("statusMsg");
            }
        %>

        <%@include file="/layout/footer.jsp"%>
    </body>
</html>