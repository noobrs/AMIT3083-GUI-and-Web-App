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
        
        <%
            String address = request.getParameter("sAddress1");
            String state = request.getParameter("sState");
            String city = request.getParameter("sCity");
            String postCode = request.getParameter("sPostCode");
            
            String fullAddress = address + "<br>" + city + ", " + postCode + ", " + state;
            
            session.setAttribute("address", fullAddress);
        %>
        
        <%@include file="/layout/header.jsp"%>
        
        <h1>Select A Payment Type</h1>
        <form action="cardPayment.jsp">
            <input type="submit" value="Credit Card/Debit Card">
        </form>
        <form action="donePayment.jsp">
            <input type="submit" value="Cash On Deliver">
        </form>
        
        <%@include file="/layout/footer.jsp"%>
    </body>
</html>