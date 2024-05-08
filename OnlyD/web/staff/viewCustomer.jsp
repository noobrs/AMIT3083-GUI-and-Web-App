<%@include file="staffAuthentication.jsp"%>
<%@page import="entity.Customer, java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>All Customers</title>
        <%@include file="/layout/meta.html"%>

    </head>
    <body style="background-color: #25182E">
        <%@include file="/layout/header.jsp"%>

        <div class="container mt-5" style="display: flex; justify-content: center">
            <%
                List<Customer> custList = (List<Customer>)session.getAttribute("custList");
                if(custList != null){
            %>

            <table class="table table-striped" style="border: 2px #FFBE00 solid; background-color: window;">
                <tr style="background-color: #FFBE00">
                    <th>Name</th>
                    <th>Username</th>
                    <th>Email</th>
                    <th>Phone Number</th>
                </tr>
                <% for(Customer c:custList){ %>
                <tr>
                    <td><%= c.getName() %></td>
                    <td><%= c.getUsername() %></td>
                    <td><%= c.getEmail() %></td>
                    <td><%= c.getPhoneNumber() %></td>
                </tr>
                <% } %>
            </table>



            <% } else { %>
            <div style="display: flex; justify-content: center">
                <p>Empty Customer Record</p> 
            </div>
            <% } %>
        </div>
        <div style="display: flex; justify-content: center">
            <a class="btn yellow_black m-2 dashBoardBtn" href="../staff/staffDashboard.jsp">Back to staff dashboard</a><br>
        </div>

        <%@include file="/layout/footer.jsp"%>
    </body>
</html>
