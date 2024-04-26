<%-- 
    Document   : header_footer
    Created on : Apr 10, 2024, 3:16:46 PM
    Author     : danie
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.time.Year, java.time.ZoneId, java.util.Calendar" %>
<!DOCTYPE html>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <%@include file="/layout/meta.html"%>
    </head>
    
    <body>     
            <footer style="bottom: 0; position:relative; width: 100%;">
                <div class="container">
                    <footer class="py-3 my-4">
                        <ul class="nav justify-content-center border-bottom pb-3 mb-3">
                            <li class="nav-item"><a href="#" class="nav-link px-2 text-muted">Home</a></li>
                            <li class="nav-item"><a href="#" class="nav-link px-2 text-muted">Features</a></li>
                            <li class="nav-item"><a href="#" class="nav-link px-2 text-muted">Pricing</a></li>
                            <li class="nav-item"><a href="#" class="nav-link px-2 text-muted">FAQs</a></li>
                            <li class="nav-item"><a href="#" class="nav-link px-2 text-muted">About</a></li>
                        </ul>
                        <p class="text-center text-muted"><%= application.getInitParameter("storeName")%></p>
                        <p class="text-center text-muted"><%= application.getInitParameter("storeEmail")%></p>
                        <p class="text-center text-muted"><%= application.getInitParameter("storePhoneNo")%></p>
                        <p class="text-center text-muted"><%= application.getInitParameter("storeAddress")%></p>
                        <p class="text-center text-muted">©<%= Year.now(ZoneId.of("Asia/Kuala_Lumpur")).getValue() %> <%= application.getInitParameter("storeCopyRight")%></p>
                    </footer>
                </div>
            </footer>
    </body>
</html>