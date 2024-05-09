<%-- 
    Document   : payment
    Created on : May 5, 2024, 4:47:39 PM
    Author     : ASUS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="custAuthentication.jsp"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Payment</title>
    </head>
    <body>
        <%
            Double total = (Double)session.getAttribute("total");
        %>

        <%@include file="/layout/header.jsp"%>


        <div class="container mt-5 card_deco">
            <h1 style="color: #FFBE00;">Shipping Details</h1>
            <div class=" card" style="border: none">
                <div class="card-body">

                    <form action="processPaymentInput.jsp" method="post">

                        <div class="input-group mb-1">
                            <span class="input-group-text yellow_black">
                                Recipient Name :
                            </span>
                            <input class="form-control" type="text" id="rName" name="rName" placeholder="Name" required>
                        </div>
                        <br>
                        <div class="input-group mb-1">
                            <span class="input-group-text yellow_black">
                                Recipient H/P Number :
                            </span>
                            <input class="form-control" type="tel" id="rHPNumber" name="rHPNumber"  pattern="[0-9]{3}-[0-9]{7}|[0-9]{2}-[0-9]{8}|[0-9]{3}-[0-9]{8}" placeholder="012-34567890" required>
                        </div>
                        <br>
                        <div class="input-group mb-1">
                            <span class="input-group-text yellow_black">
                                Address :
                            </span>
                            <input class="form-control" type="text" id="sAddress1" name="sAddress1" required>
                        </div>
                        <br>
                        <div class="input-group mb-1">
                            <span class="input-group-text yellow_black">
                                State :
                            </span>
                            <select class="form-select" id="sState" name="sState" required>
                                <option value="W.P. Kuala Lumpur">W.P. Kuala Lumpur</option>
                                <option value="W.P. Labuan">W.P. Labuan</option>
                                <option value="W.P. Putrajaya">W.P. Putrajaya</option>
                                <option value="Selangor">Selangor</option>
                                <option value="Negeri Sembilan">Negeri Sembilan</option>
                                <option value="Perak">Perak</option>
                                <option value="Pahang">Pahang</option>
                                <option value="Kedah">Kedah</option>
                                <option value="Kelantan">Kelantan</option>
                                <option value="Johor">Johor</option>
                                <option value="Terengganu">Terengganu</option>
                                <option value="Perlis">Perlis</option>
                                <option value="Penang">Penang</option>
                                <option value="Malacca">Malacca</option>
                                <option value="Sabah">Sabah</option>
                                <option value="Sarawak">Sarawak</option>
                            </select>
                        </div>
                        <br>
                        <div class="input-group mb-1">
                            <span class="input-group-text yellow_black">
                                City :
                            </span>
                            <input class="form-control" type="text" id="sCity" name="sCity" required>
                        </div>
                        <br>
                        <div class="input-group mb-1">
                            <span class="input-group-text yellow_black">
                                Postal Code :
                            </span>
                            <input class="form-control" type="text" id="sPostCode" name="sPostCode" required maxlength="5" minlength="5">
                        </div>
                        <br>
                        <div style="text-align: left">
                            <h4>Total (RM) : <%= String.format("%.2f", total) %> </h4>
                        </div>
                        <br>
                        <div class="input-group mb-1">
                            <span class="input-group-text yellow_black">
                                Payment Type : 
                            </span>
                            <select class="form-select" id="paymentType" name="paymentType">
                                <option value="Cash On Delivery">Cash On Delivery</option>
                                <option value="Credit Card/Debit Card">Credit Card/Debit Card</option>
                            </select>
                        </div>
                        <br>
                        <br>
                        <input class="btn yellow_black" type="submit" value="Proceed">
                    </form>
                </div>
            </div>
        </div>

        <%@include file="/layout/footer.jsp"%>
    </body>


</html>