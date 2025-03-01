<%-- 
    Document   : checkout
    Created on : May 5, 2024, 3:33:01 PM
    Author     : Asus
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="custAuthentication.jsp"%>
<%@page import="java.util.List, entity.Productcart, entity.Product, entity.Promotion" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Checkout</title>
        <link rel="shortcut icon" type="image/x-icon" href="/OnlyD/layout/favicon_onlyD.ico">
    </head>
    <body>
        <%@include file="/layout/header.jsp"%>
        <div class="container mt-5 card_deco" >


            <%
                List<Productcart> selected = (List<Productcart>)session.getAttribute("selectedCartItem");
                double subtotal = 0;
                double totaldiscount = 0;
                double shippingfee = 25;
                double total = 0;
            
                Promotion promoApplied = (Promotion)session.getAttribute("promoApplied");
                String errorMsg = (String)session.getAttribute("checkoutErrorMsg");
            
            %>

            <%    
                if(selected != null){
            %>

            <h1 style="color: #FFBE00">CheckOut!</h1>

            <form action="../CheckOrder" method="post">
                <table class="table table-striped tableDeco">
                    <tr style="background-color: #FFBE00">
                        <th>Product</th>
                        <th>Name</th>
                        <th>Price</th>
                        <th>Quantity</th>
                    </tr>
                    <% 
                        for (Productcart cartItem : selected) {
                            Product product = cartItem.getProduct();
                            if (product != null) {
                    %>
                    <tr>
                        <td><img style="max-height: 120px; max-width: 120px; margin: auto" src="<%=request.getContextPath() + "/image/" + product.getImage() %>"></td>
                        <td><%= product.getName() %></td>
                        <td><%= String.format("%.2f", product.getPrice()) %></td>
                        <td><%= cartItem.getQuantity() %></td>
                    </tr>
                    <%
                         subtotal += product.getPrice() * cartItem.getQuantity();                  
                        }
    }
                    %>                
                </table>
                <% } else { 
                    session.setAttribute("errorMessage", "No Selected Product!");
                    response.sendRedirect("../ViewCart");
                    return;
                   } %>

                <% 
                    if(promoApplied != null){
                        totaldiscount = subtotal * promoApplied.getDiscountpercentage()/100;
                        subtotal -= totaldiscount;
                    }

                    if(subtotal >= 200){
                        shippingfee = 0;
                    }

                    total = subtotal + shippingfee;
                %>
                <div style="display: flex; justify-content: center">
                    <div class="card" style="width: 50%; text-align: center; border: none;">
                        <div>
                            <div class="card-body">
                                <% if(errorMsg != null) { %>
                                <h4 style="text-align: center"><%= errorMsg %></h4>
                                <% 
                                    session.removeAttribute("checkoutErrorMsg"); } %>

                                <div class="input-group mb-3">
                                    <span class="input-group-text yellow_black">Promotion Code</span>
                                    <input class="form-control" type="text" name="promoCodeEntered" 
                                           <% if (promoApplied != null) { %>
                                           value="<%= promoApplied.getPromotioncode() %>" disabled>
                                    <input type="submit" class="btn reset_dlt_btn" value="Remove" name="orderButton">
                                    <% } else { %>
                                    >
                                    <input class="btn" style="background-color: #25182E; color: #FFFFFF; border-bottom-right-radius: 10px; border-top-right-radius: 10px;" type="submit" value="Apply" name="orderButton">
                                    <% } %>
                                </div>

                                <div class="input-group mb-3">
                                    <span class="input-group-text yellow_black">Subtotal</span>
                                    <input class="form-control" type="number" value="<%=String.format("%.2f", subtotal)%>" name="subtotal" readonly>
                                </div>

                                <div class="input-group mb-3">
                                    <span class="input-group-text yellow_black">
                                        Total Discount (<%=(promoApplied != null)?promoApplied.getDiscountpercentage():"" %>%)
                                    </span>
                                    <input class="form-control"  type="number" value="<%=String.format("%.2f", totaldiscount)%>" name="totaldiscount" readonly>
                                </div>

                                <div class="input-group mb-3">
                                    <span class="input-group-text yellow_black">Shipping Fee</span>
                                    <input class="form-control" type="number" value="<%=String.format("%.2f", shippingfee)%>" name="shippingfee" readonly>
                                </div>

                                <div class="input-group mb-3">
                                    <span class="input-group-text yellow_black">Total</span>
                                    <input class="form-control" type="number" value="<%=String.format("%.2f", total)%>" name="total" readonly>
                                </div>

                                <br>
                                <a href="../ViewCart" class="btn yellow_black">Back</a>
                                <input class="btn yellow_black" type="submit" value="Proceed to Payment"  name="orderButton">

                            </div>
                        </div>
                        </form>
                    </div>
                </div>
        </div>
        <%@include file="/layout/footer.jsp"%>
    </body>
</html>