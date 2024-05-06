<%-- 
    Document   : productCard
    Created on : Apr 22, 2024, 4:42:46 PM
    Author     : danie
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
                <%@include file="/layout/meta.html"%>

    </head>
    <body>
        <div class="col">
            <div class="card">
                <img src="<%=request.getContextPath()%>/layout/grey_placeholder.jpg" class="card-img-top" alt="...">
                <div class="card-body">
                    <h5 class="card-title"><a href="detailedProductPage.jsp">detailedProductPage</a></h5>
                    <p class="card-text">This is a longer card with supporting text below as a natural lead-in to additional content. This content is a little bit longer.</p>
                </div>
            </div>
        </div>
    </body>
</html>
