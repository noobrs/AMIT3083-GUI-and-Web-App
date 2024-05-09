<%-- 
    Document   : selectSalesRecord
    Created on : 7 May 2024, 1:38:47 PM
    Author     : Vin Sen
--%>
<%@page import="java.util.List,java.lang.String"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Sales Record List</title>
    </head>
    <body>      
        <%
            List<String> dailyList = (List<String>)session.getAttribute("dailyList");
            List<String> monthList = (List<String>)session.getAttribute("monthList");
            List<String> yearList = (List<String>)session.getAttribute("yearList");
        %>              

        <%@include file="/layout/header.jsp"%>
        <div class="container mt-5">
            <div class="row dashBoard">
                <div class="col-12" style="margin-bottom: 20px;">
                    <a class="btn yellow_black me-2" href="../staff/staffDashboard.jsp">Dashboard</a>
                </div>
                <div class="col-4" >
                    <% if(dailyList != null || !dailyList.isEmpty()) { %>

                    <div style="text-align: center; background-color: #25182E; border:2px #FFBE00 solid; color: #FFFFFF; border-radius: 10px">
                        <h1>Daily Sales Report</h1> 
                    </div>
                    <br>
                    <div class="card" style="overflow-y: auto; height: 600px; border: none; ">
                        <table class="table table-striped tableDeco">
                            <tr style="background-color: #FFBE00; text-align: center;">
                                <th>Date</th>
                            </tr>
                            <% for(String day : dailyList) { %>
                            <tr style="text-align: center">
                                <td><a href="../ViewSalesReport?day=<%=day%>"><%= day %></a></td>
                            </tr>
                            <% } %>
                        </table>
                        <% } else { %>
                        no record found!
                        <% } %>
                    </div>
                </div>
                <div class="col-4">
                    <% if(monthList != null || !monthList.isEmpty()) { %>
                    <div style="text-align: center; background-color: #25182E; border:2px #FFBE00 solid; color: #FFFFFF; border-radius: 10px">
                        <h1>Monthly Sales Report</h1>
                    </div>
                    <br>
                    <div class="card" style="overflow-y: auto; height: 600px;border: none; ">
                        <table class="table table-striped tableDeco">
                            <tr style="background-color: #FFBE00; text-align: center;">
                                <th>Date</th>
                            </tr>
                            <% for(String month : monthList) { %>
                            <tr style="text-align: center">
                                <td><a href="../ViewSalesReport?month=<%=month%>"><%= month %></a></td>
                            </tr>
                            <% } %>
                        </table>
                        <% } else { %>
                        no record found!
                        <% } %>
                    </div>
                </div>
                <div class="col-4">
                    <% if(yearList != null || !yearList.isEmpty()) { %>
                    <div style="text-align: center; background-color: #25182E; border:2px #FFBE00 solid; color: #FFFFFF; border-radius: 10px">
                        <h1>Yearly Sales Report</h1>
                    </div>
                    <br>
                    <div class="card" style="overflow-y: auto; height: 600px;border: none; ">
                        <table class="table table-striped tableDeco">
                            <tr style="background-color: #FFBE00; text-align: center;">
                                <th>Date</th>
                            </tr>
                            <% for(String year : yearList) { %>
                            <tr style="text-align: center">
                                <td><a href="../ViewSalesReport?year=<%=year%>"><%= year %></a></td>
                            </tr>
                            <% } %>
                        </table>
                        <% } else { %>
                        no record found!
                        <% } %>
                    </div>
                </div>
            </div>
        </div>


        <%@include file="/layout/footer.jsp"%>
    </body>
</html>