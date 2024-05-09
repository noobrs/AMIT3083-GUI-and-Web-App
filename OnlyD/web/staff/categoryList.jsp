<%@include file="staffAuthentication.jsp"%>
<%@page import="java.util.List"%>
<%@page import="entity.Category"%>

<%
  List<Category> categoryList = (List)session.getAttribute("categoryList");
%>


<%@include file="/layout/header.jsp"%>
<div class="container mt-5">
    <div class="dashBoard">
        <div class="card card_deco"  style="border: 2px #FFBE00 solid;">
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
                <div>
                    <a class="btn yellow_black" href="../staff/addCategory.jsp">Add Category</a>
                    <a class="btn yellow_black" href="../LoadCategoryList">Delete/Update Category</a>
                    <a class="btn yellow_black"href="../index.html">Back to home page</a>         
                </div>
            </div>


        </div>
    </div>
</div>
<%@include file="/layout/footer.jsp"%>