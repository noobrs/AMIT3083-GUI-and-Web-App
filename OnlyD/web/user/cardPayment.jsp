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
            <input type="text" id="cardNumber" name="cardNumber" required 
                   pattern="^[0-9]{4}(\s[0-9]{4}){3}$" 
                   title="Please enter a valid card number with spaces between every four digits"
                   maxlength="19" minlength="19">
            <br>
            Expiry :
            <input type="text" id="cardExpiry" name="cardExpiry" placeholder="MM/YY" required 
       pattern="^(0[1-9]|1[0-2])\/([0-9]{2})$" 
       title="Please enter a valid expiry date in the format MM/YY" 
       maxlength="5" minlength="5">
            <br>
            CVC / CVV :
            <input type="text" id="CVC" name="CVC" required 
       pattern="[0-9]{3}" 
       title="Please enter a valid 3-digit CVC/CVV code" 
       maxlength="3" minlength="3">
            <br>
            <a href="donePayment.jsp"><input type="submit" value="Proceed"></a>
        </form>
    </body>
</html>