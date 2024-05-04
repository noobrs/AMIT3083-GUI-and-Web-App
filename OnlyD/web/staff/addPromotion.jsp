<%-- 
    Document   : addPromotion
    Created on : Apr 27, 2024, 4:16:39 AM
    Author     : danie
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add Promotion</title>
    </head>
    <body>
        <form action="../addPromotion" method="POST">
            <table>
                <tr>
                    <td>Enter Promotion ID</td>
                    <td>
                        <input type="text" name="productID" value="${AddPromotion.productID}" size="50">
                    </td>
                </tr>
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
