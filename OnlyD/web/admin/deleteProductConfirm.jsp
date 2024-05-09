<%@include file="/layout/header.jsp"%>
<h3>
    <%
      boolean success = (Boolean)session.getAttribute("successDltProduct");
      if (success)
          out.println("Product deleted successfully.");
      else
          out.println("Error: Unable to delete Product.");
    %>
</h3>
<p><a href="<%=request.getContextPath() + "/" + application.getInitParameter("indexServlet")%>">Back to home page</a></p>

<%@include file="/layout/footer.jsp"%>