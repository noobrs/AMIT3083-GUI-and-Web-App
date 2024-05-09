
<%-- 
    Document   : staffDashboard
    Created on : 26 Apr 2024, 4:36:31 PM
    Author     : Vin Sen
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="entity.Staff" %>
<jsp:useBean id="staff" class="entity.Staff" scope="session"></jsp:useBean>

<%@include file="staffAuthentication.jsp"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Staff Dashboard</title>
    </head>
    <body>        
        <%@include file="/layout/header.jsp"%>
        <div class="mt-5" style="text-align: center; display: flex; justify-content: center">
            <% if(request.isUserInRole("AdminRole")){ %>
            <h4 class="black_yellow_border" style="width: 47%">Welcome Admin,</h4>
            <% } else { %>
            <h4 class="black_yellow_border" style="width: 47%">Welcome staff <%= staff.getStaffid() %> <%= staff.getName() %>,</h4>
            <% } %>
        </div>

        <div class="dashBoard mt-3">
            <div class="card card_deco">
                <div class="card-header yellow_black">
                    <h2>Choose an action:</h2>
                </div>
                <div class="card-body">
                    <% if((String)session.getAttribute("statusMsg") != null) { %>
                    <p><%=(String)session.getAttribute("statusMsg")%></p>
                    <% 
                        session.removeAttribute("statusMsg");
                        } %>

                    <% if(request.isUserInRole("AdminRole")){ %>
                    <h2 class="black_yellow_border">Staff</h2>
                    <div style="height: 50px">
                        <a class="btn yellow_black m-2 dashBoardBtn" href="../ViewStaff">View All Staffs</a><br>
                    </div>
                    <div style="height: 50px">
                        <a class="btn yellow_black m-2 dashBoardBtn" href="../admin/registerStaff.jsp">Add a staff</a><br>
                    </div>
                    <div style="height: 50px">
                        <a class="btn yellow_black m-2 dashBoardBtn" href="../LoadStaffList">Delete/Update staff</a><br>
                    </div>
                    <% } %>

                    <h2 class="black_yellow_border mt-2">Customer</h2>
                    <div style="height: 50px">
                        <a class="btn yellow_black m-2 dashBoardBtn" href="../ViewCustomer">View All Customers</a><br>
                    </div>
                    <% if(request.isUserInRole("AdminRole")){ %>
                    <div style="height: 50px">
                        <a class="btn yellow_black m-2 dashBoardBtn" href="../register.jsp">Add a Customer</a><br>    
                    </div>
                    <div style="height: 50px">
                        <a class="btn yellow_black m-2 dashBoardBtn" href="../LoadCustomerList">Delete/Update customer</a><br>
                    </div>
                    <% } %>

                    <h2 class="black_yellow_border mt-2">Product</h2>
                    <!--        for user-->
                    <div style="height: 50px">
                        <a class="btn yellow_black m-2 dashBoardBtn" href="../ViewProduct">View All Product</a><br>
                    </div>
                    <div style="height: 50px">
                        <a class="btn yellow_black m-2 dashBoardBtn" href="../ViewProductStaff">Add a Product</a><br>  
                    </div>
                    <div style="height: 50px">
                        <a class="btn yellow_black m-2 dashBoardBtn" href="../LoadProductList">Update Product</a><br>
                    </div>

                    <h2 class="black_yellow_border mt-2">Category</h2>
                    <div style="height: 50px">
                        <a class="btn yellow_black m-2 dashBoardBtn" href="../ViewCategory">View Category</a><br>
                    </div>

                    <h2 class="black_yellow_border mt-2">Promotion</h2>
                    <div style="height: 50px">
                        <a class="btn yellow_black m-2 dashBoardBtn" href="../ViewPromotion">View Promotion</a><br>
                    </div>
                    <div style="height: 50px">
                        <a class="btn yellow_black m-2 dashBoardBtn" href="addPromotion.jsp">Add Promotion</a><br>
                    </div>
                    <div style="height: 50px">
                        <a class="btn yellow_black m-2 dashBoardBtn" href="../LoadPromoList">Update Promotion</a><br>
                    </div>

                    <% if(request.isUserInRole("AdminRole")){ %>
                    <h2 class="black_yellow_border mt-2">Report Generation</h2>
                    <div style="height: 50px">
                        <a class="btn yellow_black m-2 dashBoardBtn" href="../ViewTopSold">View TOP 10 Sold Products</a><br>
                    </div>
                    <div style="height: 50px">
                        <a class="btn yellow_black m-2 dashBoardBtn" href="../ProcessSales">View Sales Records</a><br>
                    </div>
                    <% } %>
                </div>
            </div>
        </div>

        <%@include file="/layout/footer.jsp"%>
    </body>
</html>
