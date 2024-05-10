<%-- 
    Document   : unauthorizedError
    Created on : 25 Apr 2024, 3:35:30 PM
    Author     : Vin Sen
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Unauthorized Access!</title>
        <link rel="shortcut icon" type="image/x-icon" href="/OnlyD/layout/favicon_onlyD.ico">
    </head>


    <body>
        <%@include file="/layout/header.jsp"%>
        <div class="container mt-5" style="display: flex; justify-content: center; margin-bottom: 30%; margin-top: 30%">
            <div class="card card_deco">
                <h1>Unauthorized Access!</h1>
                <p>You do not have permission to visit this page!</p>
                <p>Back to <a href="<%=request.getContextPath()%>">Home</a></p>
            </div>
        </div>

        <%@include file="/layout/footer.jsp"%>
    </body>
</html>