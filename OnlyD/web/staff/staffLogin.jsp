<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="entity.Staff" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">         
        <title>Staff Login</title>
        <link rel="shortcut icon" type="image/x-icon" href="/OnlyD/layout/favicon_onlyD.ico">
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

        <div class="mainBody mt-5" style="display: flex;
             align-content: center; flex-wrap: wrap">

            <div class="loginCard container">
                <div class="card card_deco" >
                    <h1 class="card-header yellow_black">Staff Login page</h1>
                    <div class="card-body">
                        <form action="../StaffLogin">
                            <h5 class="card-title" style="text-align: left">Welcome, please enter your:</h5>
                            <div class="input-group mb-3">
                                <span class="input-group-text yellow_black" id="basic-addon1">Staff ID</span>
                                <input type="text" name="staffID" value="<%= (enteredStaffID==null)?"":enteredStaffID %>" class="form-control" placeholder="xxxxxx" aria-label="Username" aria-describedby="basic-addon1" required> 
                            </div>
                            <div class="input-group mb-3">
                                <span class="input-group-text yellow_black" id="basic-addon1">Password</span>
                                <input type="password" name="staffPassword" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}" class="form-control" placeholder="xxxxxx" aria-label="Password" aria-describedby="basic-addon1" required>
                            </div>
                            <div class="d-flex justify-content-center">
                                <input class="btn yellow_black me-2" type="submit" value="Log In">
                                <input class="btn reset_dlt_btn" type="reset" value="Reset">                              
                            </div>
                        </form>
                        <%
                            if(verificationStatus != null){
                        %>
                        <h4 style="text-align: center"><%= verificationStatus %></h4>
                        <%
                            session.removeAttribute("verificationStatus");
                            }
                        %>
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