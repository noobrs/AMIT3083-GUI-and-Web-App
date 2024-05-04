<%@include file="staffAuthentication.jsp"%>
<%@page import="java.util.List"%>
<%@page import="entity.Category"%>

<%
  List<Category> categoryList = (List)session.getAttribute("categoryList");
%>

<table border="1">
    <tr>
        <th>Category ID</th>
        <th>Category Name</th>
        <th>Status</th>
    </tr>
    <% for (Category category: categoryList){ %>
        <tr>
            <td><%= category.getCategoryid() %></td>
            <td><%= category.getCategoryname() %></td>
            
            <%if(category.getStatus() == 0){ %>
            <td>Deleted</td>
            <% } else {%>
            <td>Active</td>
            <% } %>
        </tr>
    <% } %>
</table>
<br><br>
<p><a href="../staff/addCategory.jsp">Add Category</a></p>
<p><a href="../LoadCategoryList">Delete/Update Category</a></p>
<p><a href="../index.html">Back to home page</a></p>