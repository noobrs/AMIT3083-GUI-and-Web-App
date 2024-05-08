<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="entity.Product"%>
<%@page import="entity.Category"%>

<%
    Product p = (Product) session.getAttribute("TempProductDetail");
%>

<html>
    <body>
        <%@include file="/layout/header.jsp"%>

        <table border="1">
            <tr>
                <th>Product ID</th>
                <th>Product Name</th>
                <th>Image</th>
                <th>Description</th>
                <th>Price (RM)</th>
                <th>Promo Price</th>
            </tr>
            <tr>
                <td><%= p.getProductid() %></td>  
                <td><%= p.getName() %></td>
                <td><img src="<%= request.getContextPath() + "/image/" + p.getImage()%>"></td>
                <td><%= p.getDescription() %> </td>
                <td><%= String.format("%.2f", p.getPrice()) %></td>
                <td><%= p.getCategoryid().getCategoryname() %></td>
            </tr>
        </table>

        <a href="<%=request.getContextPath()%>/">Back</a>

        <%@include file="/layout/footer.jsp"%>
    </body>
</html>