<%@include file="staffAuthentication.jsp"%>
<%@page import="java.util.List"%>
<%@page import="entity.Category"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Category List</title>
    </head>
    <body>
        <%
          List<Category> categoryList = (List)session.getAttribute("categoryList");
        %>


        <%@include file="/layout/header.jsp"%>
        <div class="container mt-5">
            <div class="dashBoard">
                <div class="card card_deco"  style="border: 2px #FFBE00 solid;">
                    <div class="card-head yellow_black">
                        <h1>Category List</h1>
                    </div>
                    <div class="card-body">
                        <table class="table table-striped tableDeco" border="1">
                            <tr style="background-color: #FFBE00">
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
                        <div style="display: flex; justify-content: center; flex-wrap: nowrap">
                            <a class="btn yellow_black me-2" href="../staff/staffDashboard.jsp">Dashboard</a>
                            <a class="btn yellow_black me-2" href="../staff/addCategory.jsp">Add Category</a>
                            <a class="btn yellow_black me-2" href="../LoadCategoryList">Delete/Update Category</a>
                        </div>
                    </div>


                </div>
            </div>
        </div>
        <%@include file="/layout/footer.jsp"%>
    </body>
</html>