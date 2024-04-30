<%-- 
    Document   : addPromotion
    Created on : Apr 27, 2024, 4:16:39 AM
    Author     : danie
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="Promotion" scope="session" class="entity.Promotion"></jsp:useBean>


<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add Promotion</title>
    </head>
    <body>
        <form action="AddPromotion" method="POST">
            <table>
                <tr>
                    <td>Enter Discount percentage:</td>
                    <td>
                        <input type="number" name="discountPercentage" size="50">
                    </td>
                </tr>
                <tr>
                    <td>Enter Starting Date of Promotion:</td>
                    <td>
                        <input type="date" name="startDateTime" size="50">
                    </td>
                </tr>
                <tr>
                    <td>Enter End Date of the Promotion</td>
                    <td>
                        <input type="date" name="endDateTime" size="50">
                    </td>
                </tr>
            </table>
            <input type="submit" name="Confirm" value="Add Promotion">
            <input type="reset" name="Reset" value="Reset">
        </form>
    </body>
</html>
