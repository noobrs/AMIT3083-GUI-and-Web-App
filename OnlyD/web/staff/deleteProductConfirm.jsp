<%@include file="staffAuthentication.jsp"%>
<h3>
<%
  boolean success = (Boolean)session.getAttribute("successDltProduct");
  if (success)
      out.println("Product deleted successfully.");
  else
      out.println("Error: Unable to delete Product.");
%>
</h3>
<p><a href="../index.html">Back to home page</a></p>