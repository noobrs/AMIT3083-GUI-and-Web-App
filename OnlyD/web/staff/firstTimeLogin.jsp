<%@include file="staffAuthentication.jsp"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page  import="entity.Staff" %>
<jsp:useBean id="staff" class="Staff" scope="session" ></jsp:useBean>
    <!DOCTYPE html>
    <html>
        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
            <title>First Time Login</title>
            <link rel="shortcut icon" type="image/x-icon" href="/OnlyD/layout/favicon_onlyD.ico">
        </head>
        <body>
        <%@include file="/layout/header.jsp"%> 
        
        <%
            if(staff.getStatus().equals(Staff.ACTIVE_STATUS)){
            response.sendRedirect("staffDashboard.jsp");
            }
            
            String errorMessage = (String)session.getAttribute("errorMessage");
            String enteredStaffName = (String)session.getAttribute("enteredStaffName");
            String enteredStaffEmail = (String)session.getAttribute("enteredStaffEmail");
        %>
        
        <div class="mainBody" style="display: flex;
             align-content: center; flex-wrap: wrap">
            <div class="loginCard container">
                <div class="card" style="width: 50%">
                    <h5 class="card-header">First Time Login</h5>
                    <div class="card-body">
                        <form action="../StaffVerification" method="POST">
                            <h5 class="card-title">Welcome Staff ${staff.staffid}, please setup your details:</h5>
                            <div class="input-group mb-3">
                                <span class="input-group-text" id="basic-addon1">Staff ID</span>
                                <input type="text" name="staffID" value="${staff.staffid}" class="form-control" placeholder="xxxxxx" aria-label="Username" aria-describedby="basic-addon1" disabled>
                            </div>
                            <div class="input-group mb-3">
                                <span class="input-group-text" id="basic-addon1">Name</span>
                                <input type="text" name="staffName" value="<%= (enteredStaffName== null)? staff.getName():enteredStaffName %>" class="form-control" placeholder="xxxxxx" aria-label="Username" aria-describedby="basic-addon1" required>
                            </div>
                            <div class="input-group mb-3">
                                <span class="input-group-text" id="basic-addon1">Email</span>
                                <input type="email" name="staffEmail" value="<%= (enteredStaffEmail==null)?"":enteredStaffEmail %>" class="form-control" placeholder="xxxxxx" aria-label="Username" aria-describedby="basic-addon1" required>
                            </div>
                            <div class="input-group mb-3">
                                <span class="input-group-text" id="basic-addon1">Password</span>
                                <input type="password" name="staffPassword" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}" class="form-control" placeholder="xxxxxx" aria-label="Password" aria-describedby="basic-addon1" required>
                            </div>
                            <div class="input-group mb-3">
                                <span class="input-group-text" id="basic-addon1">Re-enter Password</span>
                                <input type="password" name="reStaffPassword" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}" class="form-control" placeholder="xxxxxx" aria-label="Password" aria-describedby="basic-addon1" required>
                            </div>
                            <div class="d-flex justify-content-center">
                                <input class="btn btn-primary me-2" type="submit" value="Submit">
                                <input class="btn btn-primary" type="reset" value="Reset">                              
                            </div>
                        </form>
                        <% if(errorMessage != null) { %>
                        <div class="error-message" style="color: red;">
                            ${errorMessage}
                        </div>
                        <% 
                            session.removeAttribute("errorMessage");
                            }
                        %>
                    </div>
                </div>
            </div>
        </div>

        <%@include file="/layout/footer.jsp"%> 
    </body>
</html>
