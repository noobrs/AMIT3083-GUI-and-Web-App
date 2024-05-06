<%-- 
    Document   : product
    Created on : Apr 22, 2024, 12:44:41 PM
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
        <%@include file="/layout/header.jsp"%> 
        <div class="container">
            <div class="row">
                <div class="col-2" style="background-color: greenyellow; width: 200px; height: 100%;">
                    <ul class="mt-5">
                        <li>first</li>
                        <li>second</li>
                        <li>third</li>
                    </ul>
                </div>
                <div class="col-10">
                    <div class="row row-cols-1 row-cols-md-3 g-4">
                        <%@include file="productCard.jsp" %>
                        <!--                        <div class="col">
                                                    <div class="card">
                                                        <img src="Icons/grey_placeholder.jpg" class="card-img-top" alt="...">
                                                        <div class="card-body">
                                                            <h5 class="card-title">Card title</h5>
                                                            <p class="card-text">This is a longer card with supporting text below as a natural lead-in to additional content. This content is a little bit longer.</p>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col">
                                                    <div class="card">
                                                        <img src="Icons/grey_placeholder.jpg" class="card-img-top" alt="...">
                                                        <div class="card-body">
                                                            <h5 class="card-title">Card title</h5>
                                                            <p class="card-text">This is a longer card with supporting text below as a natural lead-in to additional content. This content is a little bit longer.</p>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col">
                                                    <div class="card">
                                                        <img src="Icons/grey_placeholder.jpg" class="card-img-top" alt="...">
                                                        <div class="card-body">
                                                            <h5 class="card-title">Card title</h5>
                                                            <p class="card-text">This is a longer card with supporting text below as a natural lead-in to additional content.</p>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col">
                                                    <div class="card">
                                                        <img src="Icons/grey_placeholder.jpg" class="card-img-top" alt="...">
                                                        <div class="card-body">
                                                            <h5 class="card-title">Card title</h5>
                                                            <p class="card-text">This is a longer card with supporting text below as a natural lead-in to additional content. This content is a little bit longer.</p>
                                                        </div>
                                                    </div>
                                                </div>-->
                    </div>   
                </div>
            </div>
        </div>

        <%@include file="/layout/footer.jsp"%>
    </body>
</html>
