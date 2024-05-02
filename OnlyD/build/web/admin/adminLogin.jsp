<%-- 
    Document   : adminLogin
    Created on : 24 Apr 2024, 5:41:36 PM
    Author     : Vin Sen
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <%@include file="../layout/meta.html"%>
        <title>JSP Page</title>
    </head>
    <body>
        <%@include file="../layout/header.jsp"%>      
        
        <div class="mainBody" style="display: flex;
             align-content: center; flex-wrap: wrap">
            <div class="loginCard container">
                <div class="card" style="width: 50%">
                    <h5 class="card-header">Login page</h5>
                    <div class="card-body">
                        <form action="j_security_check" method="POST">
                            <h5 class="card-title">Welcome, please enter your:</h5>
                            <div class="input-group mb-3">
                                <span class="input-group-text" id="basic-addon1">Username</span>
                                <input type="text" name="j_username" class="form-control" placeholder="xxxxxx" aria-label="Username" aria-describedby="basic-addon1">
                            </div>
                            <div class="input-group mb-3">
                                <span class="input-group-text" id="basic-addon1">Password</span>
                                <input type="password" name="j_password" class="form-control" placeholder="xxxxxx" aria-label="Password" aria-describedby="basic-addon1">
                            </div>
                            <div class="d-flex justify-content-center">
                                <input class="btn btn-primary me-2" type="submit" value="Log In">
                                <input class="btn btn-primary" type="reset" value="Reset">                              
                            </div>
                        </form>
                        <div class="error-message" style="color: red;">
                            ${errorMessage}
                        </div>
                    </div>
                    <div class="text-center">
                        <p>OR</p>
                        <p>Don't have an account ?<br><a href="register.jsp">Sign Up</a></p>
                    </div>
                </div>
            </div>
        </div>

        <%@include file="../layout/footer.jsp"%>
    </body>
</html>
