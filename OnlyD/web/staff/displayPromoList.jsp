<%@include file="staffAuthentication.jsp"%>
<%@page import="java.util.List"%>
<%@page  import="entity.Promotion" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Promotion List</title>
    </head>
    <body>

        <%
            List<Promotion> promoList = (List)session.getAttribute("promoList");
        %>

        <%@include file="/layout/header.jsp"%>
        <h1>Search Promotion</h1>
        <% if(promoList != null) { %> 
        <table border="0" cellspacing="10">
            <form action="searchPromo.jsp" method="post">
                <tr>
                    <td>Promotion List</td>
                    <td><select name="promoId">
                            <% for (Promotion p : promoList){%>
                            <option value="<%=p.getPromotionid()%>">
                                <%=p.getPromotionid()%>, <%=p.getPromotioncode()%>
                                <%}%>
                        </select>
                        <br>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">

                        <!<!-- only admin can delete product -->
                        <% if(request.isUserInRole("AdminRole")){ %>
                        
                        <% } %>
                        <input type="submit" value="Delete Promotion" name="promoButton"/>
                        <input type="submit" value="Update Promotion" name="promoButton"/>
                    </td>
                </tr>
            </form>
        </table>
        <% } %>
        <%@include file="/layout/footer.jsp"%>
    </body>
</html>
