<%-- 
    Document   : addPromotion
    Created on : Apr 27, 2024, 4:16:39 AM
    Author     : danie
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="entity.Product"%>
<%@page import="java.util.List"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add Promotion</title>
    </head>
    <body>
        <%
            Product selectedProduct = (Product) session.getAttribute("product");
            List<Product> productList = (List) session.getAttribute("productListToPromo");
            Product productP = (Product) session.getAttribute("product");

            if (selectedProduct != null) {
        %>
        <form action="../addPromotion" method="POST">
            <table>
                <tr>
                    <td>Category Name</td>
                    <td>
                        <select name="productID">
                            <option value="<%=productP.getProductID()%>">
                                <%=productP.getProductID()%>
                            </option>
                            <% for (Product productItem : productList) {
                        if (!productItem.getProductID().equals(productP.getProductID())) { %>
                            <option value="<%=productItem.getProductID()%>">
                                <%=productItem.getProductID()%>
                            </option>
                            <%   }
                    } %>
                        </select>
                    </td>
                </tr>
                <%
            } else {
                %>
                Product ${productP.productID} not found
                <p><a href="../index.html">Back to home page</a></p>
                <%
                    }
                %>


                <!--                <tr>
                                    <td>Choose a Promotion ID</td>
                                    <td>
                                        <input type="number" name="productID" value="${AddPromotion.productID}" size="50">
                                    </td>
                                </tr>-->
                <tr>
                    <td>Enter Discount percentage:</td>
                    <td>
                        <input type="number" name="discountPercentage" value="${AddPromotion.discountPercentage}" size="50">
                    </td>
                </tr>
                <tr>
                    <td>Enter Starting Date of Promotion:</td>
                    <td>
                        <input type="date" name="startDateTime" value="${AddPromotion.startDateTime}" size="50">
                    </td>
                </tr>
                <tr>
                    <td>Enter End Date of the Promotion</td>
                    <td>
                        <input type="date" name="endDateTime" value="${AddPromotion.endDateTime}" size="50">
                    </td>
                </tr>
            </table>
            <input type="submit" name="Confirm" value="Add Promotion">
            <input type="reset" name="Reset" value="Reset">
        </form>

        <div class="error-message" style="color: red;">
            ${errorMessage}
        </div>

    </body>
</html>
