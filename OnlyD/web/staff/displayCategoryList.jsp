<%@page import="java.util.List"%>
<%@page  import="entity.Category" %>
<%
  List<Category> categoryList = (List)session.getAttribute("categoryList");
%>
<h1>Search Category </h1>
<table border="0" cellspacing="10">
<form action="searchCategory.jsp" method="post">
    <tr>
        <td>Category ID</td>
        <td><select name="categoryId">
                <% for (Category category: categoryList){%>
                <option value="<%=category.getCategoryid()%>">
                    <%=category.getCategoryid()%>
                <%}%>
            </select>
            <br>
        </td>
    </tr>
    <tr>
        <td colspan="2">
            <input type="submit" value="Delete" name="categoryButton"/>
            <input type="submit" value="Update" name="categoryButton"/>
        </td>
    </tr>
</form>
</table>
