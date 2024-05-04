<%@include file="staffAuthentication.jsp"%>
<h3>
<%
  boolean success = (Boolean)session.getAttribute("successAddCategory");
  if (success)
      out.println("Category added successfully.");
  else
      out.println("Error: Unable to add new category.");
%>
</h3>
<p><a href="../index.html">Back to home page</a></p>
