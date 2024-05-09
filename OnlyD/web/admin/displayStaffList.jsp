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
        <div class="container mt-5">
            <div class="dashBoard">
                <div class="card card_deco"  style="border: 2px #FFBE00 solid;">
                    <div class="card-head yellow_black">
                        <h1>Search Staff</h1>
                    </div>
                    <div class="card-body">
                        <form action="searchStaff.jsp" method="post">
                            <div class="input-group mb-3">
                                <span class="input-group-text yellow_black">Staff</span>
                                <select class="form-select" name="staffID">
                                    <%
                                        for(Staff s:staffList){
                                        if(s.getStaffid().equals(Staff.ADMIN_ID)){
                                            continue;
                                        }
                                    %>
                                    <option value="<%=s.getStaffid()%>">
                                        <%=s.getStaffid() + ", " + s.getName() %>
                                    </option>
                                    <%
                                        }
                                    %>
                                </select>
                            </div>
                        <div style="display: flex; justify-content: center; flex-wrap: nowrap">
                            <input class="btn yellow_black me-2" type="submit" value="Update Staff" name="button"/> 
                            <input class="btn reset_dlt_btn"  type="submit" value="Delete Staff" name="button"/>
                            <a class="btn yellow_black" href="../staff/staffDashboard.jsp">Back to Dashboard</a>
                        </div> 

                        </form>

                    </div>

                </div>
            </div>
        </div>
        <%@include file="/layout/footer.jsp"%>
    </body>
</html>
