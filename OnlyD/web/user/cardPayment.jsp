<%-- 
    Document   : creditdebitcardPayment
    Created on : May 5, 2024, 5:51:14 PM
    Author     : ASUS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="custAuthentication.jsp"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Card Payment</title>
    </head>
    <body>
        <%@include file="/layout/header.jsp"%>
        
        <h2>Payment</h2>
        <h3>Pay with Credit / Debit Card</h3>
        <form action="../AddOrder?cardStatus=valid" method="post">
            Card Number :
            <input type="text" id="cardNumber" name="cardNumber" placeholder="1111-2222-3333-4444" pattern="^(\d{4}[-\s]?){3}\d{4}$" required>
            <br>
            Expiry :
            <input type="text" id="cardExpiry" name="cardExpiry" placeholder="MM/YY" pattern="^(0[1-9]|1[0-2])\/([0-9]{2})$" required>
            <input type="month" >
            <br>
            CVV :
            <input type="text" id="CVC" name="CVC" required placeholder="123" maxlength="3" minlength="3">
            <br>
            <a href="donePayment.jsp"><input type="submit" value="Proceed"></a>
        </form>
        
        <%@include file="/layout/footer.jsp"%>
    </body>
</html>