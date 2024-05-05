<%@page import="java.util.List"%>
<%@page import="entity.Product"%>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Product List</title>
    </head>
    <body>

        <%@include file="/layout/header.jsp"%>
        <%
          List<Product> productList = (List)session.getAttribute("productListToPromo");
          if(productList != null){
        %>
        <form action="../ProcessProductToPromo" method="post" onsubmit="return validateForm()">
            <table border="1">
                <tr>
                    <th>Product ID</th>
                    <th>Product Name</th>
                    <th>Description</th>
                    <th>Price (RM)</th>
                </tr>
                <% 
                    int[] productArr = new int[productList.size()];
                    for(int i = 0; i < productList.size(); i++){
                    Product product = productList.get(i);
                %>
                <tr>

                    <td><%= product.getProductid() %></td>
                    <td><%= product.getName() %></td>
                    <td><%= product.getDescription() %> </td>
                    <td><%= String.format("%.2f", product.getPrice()) %></td>
                    <td>
                        <input type="checkbox" name="<%= "productArr["+i+"]" %>">
                    </td>
                    <td>

                    </td>
                </tr>
                <% } %>
                <tr>
                    <td>Enter Discount percentage:</td>
                    <td>
                        <input type="number" min="0.01" step="0.01" name="discountPercentage" value="${AddPromotion.discountPercentage}" size="50">
                    </td>
                </tr>
                <tr>
                    <td>Enter Starting Date of Promotion:</td>
                    <td>
                        <input type="date" id="promoStartDate" name="promoStartDate" value="${AddPromotion.startDateTime}" size="50">
                    </td>
                </tr>
                <tr>
                    <td>Enter End Date of the Promotion</td>
                    <td>
                        <input type="date" id="promoEndDate" name="promoEndDate" value="${AddPromotion.endDateTime}" size="50">
                    </td>
                               </tr>
            </table>
            <input type="submit" name="submit" value="Confirm" name="Confirm">
            <input type="reset" name="reset" value="Reset"><br/><br/>
        </form>
        <%
            } else{
        %>
        No product found!
        <% } %>
        <br><br>
        <p><a href="<%=request.getContextPath()%>/">Back to home page</a></p>
        <%@include file="/layout/footer.jsp"%>
    </body>

    <script>
        function validateForm() {
            // Checkbox validation
            var checkboxes = document.querySelectorAll('input[type=checkbox]:checked');
            if (checkboxes.length === 0) {
                alert("Please check at least one checkbox.");
                return false;
            }

            // Start and end date validation
            var startDate = document.getElementById('promoStartDate').value;
            var endDate = document.getElementById('promoEndDate').value;

            if (startDate === "" || endDate === "") {
                alert("Please enter both start date and end date.");
                return false;
            }

            if (startDate > endDate) {
                alert("End date must be after the start date.");
                return false;
            }

            return true;
        }
    </script>
</html>