<%@page import="java.util.List, entity.Staff"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    List<Staff> staffList = (List)session.getAttribute("staffList");
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Display Staff List</title>
    </head>
    <body>
        <%@include file="/layout/header.jsp"%>

        <h1>Search Staff</h1>
        <table border="0" cellspacing="10">
            <form action="searchStaff.jsp" method="post">
                <tr>
                    <td>Staff ID</td>
                    <td>
                        <select name="staffID">
                            <%
                                for(Staff s:staffList){
                            %>
                            <option value="<%=s.getStaffid()%>">
                                <%=s.getStaffid()%>
                            </option>
                            <%
                                }
                            %>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <input type="submit" value="Delete Staff" name="button"/>
                        <input type="submit" value="Update Staff" name="button"/>
                    </td>
                </tr>
            </form>
        </table>

        <%@include file="/layout/footer.jsp"%>
    </body>
</html>
