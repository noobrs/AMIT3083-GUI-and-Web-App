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
        <link rel="shortcut icon" type="image/x-icon" href="/OnlyD/layout/favicon_onlyD.ico">
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
                            <input class="form-control" type="text" id="cardNumber" name="cardNumber" placeholder="1111-2222-3333-4444" pattern="\d{4}-\d{4}-\d{4}-\d{4}" title="Please enter a valid card number with spaces between every four digits"
                   maxlength="19" minlength="19" required>
                        </div>
                        <br>
                        <div class="input-group mb-1">
                            <span class="input-group-text yellow_black">
                                Expiry :
                            </span>
                            <input class="form-control" type="text" id="cardExpiry" name="cardExpiry" placeholder="MM/YY" pattern="^(0[1-9]|1[0-2])\/([0-9]{2})$" title="Please enter a valid expiry date in the format MM/YY" 
       maxlength="5" minlength="5" required>
                        </div>
                        <br>
                        <div class="input-group mb-1">
                            <span class="input-group-text yellow_black">
                                CVV :
                            </span>
                            <input class="form-control" type="text" id="CVC" name="CVC" required placeholder="123" title="Please enter a valid 3-digit CVV code" maxlength="3" minlength="3">
                        </div>
                        <br>
                        <a href="payment.jsp" class="btn yellow_black">Back</a>
                        <a href="donePayment.jsp"><input class="btn yellow_black" type="submit" value="Proceed"></a>
                    </form>
                </div>
            </div>
        </div>
        <%@include file="/layout/footer.jsp"%>
    </body>
</html>
