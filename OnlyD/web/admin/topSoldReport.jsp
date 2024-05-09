<%-- 
    Document   : topSoldReport
    Created on : 7 May 2024, 1:43:55 AM
    Author     : Vin Sen
--%>
<%@page import="java.util.List,java.lang.Integer"%>
<%@page import="entity.Product"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Top Sold Product</title>
    </head>
    <body>
        <%@include file="/layout/header.jsp"%>
        <div class="container mt-5">
            <div class="dashBoard">
                <div class="card card_deco"  style="border: 2px #FFBE00 solid;">
                    <%
            
                        List<Product> productSold = (List<Product>)session.getAttribute("productSold");
                        List<Integer> soldQty = (List<Integer>)session.getAttribute("soldQty");
                        if(productSold != null || !productSold.isEmpty()){
                    %>
                    <div class="card-body">
                        <table class="table table-striped tableDeco">
                            <tr style="background-color: #FFBE00">
                                <th>Product Name</th>
                                <th>Quantity</th>
                            </tr>
                            <% for(int i = 0; i < productSold.size(); i++) { %>
                            <tr>
                                <td><%= productSold.get(i).getName() %></td>
                                <td><%= soldQty.get(i) %></td>
                            </tr>
                            <% 
                                if(i == 9){
                                    break;
                                }
                                } 
                            %>
                        </table>


                        <% } %>
                    </div>
                </div>
            </div>
        </div>
        <%@include file="/layout/footer.jsp"%>
    </body>
</html>
