<%@include file="staffAuthentication.jsp"%>
<%@page import="java.util.List"%>
<%@page  import="entity.Category" %>

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
                        <h1>Search Category </h1>
                    </div>

                    <div class="card-body">
                        <form action="searchCategory.jsp" method="post">

                            <div class="input-group mb-3">
                                <span class="input-group-text yellow_black" id="basic-addon1">  
                                    Category Name
                                </span>
                                <select class="form-select" name="categoryId">
                                    <% for (Category category: categoryList){
                                    if(!category.getCategoryname().equals("NULL")){
                                    %>      
                                    <option value="<%=category.getCategoryid()%>">
                                        <%=category.getCategoryname() %>
                                        <%}
}%>
                                </select>
                            </div>
                            <div>
                                <a class="btn yellow_black me-2" href="../staff/staffDashboard.jsp">Dashboard</a>
                                <input class="btn yellow_black me-2" type="submit" value="Update" name="categoryButton"/>
                                <!<!-- only admin can delete product -->
                                <% if(request.isUserInRole("AdminRole")){ %>
                                <input class="btn reset_dlt_btn" type="submit" value="Delete" name="categoryButton"/>
                                <% } %>
                            </div>

                        </form>
                    </div>

                </div>
            </div>
        </div>
        <%@include file="/layout/footer.jsp"%>

    </body>
</html>