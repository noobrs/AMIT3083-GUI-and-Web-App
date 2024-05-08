<%-- 
    Document   : addCategory
    Created on : 30 Apr 2024, 10:43:54 AM
    Author     : GIGABYTE
--%>
<%@include file="staffAuthentication.jsp"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add Category</title>
    </head>
    <body>
        <%@include file="/layout/header.jsp"%>

        <form action="../AddCategory" method="post">
            <table border="0">
                <tr>
                    <td>Category Name</td>
                    <td><input type="text" name="name" pattern="^(?i)(?!.\bnull\b).$" title="The word 'NULL' is not allowed."></td>
                </tr>
                <tr>
                    <td>Status</td>
                    <td><select name="status">
                            <option value="1"> Active
                            <option value="0"> Deleted
                        </select>
                    </td>
                </tr>
            </table>    
            <input type="submit" value="Add">
            <input type="reset" value="Reset">
        </form>

        <%@include file="/layout/footer.jsp"%>
    </body>
</html>
