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
    </head>
    <body>
        <%@include file="/layout/header.jsp"%>
        
        <%
            List<Staff> staffList = (List<Staff>)session.getAttribute("staffList");
            if(staffList != null){
        %>
        
        <table border="1">
            <tr>
                <th>Staff ID</th>
                <th>Staff Name</th>
                <th>Staff Email</th>
                <th>Staff status</th>
            </tr>
            <% for(Staff s:staffList){ %>
            <tr>
                <td><%=s.getStaffID()%></td>
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
        
        <%@include file="/layout/footer.jsp"%>
    </body>
</html>
