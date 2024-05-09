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

        <%@include file="/layout/header.jsp"%>

        <div class="container mt-5">
            <div class="dashBoard">
                <div class="card card_deco"  style="border: 2px #FFBE00 solid;">
                    <div class="card-head yellow_black">
                        <h1>Update Product</h1>
                    </div>
                    <div class="card-body">
                        <form action="../UpdateProduct" method="post" enctype="multipart/form-data">
                            <div class="input-group mb-3">
                                <span class="input-group-text yellow_black">Name</span>
                                <input class="form-control" type="text" name="name"
                                       value="<%=product.getName()%>" required>
                            </div>
                            <div class="input-group mb-3">
                                <span class="input-group-text yellow_black">Price (RM)</span>
                                <input class="form-control" type="number" name="price"
                                       value="<%=String.format("%.2f", product.getPrice())%>" min="0.00" step="0.01" required>
                            </div>
                            <div class="input-group mb-3">
                                <span class="input-group-text yellow_black">Stock</span>
                                <input class="form-control" type="number" name="stock"
                                       value="<%=String.valueOf(product.getStock())%>" min="0" required>
                            </div>
                            <div class="input-group mb-3">
                                <span class="input-group-text yellow_black">Description</span>
                                <input class="form-control" type="text" name="description" size="50"
                                       value="<%=product.getDescription()%>" required>
                            </div>
                            <div class="input-group mb-3">
                                <span class="input-group-text yellow_black">Image</span>
                                <input class="form-control" type="file" id="fileInput" name="image" accept="image/*" required />
                            </div>
                            <div class="input-group mb-3">
                                <div id="preview"><img src="<%= request.getContextPath() + "/image/" + product.getImage()%>"></div>
                            </div>
                            <div class="input-group mb-3">
                                <span class="input-group-text yellow_black">Category Name</span>
                                <select class="form-select" name="categoryid">
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
                            </div>
                                
                            <div style="display: flex; justify-content: center; flex-wrap: nowrap">
                                <a class="btn yellow_black me-2" href="../staff/staffDashboard.jsp">Dashboard</a>
                                <input class="btn yellow_black" type="submit" value="Update Product">
                            </div> 

                        </form>
                        <%} else {%>
                        Product ${product.name} not found
                        <p><a href="<%=request.getContextPath() + "/" + application.getInitParameter("indexServlet")%>">Back to home page</a></p>
                        <%}%>
                    </div>
                </div>
            </div>
        </div>

        <%@include file="/layout/footer.jsp"%>
    </body>
</html>

