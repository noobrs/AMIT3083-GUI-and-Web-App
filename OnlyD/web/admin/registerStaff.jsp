<%-- 
    Document   : registerStaff
    Created on : 24 Apr 2024, 6:15:09 PM
    Author     : Vin Sen
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Register Page</title>
        <%@include file="../layout/meta.html"%>
    </head>
    <body style="height: 100%">
        <%@include file="../layout/header.jsp"%>

        <div class="mainBody" style="display: flex;
             align-content: center; flex-wrap: wrap">
            <div class="RegisterCard container">
                <div class="card" style="width: 50%">
                    <h5 class="card-header">Staff Register page</h5>
                    <div class="card-body">
                        <form action="../RegisterStaff?action=1" method="POST">
                            <h5 class="card-title">Welcome, please enter your:</h5>

                            <div class="input-group mb-3">
                                <span class="input-group-text" id="basic-addon1">Staff ID</span>
                                <input type="text" name="staffID" value="${staffIDValue}" class="form-control" placeholder="xxxxxx" aria-label="StaffID" aria-describedby="basic-addon1" required>
                            </div>
                            <div class="input-group mb-3">
                                <span class="input-group-text" id="basic-addon1">Staff Name</span>
                                <input type="text" name="staffName" value="${staffNameValue}" class="form-control" placeholder="xxxxxx" aria-label="StaffName" aria-describedby="basic-addon1" required>
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

        <%@include file="../layout/footer.jsp"%>
    </body>
</html>
