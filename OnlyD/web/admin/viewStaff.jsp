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
        <title>All Staffs</title>
        <%@include file="/layout/meta.html"%>

    </head>
    <body style="background-color: #25182E">
        <%@include file="/layout/header.jsp"%>
        <div class="container mt-5" style="display: flex; justify-content: center">
            <%
                List<Staff> staffList = (List<Staff>)session.getAttribute("staffList");
                if(staffList != null){
            %>


            <table class="table table-striped" border="1" style="border: 2px #FFBE00 solid; background-color: window;">
                <tr style="background-color: #FFBE00">
                    <th>Staff ID</th>
                    <th>Staff Name</th>
                    <th>Staff Email</th>
                    <th>Staff status</th>
                </tr>
                <% for(Staff s:staffList){ %>
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


            <% } else { %>
            <p>Empty Staff Record</p>
            <% } %>
        </div>
            <div style="display: flex; justify-content: center">
                <a class="btn yellow_black m-2 dashBoardBtn" href="../admin/adminDashboard.jsp">Back to admin dashboard</a><br>
            </div>
       
        <%@include file="/layout/footer.jsp"%>
    </body>
</html>
