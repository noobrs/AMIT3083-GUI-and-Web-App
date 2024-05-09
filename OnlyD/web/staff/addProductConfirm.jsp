<%@include file="staffAuthentication.jsp"%>
<%@include file="/layout/header.jsp"%>
<h3>
<%
  boolean success = (Boolean)session.getAttribute("successAddProduct");
  if (success)
      out.println("Product added successfully.");
  else
      out.println("Error: Unable to add new product.");
%>
</h3>
<p><a href="<%=request.getContextPath() + "/" + application.getInitParameter("indexServlet")%>">Back to home page</a></p>
<%@include file="/layout/footer.jsp"%>
