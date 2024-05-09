<%@include file="staffAuthentication.jsp"%>
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
        <%@include file="/layout/header.jsp"%>
        <div class="container mt-5">
            <div class="dashBoard">
                <div class="card "  style="border: 2px #FFBE00 solid;">
                    <div class="card-head dashBoard yellow_black">
                        <h4>Add Product form</h4>
                    </div>
                    <div class="card-body">
                        <form action="../AddProduct" method="post" enctype="multipart/form-data">
                            <table class="table table_deco" border="0">
                                <tr>
                                    <td>Name</td>
                                    <td><input class="form-control " type="text" name="name" required></td>
                                </tr>
                                
                                <tr>
                                    <td>Price</td>
                                    <td><input class="form-control" type="number" name="price" min="0.00" step="0.01" required></td>
                                </tr>
                                <tr>
                                    <td>Stock</td>
                                    <td><input class="form-control" type="number" name="stock"  min="0" required></td>
                                </tr>
                                <tr>
                                    <td>Description</td>
                                    <td><input class="form-control" type="text" name="description" size="50" required></td>
                                </tr>
                                <tr>
                                    <td>Image</td>
                                    <td> <input class="form-control" type="file" id="fileInput" name="image" accept="image/*" required /></td>
                                </tr>
                                <tr>
                                    <td></td>
                                    <td><div id="preview"></div></td>
                                </tr>
                                <tr>
                                    <td>Status</td>
                                    <td><select class="form-select" name="status">
                                            <option value="0"> Deleted
                                            <option value="1"> Active
                                        </select>
                                    </td>
                                </tr>
                                <tr>
                                    <td>Category <br> Name</td>
                                    <td><select class="form-select" name="categoryid">
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
                                    <td><input class="form-control" type="text" name="staffid" size="50" required></td>
                                </tr>


                            </table>
                            <div class="dashBoard mt-3">
                                <input class="btn yellow_black me-2" type="submit" value="Add">
                                <input class="btn reset_dlt_btn" type="reset" value="Reset">
                            </div>
                        </form>
                    </div>

                </div>
            </div>

        </div>


        <div>

        </div>

        <%@include file="/layout/footer.jsp"%>
    </body>
</html>
