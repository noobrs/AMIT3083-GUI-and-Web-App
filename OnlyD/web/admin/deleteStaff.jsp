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
        <title>Delete Staff</title>
    </head>
    <body>
        <%@include file="/layout/header.jsp"%>
        <div class="container mt-5">
            <div class="dashBoard">
                <div class="card card_deco"  style="border: 2px #FFBE00 solid;">

                    <%
                        Staff staff = (Staff)session.getAttribute("staffFound");
                        if(staff != null){
                    %>
                    <div class="card-head yellow_black">
                        <h1>Delete Staff</h1>
                    </div>
                    <div class="card-body">
                        <form action="../DeleteStaff" method="POST" onsubmit="return window.confirm('Confirm delete this staff?')">
                            <div class="input-group mb-3">
                                <span class="input-group-text yellow_black">
                                    Staff ID
                                </span>
                                <input type="text" name="staffID" value="<%= staff.getStaffid() %>" class="form-control" aria-label="StaffID" aria-describedby="basic-addon1" readonly>
                            </div>

                            <div class="input-group mb-3">
                                <span class="input-group-text yellow_black">
                                    Staff Name
                                </span>
                                <input type="text" name="staffID" value="<%= staff.getName() %>" class="form-control" aria-label="StaffID" aria-describedby="basic-addon1" readonly>
                            </div>

                            <div class="input-group mb-3">
                                <span class="input-group-text yellow_black">
                                    Staff Email
                                </span>
                                <input type="text" name="staffID" value="<%= staff.getEmail() %>" class="form-control" aria-label="StaffID" aria-describedby="basic-addon1" readonly>
                            </div>


                            <input class="btn reset_dlt_btn" type="submit" value="Delete Staff">
                        </form>   
                    </div>
                    <%
                        } else{
                    %>
                    Staff not found
                    <p><a href="<%=request.getContextPath() + "/" + application.getInitParameter("indexServlet")%>">Back to home page</a></p>
                    <%
                        }
                    %>

                </div>
            </div>
        </div>

        <%@include file="/layout/footer.jsp"%>
    </body>
</html>
