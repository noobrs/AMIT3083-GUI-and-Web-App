<%@page import="entity.Product"%>
<html>
    <head>
        <link rel="shortcut icon" type="image/x-icon" href="/OnlyD/layout/favicon_onlyD.ico">
    </head>
    <body>

        <%@include file="/layout/header.jsp"%>
        <div class="container mt-5">
            <div class="dashBoard">
                <div class="card card_deco"  style="border: 2px #FFBE00 solid;">
                    <%
                        Product product = (Product) session.getAttribute("product");
                        if (product != null) {
                    %>

                    <div class="card-head yellow_black">
                        <h1>Delete Product</h1>
                    </div>
                    <div class="card-body">

                        <form action="../DeleteProduct" method="post" onsubmit="return window.confirm('Are you sure you want to delete this product?')">
                            <div class="input-group mb-3">
                                <span class="input-group-text yellow_black" id="basic-addon1">   
                                    Product ID
                                </span>
                                <input class="form-control" type="text" name="id"
                                       value="<%=product.getProductid()%>" readonly>
                            </div>
                            <div class="input-group mb-3">
                                <span class="input-group-text yellow_black" id="basic-addon1">   
                                    Description
                                </span>
                                <input class="form-control" type="text" name="description" size="50"
                                       value="<%=product.getDescription()%>" readonly>
                            </div>
                            <div class="input-group mb-3">
                                <span class="input-group-text yellow_black" id="basic-addon1">   
                                    Price (RM)
                                </span>
                                <input class="form-control" type="text" name="price"
                                       value="<%=String.format("%.2f", product.getPrice())%>" readonly>
                            </div>
                            <div style="display: flex; justify-content: center; flex-wrap: nowrap">
                                <a class="btn yellow_black me-2" href="../staff/staffDashboard.jsp">Dashboard</a>
                                <input class="btn reset_dlt_btn" type="submit" value="Delete Product">
                            </div>
                    </div>
                    </form>
                    <%} else {%>
                    Product ${product.id} not found
                    <p><a href="<%=request.getContextPath() + "/" + application.getInitParameter("indexServlet")%>">Back to home page</a></p>
                    <%}%>
                </div>
            </div>
        </div>
        <%@include file="/layout/footer.jsp"%>
    </body>
</html>