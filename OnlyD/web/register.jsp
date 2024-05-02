<%-- 
    Document   : RegisterPage
    Created on : Apr 19, 2024, 10:42:45 AM
    Author     : danie
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Register Page</title>
        <%@include file="layout/meta.html"%>
    </head>
    <body style="height: 100%">
        <%@include file="layout/header.jsp"%>
        <div class="mainBody" style="display: flex;
             align-content: center; flex-wrap: wrap">
            <div class="RegisterCard container">
                <div class="card" style="width: 50%">
                    <h5 class="card-header">Register page</h5>
                    <div class="card-body">
                        <form action="Register" method="POST">
                            <h5 class="card-title">Welcome, please enter your:</h5>
                            <div class="input-group mb-3">
                                <span class="input-group-text" id="basic-addon1">Name</span>
                                <input type="text" name="name" value="${nameValue}" class="form-control" placeholder="xxxxxx" aria-label="Username" aria-describedby="basic-addon1" required>
                            </div>
                            <div class="input-group mb-3">
                                <span class="input-group-text" id="basic-addon1">Email</span>
                                <input type="text" name="email" value="${emailValue}" class="form-control" placeholder="xxxx@gmail.com" aria-label="Username" aria-describedby="basic-addon1" required>
                            </div>
                            <div class="input-group mb-3">
                                <span class="input-group-text" id="basic-addon1">Username</span>
                                <input type="text" name="username" value="${usernameValue}" class="form-control" placeholder="xxxxxx" aria-label="Username" aria-describedby="basic-addon1" required>
                            </div>
                            <div class="input-group mb-3">
                                <span class="input-group-text" id="basic-addon1">Phone Number</span>
                                <input type="text" name="phoneNumber" value="${phoneNumberValue}" class="form-control" placeholder="01xxxxxx" aria-label="Username" aria-describedby="basic-addon1" required>
                            </div>
                            <div class="input-group mb-3">
                                <span class="input-group-text" id="basic-addon1">Password</span>
                                <input type="password" name="password" value="${passwordValue}" class="form-control" placeholder="xxxxxx" aria-label="Username" aria-describedby="basic-addon1" required>
                            </div>                            
                            <div class="input-group mb-3">
                                <span class="input-group-text" id="basic-addon1">Re-enter Password</span>
                                <input type="password" name="rePassword" value="${rePasswordValue}" class="form-control" placeholder="xxxxxx" aria-label="Username" aria-describedby="basic-addon1" required>
                            </div>
                            <div class="d-flex justify-content-center">
                                <input class="btn btn-primary me-2" type="submit" value="Sign Up">
                                <input class="btn btn-primary" type="reset" value="Reset">                              
                            </div>
                        </form>
                        <div class="error-message" style="color: red;">
                            ${errorMessage}
                        </div>
                    </div>
                    <div class="text-center">
                        <p>OR</p>
                        <p>Already have an account ?<br><a href="login.jsp">Sign In</a></p>
                    </div>
                </div>
            </div>
        </div>
        <%@include file="layout/footer.jsp"%>
    </body>
</html>