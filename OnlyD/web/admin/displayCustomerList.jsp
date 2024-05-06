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
    </head>
    <body>
        <%@include file="/layout/header.jsp"%>
        
        <h1>Search Customer</h1>
        <table border="0" cellspacing="10">
            <form action="searchCustomer.jsp" method="POST">
                <tr>
                    <td>Customer Username</td>
                    <td>
                        <select name="username">
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
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <input type="submit" value="Delete Customer" name="button"/>
                        <input type="submit" value="Update Customer" name="button"/>
                    </td>
                </tr>
            </form>
        </table>
        
        <%@include file="/layout/footer.jsp"%>
    </body>
</html>
