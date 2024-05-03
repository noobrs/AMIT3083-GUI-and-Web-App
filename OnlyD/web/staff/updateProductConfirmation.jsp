<%@page import="entity.Product"%>
<%@page import="entity.Category"%>
<%@page import="entity.Staff"%>
<%@page import="java.util.List"%>
<html>
    <head></head>
    <body>
        <%
            Product product = (Product) session.getAttribute("product");
            List<Category> categoryList = (List)session.getAttribute("categoryListProduct");
            Category categoryP = (Category) session.getAttribute("category");
            Staff staff = (Staff) session.getAttribute("staff");
            if (product != null) {
        %>
        <h1>Update Product</h1>
        <form action="../UpdateProduct" method="post">
            <table border="0">
                <tr>
                    <td>Name</td>
                    <td><input type="text" name="name"
                               value="<%=product.getName()%>" required></td>
                </tr>
                <tr>
                    <td>Price (RM)</td>
                    <td><input type="number" name="price"
                               value="<%=String.format("%.2f", product.getPrice())%>" min="0.00" step="0.01" required></td>
                </tr>
                <tr>
                    <td>Stock</td>
                    <td><input type="number" name="stock"
                               value="<%=String.valueOf(product.getStock())%>" min="0" required></td>
                </tr>
                <tr>
                    <td>Description</td>
                    <td><input type="text" name="description" size="50"
                               value="<%=product.getDescription()%>" required></td>
                </tr>
                <tr>
                    <td>Image</td>
                    <td><input type="text" name="image"
                               value="<%=product.getImage()%>" required></td>
                </tr>
                <tr>
                    <td>Category Name</td>
                    <td>
                        <select name="categoryid">
                            <option value="<%=categoryP.getCategoryid()%>">
                                <%=categoryP.getCategoryname()%>
                            </option>
                            <% for (Category category: categoryList) {
                   if (!category.getCategoryid().equals(categoryP.getCategoryid())) { %>
                            <option value="<%=category.getCategoryid()%>">
                                <%=category.getCategoryname()%>
                            </option>
                            <%   }
               } %>
                        </select>
                    </td>
                </tr>
                    <td>Add/Last Modified by</td>
                    <td><input type="text" name="staffid"
                               value="<%=staff.getStaffid()%>" ></td>
                </tr>
            </table>
            <input type="submit" value="Update Product">

        </form>
        <%} else {%>
        Product ${product.name} not found
        <p><a href="../index.html">Back to home page</a></p>
        <%}%>
        <div>
        </div>
    </body>
</html>

