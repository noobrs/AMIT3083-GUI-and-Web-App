<%-- 
    Document   : staffDashboard
    Created on : 26 Apr 2024, 4:36:31 PM
    Author     : Vin Sen
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="entity.Staff" %>
<jsp:useBean id="staff" class="entity.Staff" scope="session"></jsp:useBean>

<%@include file="staffAuthentication.jsp"%>
<%
    if(request.isUserInRole("AdminRole")){
        request.getRequestDispatcher("/admin/adminDashboard.jsp").forward(request, response);
    }
%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Staff Dashboard</title>
        <%@include file="/layout/meta.html"%>

    </head>
    <body style="background-color: #25182E">        
        <%@include file="/layout/header.jsp"%>

        <div class="mt-5" style="text-align: center; display: flex; justify-content: center">
            <h5 style="background-color: #25182E; color: #FFBE00; width: 50%; border: 2px #FFBE00 solid;">Welcome staff <%= staff.getStaffid() %> <%= staff.getName() %></h5>
        </div>

        <div class="dashBoard">
            <div class="card" style="width: 50%; border: 2px #FFBE00 solid; background-color: #25182E; text-align: center">
                <div class="card-header yellow_black">
                    <h4>Choose an action:</h4>
                </div>
                <div class="card-body">
                    <h2 class="black_yellow_border" style="">Customer</h2>
                    <div style="height: 50px">
                        <a class="btn yellow_black m-2 dashBoardBtn" href="../ViewCustomer">View All Customers</a><br>
                    </div>

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
                        <a class="btn yellow_black m-2 dashBoardBtn" href="../ViewProductToPromo">Add Promotion</a><br>
                    </div>
                </div>
            </div>
        </div>


        <%@include file="/layout/footer.jsp"%>
    </body>
</html>
