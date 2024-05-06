<%@include file="staffAuthentication.jsp"%>
<h3>
<%
  boolean success = (Boolean)session.getAttribute("successAddProduct");
  if (success)
      out.println("Product added successfully.");
  else
      out.println("Error: Unable to add new product.");
%>
</h3>
<p><a href="../index.html">Back to home page</a></p>
