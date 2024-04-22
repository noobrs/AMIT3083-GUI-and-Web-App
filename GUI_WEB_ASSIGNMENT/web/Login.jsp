<%-- 
    Document   : LoginPage
    Created on : Apr 19, 2024, 10:42:45 AM
    Author     : danie
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login Page</title>
        <%@include file="bootstrapLinking.html"%>
    </head>
    <body style="height: 100%">
        <%@include file="header.jsp"%>
        <div class="mainBody" style="display: flex;
    align-content: center; flex-wrap: wrap">
            <div class="loginCard container">
                <div class="card" style="width: 50%">
                    <h5 class="card-header">Login page</h5>
                    <div class="card-body">
                        <form>
                            <h5 class="card-title">Welcome, please enter your:</h5>
                            <div class="input-group mb-3">
                                <span class="input-group-text" id="basic-addon1">Email</span>
                                <input type="text" class="form-control" placeholder="xxxx@gmail.com" aria-label="Username" aria-describedby="basic-addon1">
                            </div>
                            <div class="input-group mb-3">
                                <span class="input-group-text" id="basic-addon1">Password</span>
                                <input type="text" class="form-control" placeholder="xxxxxx" aria-label="Username" aria-describedby="basic-addon1">
                            </div>
                            <div class="d-flex justify-content-center">
                                <input class="btn btn-primary me-2" type="submit" value="Sign In">
                                <input class="btn btn-primary" type="reset" value="Reset">                              
                            </div>
                        </form>
                    </div>
                    <div class="text-center">
                        <p>OR</p>
                        <p>Don't have an account ?<br><a href="Register.jsp">Sign Up</a></p>
                    </div>
                </div>
            </div>
        </div>
        <%@include file="footer.jsp"%>
    </body>
</html>
