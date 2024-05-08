<%@include file="staffAuthentication.jsp"%>
<%@page import="java.util.List"%>
<%@page  import="entity.Product" %>
<%
  List<Product> productList = (List)session.getAttribute("productList");
%>

<%@include file="/layout/header.jsp"%>

<h1>Search Product </h1>
<table border="0" cellspacing="10">
    <form action="searchProduct.jsp" method="post">
        <tr>
            <td>Product ID</td>
            <td><select name="productId">
                    <% for (Product product: productList){%>
                    <option value="<%=product.getProductid()%>">
                        <%=product.getProductid()%>
                        <%}%>
                </select>
                <br>
            </td>
        </tr>
        <tr>
            <td colspan="2">

                <!<!-- only admin can delete product -->
                <% if(request.isUserInRole("AdminRole")){ %>
                <input type="submit" value="Delete" name="productButton"/>
                <% } %>
                <input type="submit" value="Update" name="productButton"/>
            </td>
        </tr>
    </form>
</table>

<%@include file="/layout/footer.jsp"%>
