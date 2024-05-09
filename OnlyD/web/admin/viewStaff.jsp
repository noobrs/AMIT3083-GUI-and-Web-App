<%-- 
    Document   : viewStaff
    Created on : 29 Apr 2024, 7:43:52 PM
    Author     : Vin Sen
--%>
<%@page import="entity.Staff, java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Staff List</title>
    </head>
    <body>
        <%@include file="/layout/header.jsp"%>
        <div class="container mt-5">
            <div class="dashBoard">
                <div class="card card_deco"  style="border: 2px #FFBE00 solid;">
                    <div class="card-body">
                        <table class="table table-striped tableDeco" border="1">
                            <%
                                List<Staff> staffList = (List<Staff>)session.getAttribute("staffList");
                                if(staffList != null){
                            %>
                            <tr style="background-color: #FFBE00">
                                <th>Staff ID</th>
                                <th>Staff Name</th>
                                <th>Staff Email</th>
                                <th>Staff status</th>
                            </tr>
                            <% for(Staff s:staffList){
                                if(s.getStaffid().equals(Staff.ADMIN_ID)){
                                    continue;
                                }
                            %>
                            <tr>
                                <td><%=s.getStaffid()%></td>
                                <td><%=s.getName()%></td>
                                <td><%=s.getEmail()%></td>
                                <td>
                                    <% if(s.getStatus() == Staff.ACTIVE_STATUS){ %>
                                    Active
                                    <% } else { %>
                                    Verifying
                                    <% } %>
                                </td>
                            </tr>            
                            <% } %>
                        </table>

                        <div style="display: flex; justify-content: center; flex-wrap: nowrap">
                            <a class="btn yellow_black me-2" href="../staffRegister">Add Staff</a>
                            <a class="btn yellow_black me-2" href="../LoadStaffList">Delete/Update Staff</a>

                            <a class="btn yellow_black" href="../staff/staffDashboard.jsp">Back to Dashboard</a>
                        </div> 
                        <% } else { %>
                        <p>No Staff Record</p>
                        <div style="display: flex; justify-content: center; flex-wrap: nowrap">
                             <a class="btn yellow_black" href="../staff/staffDashboard.jsp">Back to Dashboard</a>
                        </div> 
                        <% } %>
                    </div>
                </div>
            </div>
        </div>
        <%@include file="/layout/footer.jsp"%>
    </body>
</html>
