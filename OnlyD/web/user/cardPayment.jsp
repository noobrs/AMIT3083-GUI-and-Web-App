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
        <div class="container p-0 mt-5 card_deco">
            <div class="card">

                <div class="card-head yellow_black">
                    <h2>Payment</h2>
                    <h3>Pay with Credit / Debit Card</h3>
                </div>

                <div class="card-body">
                    <form action="../AddOrder?cardStatus=valid" method="post">
                        <div class="input-group mb-1">
                            <span class="input-group-text yellow_black">
                                Card Number : 
                            </span>
                            <input class="form-control" type="text" id="cardNumber" name="cardNumber" required maxlength="16" minlength="16">
                        </div>
                        <br>
                        <div class="input-group mb-1">
                            <span class="input-group-text yellow_black">
                                Expiry :
                            </span>
                            <input class="form-control" type="text" id="cardExpiry" name="cardExpiry" placeholder="MMYY" required maxlength="4" minlength="4">
                        </div>
                        <br>
                        <div class="input-group mb-1">
                            <span class="input-group-text yellow_black">
                                CVC / CVV :
                            </span>
                            <input class="form-control" type="text" id="CVC" name="CVC" required maxlength="3" minlength="3">
                        </div>
                        <br>
                        <a href="donePayment.jsp"><input class="btn yellow_black" type="submit" value="Proceed"></a>
                    </form>
                </div>
            </div>
        </div>
        <%@include file="/layout/footer.jsp"%>
    </body>
</html>