<%@include file="staffAuthentication.jsp"%>

<%@include file="/layout/header.jsp"%>

<h3>
<%
  boolean success = (Boolean)session.getAttribute("successUpdProduct");
  if (success)
      out.println("Product updated successfully.");
  else
      out.println("Error: Unable to update product.");
%>
</h3>
<p><a href="<%=request.getContextPath() + "/" + application.getInitParameter("indexServlet")%>">Back to home page</a></p>

<%@include file="/layout/footer.jsp"%>