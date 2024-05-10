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
        <link rel="shortcut icon" type="image/x-icon" href="/OnlyD/layout/favicon_onlyD.ico">
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
                            <% session.removeAttribute("staffRegSuccess"); %>

                        </h4>
                    </div>

                    <div style="display: flex; justify-content: center; flex-wrap: nowrap; margin:20px;">
                        <a class="btn yellow_black me-2" href="../staff/staffDashboard.jsp">Dashboard</a>
                        <a class="btn yellow_black me-2" href="<%=request.getContextPath() + "/" + application.getInitParameter("indexServlet")%>">Home</a>
                    </div> 

                </div>
            </div>
        </div>
        <%@include file="/layout/footer.jsp"%> 
    </body>
</html>