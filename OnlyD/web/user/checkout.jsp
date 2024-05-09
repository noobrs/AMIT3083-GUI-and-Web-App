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
    </head>
    <body>
        <%@include file="/layout/header.jsp"%>

        <%
            List<Productcart> selected = (List<Productcart>)session.getAttribute("selectedCartItem");
            double subtotal = 0;
            double totaldiscount = 0;
            double shippingfee = 25;
            double total = 0;
            
            Promotion promoApplied = (Promotion)session.getAttribute("promoApplied");
            String errorMsg = (String)session.getAttribute("checkoutErrorMsg");
            
        %>

        <% if(errorMsg != null) { %>
        <p><%= errorMsg %></p>
        <% 
            session.removeAttribute("checkoutErrorMsg"); } %>

        <%    
            if(selected != null){
        %>

        <h1>CheckOut!</h1>
        <form action="../CheckOrder" method="post">
            <table>
                <tr>
                    <th>Product ID</th>
                    <th>Product Name</th>
                    <th>Price</th>
                    <th>Quantity</th>
                </tr>
                <% 
                    for (Productcart cartItem : selected) {
                        Product product = cartItem.getProduct();
                        if (product != null) {
                %>
                <tr>
                    <td><%= product.getProductid() %></td>
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
            <% } %>

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

            <table>
                <tr>
                    <td>Promotion Code</td>
                    <td>
                        <input type="text" name="promoCodeEntered" 
                               <% if (promoApplied != null) { %>
                               value="<%= promoApplied.getPromotioncode() %>" disabled>
                        <input type="submit" value="Remove" name="orderButton">
                        <% } else { %>
                        >
                        <input type="submit" value="Apply" name="orderButton">
                        <% } %>
                    </td>
                </tr>
                <tr>
                    <td>Subtotal</td>
                    <td>
                        <input type="number" value="<%=String.format("%.2f", subtotal)%>" name="subtotal" readonly>
                    </td>
                </tr>
                <tr>
                    <td>
                        Total Discount (<%=(promoApplied != null)?promoApplied.getDiscountpercentage():"" %>%)
                    </td>
                    <td><input type="number" value="<%=String.format("%.2f", totaldiscount)%>" name="totaldiscount" readonly></td>
                </tr>
                <tr>
                    <td>Shipping Fee</td>
                    <td><input type="number" value="<%=String.format("%.2f", shippingfee)%>" name="shippingfee" readonly></td>
                </tr>
                <tr>
                    <td>Total</td>
                    <td><input type="number" value="<%=String.format("%.2f", total)%>" name="total" readonly></td>
                </tr>
            </table>
            <br/><input type="submit" value="Proceed to Payment"  name="orderButton">
        </form>

        <%@include file="/layout/footer.jsp"%>
    </body>
</html>