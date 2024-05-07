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
        <title>Select Sales Record</title>
    </head>
    <body>      
        <%
            List<String> dailyList = (List<String>)session.getAttribute("dailyList");
            List<String> monthList = (List<String>)session.getAttribute("monthList");
            List<String> yearList = (List<String>)session.getAttribute("yearList");
        %>              

        <%@include file="/layout/header.jsp"%>

        <% if(dailyList != null || !dailyList.isEmpty()) { %>
        <h1>Daily Sales Report</h1>

        <table>
            <tr>
                <th>Date</th>
            </tr>
            <% for(String day : dailyList) { %>
            <tr>
                <td><a href="../ViewSalesReport?day=<%=day%>"><%= day %></a></td>
            </tr>
            <% } %>
        </table>
        <% } else { %>
        no record found!
        <% } %>

        <% if(monthList != null || !monthList.isEmpty()) { %>
        <h1>Monthly Sales Report</h1>

        <table>
            <tr>
                <th>Date</th>
            </tr>
            <% for(String month : monthList) { %>
            <tr>
                <td><a href="../ViewSalesReport?month=<%=month%>"><%= month %></a></td>
            </tr>
            <% } %>
        </table>
        <% } else { %>
        no record found!
        <% } %>

        <% if(yearList != null || !yearList.isEmpty()) { %>
        <h1>Yearly Sales Report</h1>

        <table>
            <tr>
                <th>Date</th>
            </tr>
            <% for(String year : yearList) { %>
            <tr>
                <td><a href="../ViewSalesReport?year=<%=year%>"><%= year %></a></td>
            </tr>
            <% } %>
        </table>
        <% } else { %>
        no record found!
        <% } %>

        <%@include file="/layout/footer.jsp"%>
    </body>
</html>
