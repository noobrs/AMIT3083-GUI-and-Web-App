<%-- 
    Document   : topSoldReport
    Created on : 7 May 2024, 1:43:55 AM
    Author     : Vin Sen
--%>
<%@page import="java.util.List"%>
<%@page import="entity.Product"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            List<Product> topSoldList = (List<Product>)session.getAttribute("topSoldList");
            
            if(topSoldList != null || !topSoldList.isEmpty()){
        %>
        
        <table>
            <tr>
                <th>Product Name</th>
            </tr>
            <% for(Product p:topSoldList) { %>
            <tr>
                <td><%=p.getName()%></td>
            </tr>
            <% } %>
        </table>
        
        <% } %>
    </body>
</html>
