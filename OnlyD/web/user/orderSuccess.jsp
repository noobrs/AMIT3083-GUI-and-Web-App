<%-- 
    Document   : orderHistoryDetails
    Created on : 6 May 2024, 9:31:50 PM
    Author     : Vin Sen
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="custAuthentication.jsp"%>
<%@page import="java.util.List, entity.Customer, entity.Orders, entity.Productorder, entity.Product, java.text.SimpleDateFormat" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Order Details</title>
    </head>
    <body>
        <%
            Customer cust = (Customer)session.getAttribute("customer");
            Orders selectedOrder = (Orders)session.getAttribute("orderSuccess");
            List<Productorder> productorderList = selectedOrder.getProductorderList();
            SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        %>

        <%@include file="/layout/header.jsp"%>
        <div class="container mt-5" style="display: flex; justify-content: center">

            <div style="display: flex; justify-content: center;">
                <h2>Order was successfully made!</h2>
            </div>


            <div class="card card_deco">
                <div class="card-head ">
                    <h1>Order Details</h1>
                </div>

                <div class="card-body">

                    <% if(!productorderList.isEmpty()) { %>
                    <div class=" mb-2">
                        <h4 style="text-align: left">Shipping Details:</h4>
                        <div class="input-group mb-1">
                            <span class="input-group-text yellow_black">Order ID : </span>
                            <input class="form-control" type="text" name="price"
                                   value="<%= selectedOrder.getOrderid()%>" readonly>
                        </div>

                        <div class="input-group mb-1">
                            <span class="input-group-text yellow_black">Order Date : </span>
                            <input class="form-control" type="text" name="price"
                                   value="<%= dateFormat.format(selectedOrder.getOrderdatetime())%>" readonly>
                        </div>

                        <div class="input-group mb-1">
                            <span class="input-group-text yellow_black">Shipping address : </span>
                            <textarea class="form-control" type="text" name="price" aria-label="With textarea"
                                      readonly><%= selectedOrder.getShippingaddress()%></textarea>
                                      </div>
                    </div>
                    <div class=" mb-2"> 
                        <h4 style="text-align: left">Product Details: </h4>
                        <table class="table table-striped tableDeco">
                            <tr style="background-color: #FFBE00">
                                <th>Product</th>
                                <th>Name</th>
                                <th>Quantity</th>
                            </tr>
                            <% for(Productorder po : productorderList) { %>
                            <tr>
                                <td><img style="height: 120px; width: 120px; margin-right: auto" src="<%=request.getContextPath() + "/image/" + po.getProduct().getImage() %>"></td>
                                <td><%= po.getProduct().getName() %></td>
                                <td><%= po.getQuantity() %></td>
                            </tr>
                            <% } %>       
                        </table>    
                    </div>
                    <div class=" mb-2">
                        <h4 style="text-align: left">Payment Details: </h4>
                        <div class="input-group mb-1">
                            <span class="input-group-text yellow_black">Payment Type :</span>
                            <input class="form-control" type="text" name="price"
                                   value="<%= selectedOrder.getPaymenttype()%>" readonly>
                        </div>

                        <div class="input-group mb-1">
                            <span class="input-group-text yellow_black">Subtotal :</span> 
                            <input class="form-control" type="text" name="price"
                                   value="<%= selectedOrder.getSubtotal()%>" readonly>
                        </div>


                        <div class="input-group mb-1">
                            <span class="input-group-text yellow_black">Discount :</span>
                            <input class="form-control" type="text" name="price"
                                   value="<%= selectedOrder.getTotaldiscount()%>" readonly>
                        </div>


                        <div class="input-group mb-1">
                            <span class="input-group-text yellow_black">Shipping fee :</span> 
                            <input class="form-control" type="text" name="price"
                                   value="<%= selectedOrder.getShippingfee()%>" readonly>
                        </div>


                        <div class="input-group mb-1">
                            <span class="input-group-text yellow_black">Total :</span>
                            <input class="form-control" type="text" name="price"
                                   value="<%= selectedOrder.getTotal()%>" readonly>
                        </div>
                        <% } else { %>
                        No order!
                        <% } %>
                    </div>
                </div>
            </div>
        </div>
        <%@include file="/layout/footer.jsp"%>
    </body>
</html>