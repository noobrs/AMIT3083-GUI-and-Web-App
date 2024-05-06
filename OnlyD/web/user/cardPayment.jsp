<%-- 
    Document   : creditdebitcardPayment
    Created on : May 5, 2024, 5:51:14 PM
    Author     : ASUS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Card Payment</title>
    </head>
    <body>
        <h2>Payment</h2>
        <h3>Pay with Credit / Debit Card</h3>
        <form action="../AddOrder?cardStatus=valid" method="post">
            Card Number :
            <input type="text" id="cardNumber" name="cardNumber" required maxlength="16" minlength="16">
            <br>
            Expiry :
            <input type="text" id="cardExpiry" name="cardExpiry" placeholder="MMYY" required maxlength="4" minlength="4">
            <br>
            CVC / CVV :
            <input type="text" id="CVC" name="CVC" required maxlength="3" minlength="3">
            <br>
            <a href="donePayment.jsp"><input type="submit" value="Proceed"></a>
        </form>
    </body>
</html>