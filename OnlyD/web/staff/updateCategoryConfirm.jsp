<%@include file="staffAuthentication.jsp"%>
<h3>
<%
  boolean success = (Boolean)session.getAttribute("successUpdCategory");
  if (success)
      out.println("Category updated successfully.");
  else
      out.println("Error: Unable to update category.");
%>
</h3>
<p><a href="../index.html">Back to home page</a></p>