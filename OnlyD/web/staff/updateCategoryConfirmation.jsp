<%@include file="staffAuthentication.jsp"%>
<%@page import="entity.Category"%>
<html>
    <head></head>
    <body>
        <%
            Category category = (Category) session.getAttribute("category");
            if (category != null) {
        %>
        
        <%@include file="/layout/header.jsp"%>
        
        <h1>Update Category</h1>
        <form action="../UpdateCategory" method="post">
            <table border="0">
                <tr>
                    <td>Name</td>
                    <td><input type="text" name="name"
                               value="<%=category.getCategoryname()%>" pattern="^(?i)(?!.\bnull\b).$" title="The word 'NULL' is not allowed." required></td>
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
        
        <%@include file="/layout/footer.jsp"%>
    </body>
</html>

