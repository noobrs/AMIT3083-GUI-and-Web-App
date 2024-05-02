<h3>
<%
  boolean success = (Boolean)session.getAttribute("successUpdProduct");
  if (success)
      out.println("Product updated successfully.");
  else
      out.println("Error: Unable to update product.");
%>
</h3>
<p><a href="../index.html">Back to home page</a></p>