<%-- 
    Document   : registerSuccess
    Created on : 23 Apr 2024, 3:27:26 PM
    Author     : Vin Sen
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Register Successfully</title>
    </head>
    <body>
        <%@include file="layout/header.jsp"%>

        <div class="container mt-5" style="display: flex; justify-content: center; margin-bottom: 30%; margin-top: 30%">
            <div class="card card_deco">
                <h1>Register Successfully!</h1>
                <p>Proceed to <a href="login.jsp">Login</a></p>
            </div>
        </div>

        <%@include file="layout/footer.jsp"%>  


    </body>
</html>
