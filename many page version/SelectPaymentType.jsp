<%-- 
    Document   : SelectPaymentType
    Created on : May 5, 2024, 10:52:29 PM
    Author     : ASUS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Select Payment Type</title>
    </head>
    <body>
        <h1>Select A Payment Type</h1>
        <form action="creditdebitcardPayment.jsp">
            <input type="submit" value="Credit Card/Debit Card">
        </form>
        <form action="donePayment.jsp">
            <input type="submit" value="Cash On Deliver">
        </form>
    </body>
</html>
