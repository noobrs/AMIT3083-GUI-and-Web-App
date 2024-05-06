<%@include file="staffAuthentication.jsp"%>
<%@page import="java.util.List"%>
<%@page  import="entity.Category" %>
<%
  List<Category> categoryList = (List)session.getAttribute("categoryList");
%>
<html>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">         
        <title>Category</title>
        <%@include file="/layout/meta.html"%>
    </head>

    <body>
        <%@include file="/layout/header.jsp"%>        

        <h1>Search Category </h1>
        <table border="0" cellspacing="10">
            <form action="searchCategory.jsp" method="post">
                <tr>
                    <td>Category ID</td>
                    <td><select name="categoryId">
                            <% for (Category category: categoryList){
                            if(!category.getCategoryname().equals("NULL")){
                            %>      
                            <option value="<%=category.getCategoryid()%>">
                                <%=category.getCategoryid()%>
                                <%}
}%>
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
        <%@include file="/layout/footer.jsp"%>

    </body>
</html>