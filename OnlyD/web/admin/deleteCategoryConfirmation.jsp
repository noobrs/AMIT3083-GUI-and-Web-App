<%@page import="entity.Category"%>
<html>
    <head></head>
    <body>
        <%
            Category category = (Category) session.getAttribute("category");
            if (category != null) {
        %>

        <%@include file="/layout/header.jsp"%>

        <h1>Delete Category</h1>
        <form action="../DeleteCategory" method="post" onsubmit="return window.confirm('Are you sure you want to delete this category?')">
            <table border="0">
                <tr>
                    <td>Category ID</td>
                    <td><input type="text" name="id"
                               value="<%=category.getCategoryid()%>" readonly></td>
                </tr>
                <tr>
                    <td>Name</td>
                    <td><input type="text" name="description" size="50"
                               value="<%=category.getCategoryname()%>" readonly></td>
                </tr>
            </table>
            <input type="submit" value="Delete Category">

        </form>
        <%} else {%>
        Category ${category.id} not found
        <p><a href="<%=request.getContextPath() + "/" + application.getInitParameter("indexServlet")%>">Back to home page</a></p>
        <%}%>

        <%@include file="/layout/footer.jsp"%>
    </body>
</html>

