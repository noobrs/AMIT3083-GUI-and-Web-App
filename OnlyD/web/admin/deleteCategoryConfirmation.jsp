<%@page import="entity.Category"%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Delete Category</title>
        <link rel="shortcut icon" type="image/x-icon" href="/OnlyD/layout/favicon_onlyD.ico">
    </head>
    <body>
        <%@include file="/layout/header.jsp"%>
        <div class="container mt-5">
            <div class="dashBoard">
                <div class="card card_deco"  style="border: 2px #FFBE00 solid;">
                    <%
                        Category category = (Category) session.getAttribute("category");
                        if (category != null) {
                    %>

                    <div class="card-head yellow_black">
                        <h1>Delete Category</h1>
                    </div>
                    <div class="card-body">
                        <form action="../DeleteCategory" method="post" onsubmit="return window.confirm('Are you sure you want to delete this category?')">

                            <div class="input-group mb-3">
                                <span class="input-group-text yellow_black" id="basic-addon1">
                                    Category ID
                                </span>
                                <input class="form-control" type="text" name="id"
                                       value="<%=category.getCategoryid()%>" readonly>
                            </div>
                            <div class="input-group mb-3">
                                <span class="input-group-text yellow_black" id="basic-addon1">
                                    Name
                                </span>
                                <input class="form-control" type="text" name="description" size="50"
                                       value="<%=category.getCategoryname()%>" readonly>
                            </div>

                            <input class=" btn reset_dlt_btn" type="submit" value="Delete Category">

                        </form>
                    </div>

                    <%} else {%>
                    Category ${category.id} not found
                    <p><a href="<%=request.getContextPath() + "/" + application.getInitParameter("indexServlet")%>">Back to home page</a></p>
                    <%}%>
                </div>
            </div>
        </div>
        <%@include file="/layout/footer.jsp"%>
    </body>
</html>