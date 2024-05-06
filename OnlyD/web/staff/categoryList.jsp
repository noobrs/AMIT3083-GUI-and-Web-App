<%@include file="staffAuthentication.jsp"%>
<%@page import="java.util.List"%>
<%@page import="entity.Category"%>

<%
  List<Category> categoryList = (List)session.getAttribute("categoryList");
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">         
        <title>Category List</title>
        <%@include file="/layout/meta.html"%>
    </head>
    <body style="background-color: #25182E">
        <%@include file="/layout/header.jsp"%>        

        <div class="mt-5"> 
            <div class="container">
                <table class="table table-striped " border="1" style="border: 2px #FFBE00 solid; background-color: window;">
                    <tr class="yellow_black">
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
                <div style="display: flex; justify-content: center">
                    <p>
                        <a class="btn yellow_black" href="../staff/addCategory.jsp">Add Category</a>
                        <a class="btn yellow_black" href="../LoadCategoryList">Delete/Update Category</a>
                        <a class="btn yellow_black" href="../staff/staffDashboard.jsp">Back to Dashboard</a>
                    </p>                
                </div>

            </div>
        </div>



        <%@include file="/layout/footer.jsp"%>
    </body>
</html>
