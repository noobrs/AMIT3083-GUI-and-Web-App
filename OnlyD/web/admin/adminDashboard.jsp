<%-- 
    Document   : adminDashboard
    Created on : 26 Apr 2024, 2:35:12 PM
    Author     : Vin Sen
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">        
        <title>Admin Dashboard</title>
        <%@include file="/layout/meta.html"%>

    </head>
    <body style="background-color: #25182E">
        <%@include file="/layout/header.jsp"%>        

        <%
            String statusMsg = (String)session.getAttribute("statusMsg");
            if(statusMsg != null){
        %>
        <div><%= statusMsg %></div>
        <%
            session.removeAttribute("statusMsg");
            }
        %>

        <div class="dashBoard mt-5">
            <div class="card" style="width: 50%; border: 2px #FFBE00 solid; background-color: #25182E; text-align: center">
                <div class="card-head yellow_black">
                    <h5>Choose an action</h5>
                </div>
                <div class="card-body" >
                    <h2 class="black_yellow_border " >Staff</h2>
                    <a class="btn yellow_black m-2 dashBoardBtn" href="../ViewStaff">View All Staffs</a><br>
                    <a class="btn yellow_black m-2 dashBoardBtn" href="registerStaff.jsp">Add a staff</a><br>        
                    <a class="btn yellow_black m-2 dashBoardBtn" href="../LoadStaffList">Delete/Update staff</a><br>

                    <h2 class="black_yellow_border mt-2" >Customer</h2>
                    <a class="btn yellow_black m-2 dashBoardBtn" href="../ViewCustomer">View All Customers</a><br>
                    <a class="btn yellow_black m-2 dashBoardBtn" href="../register.jsp">Add a Customer</a><br>        
                    <a class="btn yellow_black m-2 dashBoardBtn" href="../LoadCustomerList">Delete/Update customer</a><br>

                    <h2 class="black_yellow_border mt-2" >Product</h2>
                    <!--        for user-->
                    <a class="btn yellow_black m-2 dashBoardBtn" href="../ViewProduct">View All Product</a><br>
                    <a class="btn yellow_black m-2 dashBoardBtn" href="../ViewProductStaff">Add a Product</a><br>        
                    <a class="btn yellow_black m-2 dashBoardBtn" href="../LoadProductList">Delete/Update Product</a><br>

                    <h2 class="black_yellow_border mt-2" >Category</h2>
                    <a class="btn yellow_black m-2 dashBoardBtn" href="../ViewCategory">View Category</a><br>

                    <h2 class="black_yellow_border mt-2" >Report Generation</h2>
                    <a class="btn yellow_black m-2 dashBoardBtn" href="#">View TOP 10 Sold Products</a><br>
                    <a class="btn yellow_black m-2 dashBoardBtn" href="#">View Sales Records</a><br>
                </div>
            </div>
        </div>


        <%@include file="/layout/footer.jsp"%>
    </body>
</html>
