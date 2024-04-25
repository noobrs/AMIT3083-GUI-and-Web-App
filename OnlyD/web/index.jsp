<%-- 
    Document   : index
    Created on : 25 Apr 2024, 8:53:35 AM
    Author     : Vin Sen
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title><%= application.getInitParameter("storeName")%></title>
        <%@include file="layout/meta.html"%>
    </head>
    <body>
        <%@include file="layout/header.jsp"%>
        <h1>Hello World!</h1>
        
        <%@include file="layout/footer.jsp"%> 
    </body>
</html>
