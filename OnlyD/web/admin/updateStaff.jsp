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
        <title>JSP Page</title>
        <%@include file="/layout/meta.html"%>

    </head>
    <body>
        <%@include file="/layout/header.jsp"%>

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
        <h1>Update Staff</h1>
        <form action="../UpdateStaff" method="POST" onsubmit="return window.confirm('Confirm update this staff?')">
            <table>
                <tr>
                    <td>Staff ID</td>
                    <td>
                        <input type="text" name="staffID" value="<%= staff.getStaffid() %>" readonly>
                    </td>
                </tr>
                <tr>
                    <td>Staff Name</td>
                    <td>
                        <input type="text" name="staffName" value="<%= enteredStaffName %>">
                    </td>
                </tr>
                <tr>
                    <td>Staff Email</td>
                    <td>
                        <input type="text" name="staffEmail" value="<%= enteredStaffEmail %>">
                    </td>
                </tr>
                <tr>
                    <td>Password</td>
                    <td>
                        <input type="password" name="staffPassword" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}">
                    </td>
                </tr>
                <tr>
                    <td>Re-enter Password</td>
                    <td>
                        <input type="password" name="reStaffPassword" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}">
                    </td>
                </tr>
            </table>
            <input type="submit" value="Update Staff">
        </form> 
        <% if(errorMessage != null){ %>
        <div><%= errorMessage %></div> 
        <%  }
          } else { %>
        Staff not found
        <p><a href="../index.jsp">Back to home page</a></p>
        <%
            }
        %>

        <%@include file="/layout/footer.jsp"%>
    </body>
</html>
