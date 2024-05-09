<%@include file="staffAuthentication.jsp"%>
<%@page import="entity.Customer, java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Customer List</title>

    </head>
    <body>
        <%@include file="/layout/header.jsp"%>
        <div class="container mt-5">
            <div class="dashBoard">
                <div class="card card_deco"  style="border: 2px #FFBE00 solid;">
                    <div class="card-body">
                        <%
                            List<Customer> custList = (List<Customer>)session.getAttribute("custList");
                            if(custList != null){
                        %>

                        <table class="table table-striped tableDeco">
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

                        <div style="display: flex; justify-content: center; flex-wrap: nowrap">
                            <% if(request.isUserInRole("AdminRole")){ %>
                            <a class="btn yellow_black me-2" href="../register.jsp">Register Customer</a>
                            <a class="btn yellow_black me-2" href="../LoadCustomerList">Delete/Update Customers</a>
                            <% } %>
                            <a class="btn yellow_black" href="../staff/staffDashboard.jsp">Back to Dashboard</a>
                        </div> 

                        <% } else { %>
                        <div style="display: flex; justify-content: center">
                            <p>No Customer Record</p> 
                        </div>
                        <div style="display: flex; justify-content: center">
                            <a class="btn yellow_black m-2 dashBoardBtn" href="../staff/staffDashboard.jsp">Back to staff dashboard</a><br>
                        </div>
                        <% } %>
                    </div>
                </div>
            </div>
        </div>


        <%@include file="/layout/footer.jsp"%>
    </body>
</html>
