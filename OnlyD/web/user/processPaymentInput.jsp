<%@include file="custAuthentication.jsp"%>
<%
String paymentType = request.getParameter("paymentType");
String address = request.getParameter("sAddress1");
String state = request.getParameter("sState");
String city = request.getParameter("sCity");
String postCode = request.getParameter("sPostCode");
            
String fullAddress = address + ", " + city + ", " + postCode + ", " + state;

session.setAttribute("fullAddress", fullAddress);
session.setAttribute("paymentType", paymentType);

response.sendRedirect("../AddOrder");
%>