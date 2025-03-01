<%-- 
    Document   : deleteStaff
    Created on : 29 Apr 2024, 3:10:26 PM
    Author     : Vin Sen
--%>

<%@page import="entity.Staff"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Update Staff</title>
        <link rel="shortcut icon" type="image/x-icon" href="/OnlyD/layout/favicon_onlyD.ico">
    </head>
    <body>
        <%@include file="/layout/header.jsp"%>

        <div class="container mt-5">
            <div class="dashBoard">
                <div class="card card_deco"  style="border: 2px #FFBE00 solid;">

                    <%
                        Staff staff = (Staff)session.getAttribute("staffFound");
                        String errorMessage = (String)session.getAttribute("errorMessage");
                        if(staff != null){
            
                            String enteredStaffName = (String)session.getAttribute("enteredStaffName");
                            String enteredStaffEmail = (String)session.getAttribute("enteredStaffEmail");

                            if(enteredStaffName == null || enteredStaffEmail == null){
                                enteredStaffName = staff.getName();
                                enteredStaffEmail = staff.getEmail();
                                }
                    %>

                    <div class="card-head yellow_black">
                        <h1>Update Staff</h1>
                    </div>

                    <div class="card-body">
                        <form action="../UpdateStaff" method="POST" onsubmit="return window.confirm('Confirm update this staff?')">
                            <div class="input-group mb-3">
                                <span class="input-group-text yellow_black" id="basic-addon1">
                                    Staff ID
                                </span>
                                <input class="form-control" type="text" name="staffID" value="<%= staff.getStaffid() %>" readonly>
                            </div>
                            <div class="input-group mb-3">
                                <span class="input-group-text yellow_black" id="basic-addon1">
                                    Name
                                </span>
                                <input class="form-control" type="text" name="staffName" value="<%= enteredStaffName %>">
                            </div>
                            <div class="input-group mb-3">
                                <span class="input-group-text yellow_black" id="basic-addon1">
                                    Email
                                </span>
                                <input class="form-control" type="email" name="staffEmail" value="<%= enteredStaffEmail %>">
                            </div>
                            <div class="input-group mb-3">
                                <span class="input-group-text yellow_black" id="basic-addon1">
                                    Password
                                </span>
                                <input class="form-control" type="password" name="staffPassword" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}">
                            </div>
                            <div class="input-group mb-3">
                                <span class="input-group-text yellow_black" id="basic-addon1">
                                    Re-enter Password
                                </span>
                                <input class="form-control" type="password" name="reStaffPassword" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}">
                            </div>
                            <div>
                                <a class="btn yellow_black me-2" href="../staff/staffDashboard.jsp">Dashboard</a>
                                <input class="btn yellow_black me-2" type="submit" value="Update Staff">
                            </div>

                        </form> 

                    </div>
                    <% if(errorMessage != null){ %>
                    <div class="error-message" style="color: red;"><%= errorMessage %></div> 
                    <%  
                        session.removeAttribute("errorMessage");
                        } %>
                </div>
            </div>
        </div>


        <% } else { %>
        Staff not found
        <p><a href="<%=request.getContextPath() + "/" + application.getInitParameter("indexServlet")%>">Back to home page</a></p>
        <%
            }
        %>

        <%@include file="/layout/footer.jsp"%>
    </body>
</html>
