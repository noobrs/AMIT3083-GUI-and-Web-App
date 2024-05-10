<%-- 
    Document   : logoutSuccess
    Created on : 10 May 2024, 10:22:19 AM
    Author     : Vin Sen
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Logout</title>
    </head>
    <body>
        <%@include file="/layout/header.jsp"%>
        <div class="container mt-5">
            <div class="dashBoard">
                <div class="card card_deco"  style="border: 2px #FFBE00 solid;">
                    <h3>
                        <%
                         Boolean success = (Boolean)session.getAttribute("logoutSuccess");
                         if (success != null){
                             out.println("Logout successfully!");
                             session.removeAttribute("logoutSuccess");
                            }
                         else
                             response.sendRedirect("SearchDetailForHome");
                        %>
                    </h3>
                    <div style="display: flex; justify-content: center; flex-wrap: nowrap; margin:20px;">
                        <a class="btn yellow_black me-2" href="<%=request.getContextPath() + "/" + application.getInitParameter("indexServlet")%>">Home</a>
                    </div> 
                </div>
            </div>
        </div>
        <%@include file="/layout/footer.jsp"%>
    </body>
</html>
