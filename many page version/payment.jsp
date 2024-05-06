<%-- 
    Document   : payment
    Created on : May 5, 2024, 4:47:39 PM
    Author     : ASUS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Payment</title>
    </head>
    <body>
        <h2>Payment</h2>
        <div>
            <form action="SelectPaymentType.jsp">
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
                <input type="submit" value="Next">
            </form>
        </div>
    </body>
</html>
