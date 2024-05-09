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
                    
                    <div class="card-head yellow_black">
                        <h1>TOP 10 Sold Product</h1>
                    </div>
                    
                    <div class="card-body">
                        <table class="table table-striped tableDeco">
                            <tr style="background-color: #FFBE00">
                                <th>Product</th>
                                <th>Name</th>
                                <th>Quantity Sold</th>
                            </tr>
                            <% for(int i = 0; i < productSold.size(); i++) { %>
                            <tr>
                                <td><img style="height: 120px; width: 120px; margin: auto" src="<%=request.getContextPath() + "/image/" + productSold.get(i).getImage() %>"></td>
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

                        

                        <% } else { %>
                        No product sold!
                        <% } %>
                        <div style="display: flex; justify-content: center; flex-wrap: nowrap">
                            <a class="btn yellow_black me-2" href="../staff/staffDashboard.jsp">Back to Dashboard</a>
                        </div> 
                    </div>
                </div>
            </div>
        </div>
        <%@include file="/layout/footer.jsp"%>
    </body>
</html>