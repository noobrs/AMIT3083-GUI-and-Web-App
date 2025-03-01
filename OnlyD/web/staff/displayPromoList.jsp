<%@include file="staffAuthentication.jsp"%>
<%@page import="java.util.List"%>
<%@page  import="entity.Promotion" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Promotion List</title>
        <link rel="shortcut icon" type="image/x-icon" href="/OnlyD/layout/favicon_onlyD.ico">
    </head>
    <body>

        <%
            List<Promotion> promoList = (List)session.getAttribute("promoList");
        %>

        <%@include file="/layout/header.jsp"%>
        <div class="container mt-5">
            <div class="dashBoard">
                <div class="card card_deco"  style="border: 2px #FFBE00 solid;">
                    <div class="card-head yellow_black">
                        <h1>Search Promotion</h1>
                    </div>
                    <div class="card-body">
                        <% if(promoList != null) { %> 
                        <form action="searchPromo.jsp" method="post">
                            <div class="input-group mb-3">
                                <span class="input-group-text yellow_black">
                                    Promotion List</span>
                                <select class="form-select" name="promoId">
                                    <% for (Promotion p : promoList){%>
                                    <option value="<%=p.getPromotionid()%>">
                                        <%=p.getPromotionid()%>, <%=p.getPromotioncode()%>
                                        <%}%>
                                </select>
                            </div>

                            <!<!-- only admin can delete product -->
                            <% if(request.isUserInRole("AdminRole")){ %>

                            <% } %>
                            <div>
                                <a class="btn yellow_black me-2" href="../staff/staffDashboard.jsp">Dashboard</a>
                                <input class="btn yellow_black me-2"  type="submit" value="Update Promotion" name="promoButton"/>
                                <input class="btn reset_dlt_btn"  type="submit" value="Delete Promotion" name="promoButton"/>
                            </div>


                        </form>
                        <% } %>
                    </div>
                </div>
            </div>
        </div>
        <%@include file="/layout/footer.jsp"%>
    </body>
</html>
