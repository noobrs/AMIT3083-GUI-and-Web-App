<%@include file="/layout/header.jsp"%>
<h3>
    <%
      boolean success = (Boolean)session.getAttribute("successDltCategory");
      if (success)
          out.println("Category deleted successfully.");
      else
          out.println("Error: Unable to delete Category.");
    %>
</h3>
<p><a href="<%=request.getContextPath() + "/" + application.getInitParameter("indexServlet")%>">Back to home page</a></p>

<%@include file="/layout/footer.jsp"%>