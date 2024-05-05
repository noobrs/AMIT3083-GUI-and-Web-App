<%@page import="entity.Product"%>
<%@page import="entity.Category"%>
<%@page import="entity.Staff"%>
<%@page import="java.util.List"%>
<%@page import="java.util.regex.Matcher"%>
<%@page import="java.util.regex.Pattern"%>

<%!
    String extractNumber(String word) {
        Pattern pattern = Pattern.compile("\\d+");
        Matcher matcher = pattern.matcher(word);
        if (matcher.find()) {
            return matcher.group();
        }
        return null;
    }
%>

<html>
    <head>
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
                        <% String str = extractNumber(product.getImage()); %>
                        <input type="number" name="image" value="<%=str%>" min="1" max="3" required> <%-- hardcode, rmb to adjust the max --%>
                    </td> <%-- hardcode, rmb to adjust the max --%>
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

