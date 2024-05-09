<%@include file="/staff/staffAuthentication.jsp"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Add Promotion</title>
    </head>
    <body>
        <%@include file="/layout/header.jsp"%>
        <div class="container mt-5">
            <div class="dashBoard">
                <div class="card card_deco"  style="border: 2px #FFBE00 solid;">
                    <div class="card-head yellow_black">
                        <h1>Add Promotion</h1>
                    </div>
                    <div class="card-body">
                        <form action="../AddPromo" method="POST">

                            <div class="input-group mb-3">
                                <span class="input-group-text yellow_black">Promotion Code:</span>
                                <input class="form-control" type="text" name="promoCode" required="required" ><br>
                            </div>
                            <div class="input-group mb-3">
                                <span class="input-group-text yellow_black">Discount Percentage:</span>
                                <input class="form-control" type="number" min="0.01" max="100.00" step="0.01" name="discountPercentage" value="${AddPromotion.discountPercentage}" size="50"><br>
                            </div>
                            <div class="input-group mb-3">
                                <span class="input-group-text yellow_black">Redemption Quantity:</span>
                                <input class="form-control"  type="number" min="1" step="1" name="redemptionQty"><br>
                            </div>
                            <div>
                                <a class="btn yellow_black me-2" href="../staff/staffDashboard.jsp">Dashboard</a>
                                <input class="btn yellow_black me-2" type="submit" value="Add">
                                <input class="btn reset_dlt_btn" type="reset" value="Reset">
                            </div>
                        </form>
                    </div>


                    <%
                        String statusMsg = (String)session.getAttribute("statusMsg");
                        if(statusMsg != null){
                    %>
                    <%= statusMsg %>
                    <%
                        session.removeAttribute("statusMsg");
                        }
                    %>
                </div>
            </div>
        </div>
        <%@include file="/layout/footer.jsp"%>
    </body>
</html>