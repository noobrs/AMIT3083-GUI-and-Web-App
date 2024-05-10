<%@page import="java.util.List, java.util.ArrayList, java.util.Map, java.util.HashMap, java.lang.String, entity.Orders, entity.Product, entity.Productorder"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Sales Report</title>
        <link rel="shortcut icon" type="image/x-icon" href="/OnlyD/layout/favicon_onlyD.ico">
    </head>
    <body>
        <%
            List<Orders> foundOrderList = (List<Orders>)session.getAttribute("foundOrderList");
            String requestDay = (String)session.getAttribute("day");
            String requestMonth = (String)session.getAttribute("month");
            String requestYear = (String)session.getAttribute("year");
            
            int orderCount = 0;
            double totalDiscount = 0;
            double totalSales = 0;
        %>

        <%@include file="/layout/header.jsp"%>
        <div class="container mt-5 " style="margin-bottom: 330px">


            <% if(foundOrderList != null && !foundOrderList.isEmpty()) { %>

            <% for(Orders o : foundOrderList) { 
                orderCount++;
                totalDiscount += o.getTotaldiscount();
                totalSales += o.getTotal();
                } %>
            <div class="card" style="border:none">

                <div class="card-head" style="background-color: #FFBE00">
                    <% if(requestDay != null) { %>    
                    <h1 style="margin-left: 20px"> <%=requestDay%> Sales Report</h1>
                    <% } %>
                    <% if(requestMonth != null) { %>    
                    <h1 style="margin-left: 20px"><%=requestMonth%> Sales Report</h1>
                    <% } %>
                    <% if(requestYear != null) { %>    
                    <h1 style="margin-left: 20px"><%=requestYear%> Sales Report</h1>
                    <% } %>
                </div>
                <table class="table table-striped tableDeco">
                    <tr>
                        <td>Number of Sales:</td>
                        <td><%=orderCount%></td>
                    </tr>
                    <% 
                HashMap<Product,Integer> productSoldMap = (HashMap<Product,Integer>)session.getAttribute("productSoldMap");
                List<Product> prodSoldList = (List<Product>)session.getAttribute("prodSoldList");
                    %>
                    <tr><td>
                            <div style="width:100%; max-height:600px; overflow:auto;">
                                <table class="table table-striped tableDeco">
                                    <tr>
                                        <th>Product Sold</th>
                                        <th>Name</th>
                                        <th>Quantity</th>
                                    </tr>
                                    <% for(Product p : prodSoldList) { %>
                                    <tr>
                                        <td><img style="height: 120px; width: 120px; margin: auto" src="<%=request.getContextPath() + "/image/" + p.getImage() %>"></td>
                                        <td><%= p.getName() %></td>
                                        <td><%= productSoldMap.get(p) %></td>
                                    </tr>
                                    <% } %>
                                </table>
                            </div>
                        </td></tr>
                    <tr>
                        <td>Total Discount:</td>
                        <td>RM <%=String.format("%.2f", totalDiscount)%></td>
                    </tr>
                    <tr>
                        <td>Total Sales:</td>
                        <td>RM <%=String.format("%.2f", totalSales)%></td>
                    </tr>
                </table>
                <div class="col-12" style="margin-bottom: 20px;">
                    <a class="btn yellow_black me-2" href="../staff/staffDashboard.jsp">Dashboard</a>
                </div>

                <% } else {%>
                no result!
                <% } %>
            </div>
        </div>
        <%@include file="/layout/footer.jsp"%>
         </body>
</html>