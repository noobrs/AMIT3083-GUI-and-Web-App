<%@page import="entity.Category"%>
<html>
    <head></head>
    <body>
        <%
            Category category = (Category) session.getAttribute("category");
            if (category != null) {
        %>
        <h1>Update Category</h1>
        <form action="../UpdateCategory" method="post">
            <table border="0">
                <tr>
                    <td>Name</td>
                    <td><input type="text" name="name"
                               value="<%=category.getCategoryname()%>" required></td>
                </tr>
            </table>
            <input type="submit" value="Update Category">

        </form>
        <%} else {%>
        Category ${category.name} not found
        <p><a href="../index.html">Back to home page</a></p>
        <%}%>
        <div>
        </div>
    </body>
</html>

