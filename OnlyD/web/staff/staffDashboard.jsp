<%-- 
    Document   : staffDashboard
    Created on : 26 Apr 2024, 4:36:31 PM
    Author     : Vin Sen
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="entity.Staff, entity.Customer" %>
<jsp:useBean id="staff" class="entity.Staff" scope="session"></jsp:useBean>
    <!DOCTYPE html>
    <html>
        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <%@include file="/layout/meta.html"%>
        <title>JSP Page</title>
    </head>
    <body>
        <%
//        Staff activeStaff = (Staff)session.getAttribute("staff");
//        Customer activeCustomer = (Customer)session.getAttribute("customer");

        Boolean isStaff = (Boolean)session.getAttribute("isStaff");
        Boolean isCustomer = (Boolean)session.getAttribute("isCustomer");
        boolean isAdmin = request.isUserInRole("AdminRole");

        // guest
        if(!isAdmin && isStaff == null && isCustomer == null){
            request.getRequestDispatcher("/staff/staffLogin.jsp").forward(request, response);
        } else if(isCustomer != null){
            request.getRequestDispatcher("/unauthorizedError.jsp").forward(request,response);
        }
        %>

        <%@include file="/layout/header.jsp"%>
        <p><%= staff.getStaffid() %></p>
        <p><%= staff.getName() %></p>
        <p><%= staff.getEmail() %></p>
        <p><%= staff.getPassword() %></p>

        <form action="../logout">
            <input type="submit" value="log out">
        </form>

        <%@include file="/layout/footer.jsp"%>
    </body>
</html>
