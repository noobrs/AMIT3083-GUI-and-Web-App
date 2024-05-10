<%-- 
    Document   : 500Error
    Created on : 7 May 2024, 9:25:42 PM
    Author     : Vin Sen
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>500</title>
        <link rel="shortcut icon" type="image/x-icon" href="/OnlyD/layout/favicon_onlyD.ico">
    </head>
    <body>

        <%
            String exceptionMsg = (String)session.getAttribute("exceptionMsg");
        %>

        <%@include file="/layout/header.jsp"%>
        <div class="container mt-5" style="display: flex; justify-content: center; margin-bottom: 30%; margin-top: 30%">
            <div class="card card_deco">
                <h1>Server connection problem!</h1>
                <% if(exceptionMsg != null) { %>
                <p><%=exceptionMsg%></p>
                <% }%>
                <p>Back to <a href="<%=request.getContextPath()%>">Home</a></p>
            </div>
        </div>

        <%@include file="/layout/footer.jsp"%>
    </body>
</html>