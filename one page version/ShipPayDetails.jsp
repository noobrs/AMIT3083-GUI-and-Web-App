<%-- 
    Document   : ShipPayDetails
    Created on : May 6, 2024, 3:40:30 PM
    Author     : ASUS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Ship Pay</title>
    </head>
    <body>
        <h2>Payment</h2>
        <form action="donePayment.jsp">
            Recipient Name :
            <input type="text" id="rName" name="rName" placeholder="Name" required>
            <br>
            Recipient H/P Number :
            <input type="tel" id="rHPNumber" name="rHPNumber" placeholder="0123456789" required maxlength="11" minlength="10">
            <br>
            Recipient E-mail :
            <input type="email" id="rEmail" name="rEmail" placeholder="abc@abc.com" required>
            <br>
            <br>
            Address 1 :
            <input type="text" id="sAddress1" name="sAddress1" required>
            <br>
            Address 2 :
            <input type="text" id="sAddress2" name="sAddress2" required>
            <br>
            State :
            <select id="sState" name="sState" required>
                <option>Negeri Sembilan</option>
                <option>Perak</option>
                <option>Pahang</option>
                <option>Kedah</option>
                <option>Kelantan</option>
                <option>Selangor</option>
                <option>Johor</option>
                <option>Terengganu</option>
                <option>Perlis</option>
                <option>Penang</option>
                <option>Malacca</option>
                <option>Sabah</option>
                <option>Sarawak</option>
            </select>
            <br>
            City :
            <input type="text" id="sCity" name="sCity" required>
            <br>
            Postal Code :
            <input type="text" id="sPostCode" name="sPostCode" required maxlength="5" minlength="5">
            <br>
            <br>
            Payment Method :
            <select id="PaymentMethod" onchange="cardField()">
                <option id="COD" value="COD">Cash On Deliver</option>
                <option id="CDC" value="Credit / Debit Card">Credit Card / Debit Card</option>
            </select>
            <br>
            Card Number :
            <input type="text" id="cardNumber" name="cardNumber" required maxlength="16" minlength="16" disabled>
            <br>
            Expiry :
            <input type="text" id="cardExpiry" name="cardExpiry" placeholder="MMYY" required maxlength="4" minlength="4" disabled>
            <br>
            CVC / CVV :
            <input type="text" id="CVC" name="CVC" required maxlength="3" minlength="3" disabled>
            <br>
            <input type="submit" value="Submit">
        </form>
        <script>
            function cardField(){
                var paymentMethod = document.getElementById("PaymentMethod").value;
                var CDC = document.getElementById("CDC");
                var cardNumber = document.getElementById("cardNumber");
                var cardExpiry = document.getElementById("cardExpiry");
                var CVC = document.getElementById("CVC");
                
                if (paymentMethod === "Credit / Debit Card"){
                    cardNumber.disabled = false;
                    cardExpiry.disabled = false;
                    CVC.disabled = false;
                } else{
                    cardNumber.disabled = true;
                    cardNumber.value = "";
                    cardExpiry.disabled = true;
                    cardExpiry.value = "";
                    CVC.disabled = true;
                    CVC.value = "";
                }
            }
        </script>
    </body>
</html>
