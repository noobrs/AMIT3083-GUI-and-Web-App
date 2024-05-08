<%-- 
    Document   : displayCustomerList
    Created on : 29 Apr 2024, 9:40:01 PM
    Author     : Vin Sen
--%>
<%@page import="java.util.List, entity.Customer"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    List<Customer> custList = (List)session.getAttribute("custList");
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Customer List</title>
        <%@include file="/layout/meta.html"%>

    </head>
    <body>
        <%@include file="/layout/header.jsp"%>

        <div class="container dashBoard mt-5 ">
            <div class="card" style="width: 50%; border: 2px #FFBE00 solid; background-color: #25182E; text-align: center">
                <div class="card-head yellow_black">
                    <h1>Search Customer</h1>
                </div>
                <div class="card-body" style="color: #FFBE00">
                    <!--<table border="0" cellspacing="10">-->
                    <form action="searchCustomer.jsp" method="POST">
                        <!--<tr>-->
                        <div>
                            <h5>Customer Username</h5>
                        </div>

                        <!--<td>-->
                        <div class="m-2">
                            <select name="username" style="margin-bottom: 100px; width:80%">
                                <%
                                    for(Customer c:custList){
                                %>
                                <option value="<%=c.getUsername()%>">
                                    <%=c.getUsername()%>
                                </option>
                                <%
                                    }
                                %>
                            </select>                                    
                        </div>

                        <!--</td>-->
                        <!--</tr>-->
                        <tr>
                            <td colspan="2">
                                <input class="btn" style="background-color: #CA1F3D; color: #FFFFFF" type="submit" value="Delete Customer" name="button"/>
                                <input class="btn yellow_black" type="submit" value="Update Customer" name="button"/>
                            </td>
                        </tr>
                    </form>
                    <!--</table>-->
                </div>
            </div>
        </div>

        <%@include file="/layout/footer.jsp"%>
    </body>
</html>
