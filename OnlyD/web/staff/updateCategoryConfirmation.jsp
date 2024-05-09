<%@include file="staffAuthentication.jsp"%>
<%@page import="entity.Category"%>
<html>
    <head></head>
    <body>
        <%@include file="/layout/header.jsp"%>
        <div class="container mt-5">
            <div class="dashBoard">
                <div class="card card_deco"  style="border: 2px #FFBE00 solid;">
                    <%
                        Category category = (Category) session.getAttribute("category");
                        String message = (String)session.getAttribute("updateError");
                        if (category != null) {
                    %>

                    <div class="card-head yellow_black">
                        <h1>Update Category</h1>
                    </div>

                    <% if(message != null) { %>
                    <p><%= message %></p>
                    <% 
                        session.removeAttribute("updateError");
                        } %>

                    <div class="card-body">
                        <form action="../UpdateCategory" method="post">
                            <div class="input-group mb-3">
                                <span class="input-group-text yellow_black" id="basic-addon1">
                                    Name
                                </span>
                                <input class="form-control" type="text" name="name"
                                       value="<%=category.getCategoryname()%>" required>
                            </div>
                            <input class="btn yellow_black" type="submit" value="Update Category">

                        </form>
                    </div>
                    <%} else {%>
                    Category ${category.name} not found
                    <p><a href="<%=request.getContextPath() + "/" + application.getInitParameter("indexServlet")%>">Back to home page</a></p>
                    <%}%>

                </div>
            </div>
        </div>
        <%@include file="/layout/footer.jsp"%>
    </body>
</html>
