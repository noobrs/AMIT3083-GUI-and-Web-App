<%@include file="staffAuthentication.jsp"%>

<%@include file="/layout/header.jsp"%>
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

<%@include file="/layout/footer.jsp"%>
