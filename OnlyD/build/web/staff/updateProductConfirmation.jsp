<%@page import="entity.Product"%>
<%@page import="entity.Category"%>
<%@page import="entity.Staff"%>
<html>
    <head></head>
    <body>
        <%
            Product product = (Product) session.getAttribute("product");
            Category category = (Category) session.getAttribute("category");
            Staff staff = (Staff) session.getAttribute("staff");
            if (product != null) {
        %>
        <h1>Update Product</h1>
        <form action="../UpdateProduct" method="post">
            <table border="0">
                <tr>
                    <td>Name</td>
                    <td><input type="text" name="name"
                               value="<%=product.getName()%>" readonly></td>
                </tr>
                <tr>
                    <td>Price (RM)</td>
                    <td><input type="text" name="price"
                               value="<%=String.format("%.2f", product.getPrice())%>" ></td>
                </tr>
                <tr>
                    <td>Stock</td>
                    <td><input type="text" name="stock"
                               value="<%=String.valueOf(product.getStock())%>" ></td>
                </tr>
                <tr>
                    <td>Description</td>
                    <td><input type="text" name="description" size="50"
                               value="<%=product.getDescription()%>" ></td>
                </tr>
                <tr>
                    <td>Image</td>
                    <td><input type="text" name="image"
                               value="<%=product.getImage()%>" ></td>
                </tr>
                <tr>
                    <td>Status</td>
                    <td><input type="text" name="status"
                               value="<%=product.getStatus()%>" ></td>
                </tr>
                <tr>
                    <td>Category ID</td>
                    <td><input type="text" name="categoryid"
                               value="<%=category.getCategoryid()%>" ></td>
                </tr>
                <tr>
                    <td>Staff ID</td>
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
            <% 
                String error = (String)session.getAttribute("errorUpd"); 
                out.println(error);
                session.setAttribute("errorUpd",null);
            %>
        </div>
    </body>
</html>

