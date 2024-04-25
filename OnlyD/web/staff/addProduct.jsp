<%-- 
    Document   : addProduct
    Created on : 25 Apr 2024, 3:37:05 PM
    Author     : Vin Sen
--%>

<%@ page import="entity.Staff" %>
<jsp:useBean id="staff" class="entity.Staff" scope="session" ></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add Product</title>
    </head>
    <body>
        <%
        if(staff.getStaffID() == null){
        response.sendError(403,"Forbidden");
            }
        %>
        
        hi
    </body>
</html>
