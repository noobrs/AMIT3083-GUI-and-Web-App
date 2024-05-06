<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="entity.Staff" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">         
        <title>Staff Login</title>
                <%@include file="/layout/meta.html"%>

    </head>
    <body style="background-color: #25182E">
        <%
        String verificationStatus = (String)session.getAttribute("verificationStatus");
        Staff staff = (Staff)session.getAttribute("staff");
        
        String errorMessage = (String)session.getAttribute("errorMessage");
        String enteredStaffID = (String)session.getAttribute("enteredStaffID");
        
//        if(verificationStatus == null){
//            if(staff != null && staff.getStatus() == Staff.ACTIVE_STATUS){
//                response.sendRedirect("staffDashboard.jsp");
//            }    
//        }
        %>
        <%@include file="/layout/header.jsp"%>      

        <div class="mainBody mt-5" style="display: flex;
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
                <div class="card" style="width: 50%; border: 2px #FFBE00 solid">
                    <h5 class="card-header yellow_black">Staff Login page</h5>
                    <div class="card-body" style="background-color: #25182E">
                        <form action="../StaffLogin" >
                            <h5 class="card-title" style="color: #FFBE00;">Welcome, please enter your:</h5>
                            <div class="input-group mb-3" style="border: 2px #FFBE00 solid; border-radius: 8px">
                                <span class="input-group-text yellow_black" id="basic-addon1">Staff ID</span>
                                <input type="text" name="staffID" value="<%= (enteredStaffID==null)?"":enteredStaffID %>" class="form-control" placeholder="xxxxxx" aria-label="Username" aria-describedby="basic-addon1">
                            </div>
                            <div class="input-group mb-3" style="border: 2px #FFBE00 solid; border-radius: 8px">
                                <span class="input-group-text yellow_black" id="basic-addon1">Password</span>
                                <input type="password" name="staffPassword"  class="form-control" placeholder="xxxxxx" aria-label="Password" aria-describedby="basic-addon1">
                            </div>
                            <div class="d-flex justify-content-center">
                                <input class="btn btn-primary me-2 yellow_black" type="submit" value="Log In">
                                <input class="btn btn-primary" type="reset" value="Reset" style="background-color: #CA1F3D; color: #FFFFFF; border: 2px #CA1F3D solid">                              
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
