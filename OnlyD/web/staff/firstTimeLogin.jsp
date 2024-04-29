<%-- 
    Document   : firstTimeLogin
    Created on : 26 Apr 2024, 4:38:37 PM
    Author     : Vin Sen
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="staff" class="entity.Staff" scope="session" ></jsp:useBean>
    <!DOCTYPE html>
    <html>
        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
            <title>First Time Login</title>
        </head>
        <body>
        <%@include file="../layout/header.jsp"%> 
        <div class="mainBody" style="display: flex;
             align-content: center; flex-wrap: wrap">
            <div class="loginCard container">
                <div class="card" style="width: 50%">
                    <h5 class="card-header">First Time Login</h5>
                    <div class="card-body">
                        <form action="../StaffVerification" method="POST">
                            <h5 class="card-title">Welcome ${staff.name}, please setup your details:</h5>
                            <div class="input-group mb-3">
                                <span class="input-group-text" id="basic-addon1">Staff ID</span>
                                <input type="text" name="staffID" value="${staff.staffID}" class="form-control" placeholder="xxxxxx" aria-label="Username" aria-describedby="basic-addon1" disabled>
                            </div>
                            <div class="input-group mb-3">
                                <span class="input-group-text" id="basic-addon1">Name</span>
                                <input type="text" name="staffName" value="${staff.name}" class="form-control" placeholder="xxxxxx" aria-label="Username" aria-describedby="basic-addon1" required>
                            </div>
                            <div class="input-group mb-3">
                                <span class="input-group-text" id="basic-addon1">Email</span>
                                <input type="text" name="staffEmail" value="${staffEmailValue}" class="form-control" placeholder="xxxxxx" aria-label="Username" aria-describedby="basic-addon1" required>
                            </div>
                            <div class="input-group mb-3">
                                <span class="input-group-text" id="basic-addon1">Password</span>
                                <input type="password" name="staffPassword" class="form-control" placeholder="xxxxxx" aria-label="Password" aria-describedby="basic-addon1" required>
                            </div>
                            <div class="input-group mb-3">
                                <span class="input-group-text" id="basic-addon1">Re-enter Password</span>
                                <input type="password" name="reStaffPassword" class="form-control" placeholder="xxxxxx" aria-label="Password" aria-describedby="basic-addon1" required>
                            </div>
                            <div class="d-flex justify-content-center">
                                <input class="btn btn-primary me-2" type="submit" value="Submit">
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
