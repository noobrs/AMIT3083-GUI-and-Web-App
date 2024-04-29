<%-- 
    Document   : addProduct
    Created on : 25 Apr 2024, 3:37:05 PM
    Author     : Vin Sen
--%>

<%@ page import="entity.Staff" %>
<jsp:useBean id="staff" class="entity.Staff" scope="session" ></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add Product</title>
    </head>
    <body>
        <form action="../AddProduct" method="post">
            <table border="0">
                <tr>
                    <td>Name</td>
                    <td><input type="text" name="name"></td>
                </tr>
                <tr>
                    <td>Price</td>
                    <td><input type="text" name="price"></td>
                </tr>
                <tr>
                    <td>Stock</td>
                    <td><input type="text" name="stock"></td>
                </tr>
                <tr>
                    <td>Description</td>
                    <td><input type="text" name="description" size="50"></td>
                </tr>
                <tr>
                    <td>Image</td>
                    <td><input type="text" name="image"></td>
                </tr>
                <tr>
                    <td>Status</td>
                    <td><input type="text" name="status"></td>
                </tr>
                <tr>
                    <td>Category ID</td>
                    <td><input type="text" name="categoryid" size="50"></td>
                </tr>
                <tr>
                    <td>Staff ID</td>
                    <td><input type="text" name="staffid" size="50"></td>
                </tr>


            </table>
            <input type="submit" value="Add">
            <input type="reset" value="Reset">
        </form>
        <div>
            <% 
                String error = (String)session.getAttribute("errorAdd"); 
                out.println(error);
                session.setAttribute("errorAdd",null);
            %>
        </div>
    </body>
</html>
