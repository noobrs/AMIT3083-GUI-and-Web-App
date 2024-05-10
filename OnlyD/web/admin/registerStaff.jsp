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
        <link rel="shortcut icon" type="image/x-icon" href="/OnlyD/layout/favicon_onlyD.ico">
    </head>
    <body>
        <%@include file="/layout/header.jsp"%>
        <%
    //if new staff id havent set yet then go to servlet to get it
    if(session.getAttribute("reStaffIDValue") == null){
    response.sendRedirect("../staffRegister");
            }
        %>
        <div class="mainBody mt-5" style="display: flex;
             align-content: center; flex-wrap: wrap">
            <div class="RegisterCard container">
                <div class="card card_deco" style="width: 50%">
                    <div class="card-header yellow_black">
                        <h1>Staff Registration</h1>
                    </div>
                    <div class="card-body">
                        <form action="../staffRegister" method="POST">
                            <h5 class="card-title">Welcome, please enter a staff name:</h5>

                            <div class="input-group mb-3">
                                <span class="input-group-text yellow_black" id="basic-addon1">Staff ID</span>
                                <input type="text" name="staffID" value="${reStaffIDValue}" class="form-control" aria-label="StaffID" aria-describedby="basic-addon1" readonly>
                            </div>
                            <div class="input-group mb-3">
                                <span class="input-group-text yellow_black" id="basic-addon1">Staff Name</span>
                                <input type="text" name="staffName" value="${staffNameValue}" class="form-control" pattern="(?=.*[a-zA-Z]).*" placeholder="lengzai" aria-label="StaffName" aria-describedby="basic-addon1" required>
                            </div>
                            <div class="d-flex justify-content-center">
                                <a class="btn yellow_black me-2" href="../staff/staffDashboard.jsp">Dashboard</a>                            
                                <input class="btn yellow_black me-2" type="submit" value="Sign Up">
                                <input class="btn reset_dlt_btn me-2" type="reset" value="Reset">    
                            </div>
                        </form>

                        <div class="error-message" style="color: red;">
                            ${errorMessage}
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <%
        session.removeAttribute("reStaffIDValue");
        %>
        <%@include file="/layout/footer.jsp"%>
    </body>
</html>
