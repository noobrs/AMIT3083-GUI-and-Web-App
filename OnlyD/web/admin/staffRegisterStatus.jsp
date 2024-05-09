<%-- 
    Document   : staffRegisterStatus
    Created on : 29 Apr 2024, 1:44:41 PM
    Author     : Vin Sen
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Staff Register Status</title>
    </head>
    <body>

        <%@include file="/layout/header.jsp"%>
        <div class="container mt-5">
            <div class="dashBoard">
                <div class="card card_deco"  style="border: 2px #FFBE00 solid;">
                    <div class="card-head yellow_black">

                        <h4>
                            <%
                            String message = (String)session.getAttribute("staffRegSuccess");
                            if(message == null){
                            response.sendRedirect("registerStaff.jsp");
                                }
                            %>
                            <%= message %>

                        </h4>
                    </div>

                    <p>Back to <a href="../staff/staffDashboard.jsp">Dashboard</a></p>

                </div>
            </div>
            <%@include file="/layout/footer.jsp"%>

            <%
            session.removeAttribute("staffRegSuccess");
            %>
        </div>
    </body>
</html>
