<%@include file="staffAuthentication.jsp"%>
<%@page import="entity.Product"%>
<%@page import="entity.Category"%>
<%@page import="entity.Staff"%>
<%@page import="java.util.List"%>
<html>
    <head>

        <script>

            document.addEventListener('DOMContentLoaded', function () {
                document.getElementById('fileInput').addEventListener('change', function (event) {
                    var files = event.target.files;
                    var preview = document.getElementById('preview');

                    // Clear any existing content
                    preview.innerHTML = '';

                    // Check if a file is selected
                    if (files.length > 0) {
                        var file = files[0];

                        // Only process image files
                        if (file.type.match('image.*')) {
                            var img = document.createElement('img');
                            img.src = URL.createObjectURL(file);
                            img.style.height = '100px';
                            img.style.display = 'block'; // Ensure the image is displayed in a block to put it on a new line
                            img.style.marginBottom = '10px';

                            // Append the image to the preview div
                            preview.appendChild(img);
                        } else {
                            // Display an error message if the selected file is not an image
                            preview.innerHTML = 'Please select an image file.';
                        }
                    }
                });
            });

        </script>
    </head>
    <body>
        <%
            Product product = (Product) session.getAttribute("product");
            List<Category> categoryList = (List)session.getAttribute("categoryListProduct");
//            Category categoryP = (Category) session.getAttribute("category");
            Staff staff = (Staff) session.getAttribute("staff");
            if (product != null) {
        %>
        <h1>Update Product</h1>
        <form action="../UpdateProduct" method="post" enctype="multipart/form-data">
            <table border="0">
                <tr>
                    <td>Name</td>
                    <td><input type="text" name="name"
                               value="<%=product.getName()%>" readonly required></td>
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
                    <td> <input type="file" id="fileInput" name="image" accept="image/*" required /></td>
                </tr>
                <tr>
                    <td><div id="preview"><img src="<%= request.getContextPath() + "/image/" + product.getImage()%>"></div></td>
                </tr>
                <tr>
                    <td>Status</td>
                    <td><select name="status">
                            <%
                                if(product.getStatus() == 0){
                            %>  
                            <option value="0">Deleted    
                            <option value="1">Active
                                <% }else{%>   
                            <option value="1">Active
                            <option value="0">Deleted
                                <%}%>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td>Category Name</td>
                    <td>
                        <select name="categoryid">
                            <option value="<%=product.getCategoryid().getCategoryid()%>">
                                <%=product.getCategoryid().getCategoryname()%>
                            </option>
                            <% for (Category category: categoryList) {
                   if (!category.getCategoryid().equals(product.getCategoryid().getCategoryid())) { %>
                            <option value="<%=category.getCategoryid()%>">
                                <%=category.getCategoryname()%>
                            </option>
                            <%   }
               } %>
                        </select>
                    </td>
            </table>
            <input type="submit" value="Update Product">

        </form>
        <%} else {%>
        Product ${product.name} not found
        <p><a href="<%=request.getContextPath()%>">Back to home page</a></p>
        <%}%>
        <div>
        </div>
    </body>
</html>

