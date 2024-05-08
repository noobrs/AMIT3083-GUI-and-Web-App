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
        <%@include file="/layout/header.jsp"%>

        <h2>Shipping Details</h2>
        <div>
            <form action="processPaymentInput.jsp" method="post">
                Recipient Name :
                <input type="text" id="rName" name="rName" placeholder="Name" required>
                <br>
                Recipient H/P Number :
                <input type="tel" id="rHPNumber" name="rHPNumber" placeholder="0123456789" required maxlength="11" minlength="10">
                <br>
                Address :
                <input type="text" id="sAddress1" name="sAddress1" required>
                <br>
                State :
                <select id="sState" name="sState" required>
                    <option value="Negeri Sembilan">Negeri Sembilan</option>
                    <option value="Perak">Perak</option>
                    <option value="Pahang">Pahang</option>
                    <option value="Kedah">Kedah</option>
                    <option value="Kelantan">Kelantan</option>
                    <option value="Kuala Lumpur">Kuala Lumpur</option>
                    <option value="Labuan">Labuan</option>
                    <option value="Putrajaya">Putrajaya</option>
                    <option value="Selangor">Selangor</option>
                    <option value="Johor">Johor</option>
                    <option value="Terengganu">Terengganu</option>
                    <option value="Perlis">Perlis</option>
                    <option value="Penang">Penang</option>
                    <option value="Malacca">Malacca</option>
                    <option value="Sabah">Sabah</option>
                    <option value="Sarawak">Sarawak</option>
                </select>
                <br>
                City :
                <input type="text" id="sCity" name="sCity" required>
                <br>
                Postal Code :
                <input type="text" id="sPostCode" name="sPostCode" required maxlength="5" minlength="5">
                <br>
                Payment Type : 
                <select id="paymentType" name="paymentType">
                    <option value="Cash On Delivery">Cash On Delivery</option>
                    <option value="Credit Card/Debit Card">Credit Card/Debit Card</option>
                </select>
                <br>
                <br>
                <input type="submit" value="Proceed">
            </form>
        </div>

        <%@include file="/layout/footer.jsp"%>
    </body>


</html>