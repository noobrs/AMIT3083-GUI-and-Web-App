<%@include file="staffAuthentication.jsp"%>

<%@include file="/layout/header.jsp"%>
<div class="container mt-5">
    <div class="dashBoard">
        <div class="card card_deco"  style="border: 2px #FFBE00 solid;">
            <h3>
                <%
                  boolean success = (Boolean)session.getAttribute("successAddCategory");
                  if (success)
                      out.println("Category added successfully.");
                  else
                      out.println("Error: Unable to add new category.");
                %>
            </h3>
            <p><a href="<%= request.getContextPath() %>">Back to home page</a></p>
        </div>
    </div>
</div>


<%@include file="/layout/footer.jsp"%>
