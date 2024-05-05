<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page  import="entity.Category" %>
<%
  List<Category> categoryList = (List)session.getAttribute("categoryListProduct");
%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add Product</title>
        <style>
            .image-container {
                width: 200px;
                height: 120px;
                overflow-y: auto;
            }

            .image-container img{
                height: 100px;
                width: 100px;
            }
        </style>
    </head>
    <body>
        <form action="../AddProduct" method="post">
            <table border="0">
                <tr>
                    <td>Name</td>
                    <td><input type="text" name="name" required></td>
                </tr>
                <tr>
                    <td>Price</td>
                    <td><input type="number" name="price" min="0.00" step="0.01" required></td>
                </tr>
                <tr>
                    <td>Stock</td>
                    <td><input type="number" name="stock"  min="0" required></td>
                </tr>
                <tr>
                    <td>Description</td>
                    <td><input type="text" name="description" size="50" required></td>
                </tr>
                <tr>
                    <td>
                        <div class="image-container">
                            <%for (int i = 1; i < 4; i++) { %>    <%-- hardcode, rmb to adjust the num --%>
                            <% String path = "../image/img_" + i +".jpg"; %>
                            <br/><a><%=i%></a><br/>
                            <img src="<%=path%>" >
                            <% } %>
                        </div>
                    <td>
                </tr>
                <tr>
                    <td>
                        Image No
                    </td>
                    <td>
                        <input type="number" name="imgId" min="1" max="3" required> <%-- hardcode, rmb to adjust the max --%>
                    </td>
                </tr>
                <tr>
                    <td>Category Name</td>
                    <td><select name="categoryid">
                            <% for (Category category: categoryList){%>
                            <option value="<%=category.getCategoryid()%>">
                                <%=category.getCategoryname()%>
                                <%}%>
                        </select>
                        <br>
                    </td>
                </tr>
                <tr>
                    <td>Add by</td>
                    <td><input type="text" name="staffid" size="50" required></td>
                </tr>


            </table>
            <input type="submit" value="Add">
            <input type="reset" value="Reset">
        </form>
        <div>

        </div>
    </body>
</html>
