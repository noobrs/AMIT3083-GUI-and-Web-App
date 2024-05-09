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
        <footer style="bottom: 0; position:relative; width: 100%; background-color: #FFBE00;">
            <div class="container">
                <footer class="row row-cols-5 pt-5 mt-5 border-top">
                    <div class="col">
                        <a href="<%=request.getContextPath()%>">
                            <img src="<%=request.getContextPath()%>/layout/only_D_Logo.png" alt="" width="40%" height="80%" style="margin-right: 10px" />
                        </a>
                    </div>

                    <div class="col">

                    </div>

                    <div class="col">

                    </div>

                    <div class="col">
                        <h5>Section</h5>
                        <ul class="nav flex-column">
                            <li class="nav-item"><a href="<%=request.getContextPath()%>" class="nav-link px-2 text-muted">Home</a></li>
                            <li class="nav-item mb-2"><a href="<%=request.getContextPath()%>/ViewProduct" class="nav-link p-0 text-muted">Product</a></li>
                        </ul>
                    </div>

                    <div class="col">
                        <h5>Contacts</h5>
                        <ul class="nav flex-column">
                            <li class="nav-item mb-2"><a class="text-center text-muted" href="mailto:<%= application.getInitParameter("storeEmail")%>">Gmail: <%= application.getInitParameter("storeEmail")%></a></li>
                            <li class="nav-item mb-2"><a class="text-center text-muted" href="tel:<%= application.getInitParameter("storePhoneNo")%>">Contact: <%= application.getInitParameter("storePhoneNo")%></a></li>
                        </ul>
                    </div>

                </footer>
                <div class="py-4 my-4 border-top" style="display: flex; justify-content: center">
                    <p>© <%= Year.now(ZoneId.of("Asia/Kuala_Lumpur")).getValue() %> <%= application.getInitParameter("storeCopyRight")%></p>
                </div>
            </div>
        </footer>
    </body>
</html>