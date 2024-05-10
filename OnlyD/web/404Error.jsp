<%-- 
    Document   : 404Error
    Created on : 26 Apr 2024, 2:40:24 PM
    Author     : Vin Sen
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>404</title>
        <link rel="shortcut icon" type="image/x-icon" href="/OnlyD/layout/favicon_onlyD.ico">
    </head>


    <body>
        <%@include file="/layout/header.jsp"%>
        <div class="container mt-5" style="display: flex; justify-content: center; margin-bottom: 30%; margin-top: 30%">
            <div class="card card_deco">
                <h1 style="font-size: 100px">404</h1>
                <h1>Page Not Found!</h1>
                <p>Back to <a href="<%=request.getContextPath()%>">Home</a></p>
            </div>
        </div>

        <%@include file="/layout/footer.jsp"%>
    </body>
</html>