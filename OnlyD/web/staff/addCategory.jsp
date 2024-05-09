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
        <div class="container mt-5">
            <div class="dashBoard">
                <div class="card card_deco"  style="border: 2px #FFBE00 solid;">
                    <div class="card-head yellow_black">
                        <h4 >Add Category</h4>
                    </div>
                    <div class="card-body">
                        <form action="../AddCategory" method="post">
                            <div class="input-group mb-3">
                                <span class="input-group-text yellow_black">Category Name</span>
                                <input class="form-control" type="text" name="name" pattern="^(?i)(?!.\bnull\b).$" title="The word 'NULL' is not allowed.">
                            </div>
                            <div>
                                <input class="btn yellow_black me-2" type="submit" value="Add">
                                <input class="btn reset_dlt_btn" type="reset" value="Reset"> 
                            </div>
                            
                        </form>
                    </div>  
                </div>
            </div>
        </div>


        <%@include file="/layout/footer.jsp"%>
    </body>
</html>
