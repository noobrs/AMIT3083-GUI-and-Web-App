<%@page import="java.util.List, entity.Orders, java.lang.String"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Sales Report</title>
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
        
        <% if(foundOrderList != null && !foundOrderList.isEmpty()) { %>
               
        <% for(Orders o : foundOrderList) { 
            orderCount++;
            totalDiscount += o.getTotaldiscount();
            totalSales += o.getTotal();
            } %>
            
        <% if(requestDay != null) { %>    
        <h1><%=requestDay%> Sales Report</h1>
        <% } %>
        <% if(requestMonth != null) { %>    
        <h1><%=requestMonth%> Sales Report</h1>
        <% } %>
        <% if(requestYear != null) { %>    
        <h1><%=requestYear%> Sales Report</h1>
        <% } %>
        <table>
            <tr>
                <td>Number of Sales:</td>
                <td><%=orderCount%></td>
            </tr>
            <tr>
                <td>Total Discount:</td>
                <td>RM <%=String.format("%.2f", totalDiscount)%></td>
            </tr>
            <tr>
                <td>Total Sales:</td>
                <td>RM <%=String.format("%.2f", totalSales)%></td>
            </tr>
        </table>
        
        <% } else {%>
        no result!
        <% } %>
        
        <%@include file="/layout/footer.jsp"%>
    </body>
</html>
