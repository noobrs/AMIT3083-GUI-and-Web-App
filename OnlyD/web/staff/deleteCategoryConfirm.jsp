<%@include file="staffAuthentication.jsp"%>
<h3>
<%
  boolean success = (Boolean)session.getAttribute("successDltCategory");
  if (success)
      out.println("Category deleted successfully.");
  else
      out.println("Error: Unable to delete Category.");
%>
</h3>
<p><a href="../index.html">Back to home page</a></p>