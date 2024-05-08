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
        <%@include file="/layout/meta.html"%>

    </head>
    <body>
        <%@include file="/layout/header.jsp"%>


        <!--        <table border="0" cellspacing="10">-->
        <div class="mt-5">
            <div class="container dashBoard">
                <div class="card" style="width: 50%; border: 2px #FFBE00 solid; background-color: #25182E; text-align: center">
                    <div class="card-head yellow_black">
                        <h5>Search Staff</h5>
                    </div>
                    <div class="card-body" style="color: #FFBE00">
                        <form action="searchStaff.jsp" method="post">
                            <div style="display: flex; margin-bottom: 100px">
                                <h5 class="m-2">Staff ID: </h5>

                                <select name="staffID selectList" style="width:80%">
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
                            </div>
                            <tr>
                                <td colspan="2">
                                    <input class="btn" style="background-color: #CA1F3D; color: #FFFFFF" type="submit" value="Delete Staff" name="button"/>
                                    <input class="btn yellow_black" type="submit" value="Update Staff" name="button"/>
                                </td>
                            </tr>
                        </form>
                    </div>

                </div>
            </div>
        </div>
        <!--        </table>-->

        <%@include file="/layout/footer.jsp"%>
    </body>
</html>
