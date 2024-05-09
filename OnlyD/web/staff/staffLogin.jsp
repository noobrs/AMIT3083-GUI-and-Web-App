<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="entity.Staff" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">         
        <title>Staff Login</title>
    </head>
    <body>
        <%
        String verificationStatus = (String)session.getAttribute("verificationStatus");
        Staff staff = (Staff)session.getAttribute("staff");
        
        String errorMessage = (String)session.getAttribute("errorMessage");
        String enteredStaffID = (String)session.getAttribute("enteredStaffID");
        
        // if is admin or staff access this page, they will be redirected
        if(request.isUserInRole("AdminRole") || 
                (((Boolean)session.getAttribute("isStaff") != null) && (verificationStatus == null))){

            response.sendRedirect("staffDashboard.jsp");  
        } else if((Boolean) session.getAttribute("isCustomer") != null){
            response.sendRedirect("../unauthorizedError.jsp");
        }
        %>
        <%@include file="/layout/header.jsp"%>      

        <div class="mainBody" style="display: flex;
             align-content: center; flex-wrap: wrap">

            <%
            if(verificationStatus != null){
            %>
            <div><%= verificationStatus %></div>
            <%
                session.removeAttribute("verificationStatus");
                }
            %>
            <div class="loginCard container">
                <div class="card" style="width: 50%">
                    <h5 class="card-header">Staff Login page</h5>
                    <div class="card-body">
                        <form action="../StaffLogin">
                            <h5 class="card-title">Welcome, please enter your:</h5>
                            <div class="input-group mb-3">
                                <span class="input-group-text" id="basic-addon1">Staff ID</span>
                                <input type="text" name="staffID" value="<%= (enteredStaffID==null)?"":enteredStaffID %>" class="form-control" placeholder="xxxxxx" aria-label="Username" aria-describedby="basic-addon1">
                            </div>
                            <div class="input-group mb-3">
                                <span class="input-group-text" id="basic-addon1">Password</span>
                                <input type="password" name="staffPassword" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}" class="form-control" placeholder="xxxxxx" aria-label="Password" aria-describedby="basic-addon1">
                            </div>
                            <div class="d-flex justify-content-center">
                                <input class="btn btn-primary me-2" type="submit" value="Log In">
                                <input class="btn btn-primary" type="reset" value="Reset">                              
                            </div>
                        </form>
                        <% if(errorMessage != null) { %>    
                        <div class="error-message" style="color: red;">
                            <%= errorMessage %>
                        </div>
                        <% 
                            session.removeAttribute("errorMessage");
                            } 
                            if(enteredStaffID != null){
                                session.removeAttribute("enteredStaffID");
                            }
                            
                        %>
                    </div>
                </div>
            </div>
        </div>

        <%@include file="/layout/footer.jsp"%>
    </body>
</html>
