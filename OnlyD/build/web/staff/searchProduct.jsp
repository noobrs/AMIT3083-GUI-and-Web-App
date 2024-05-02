<%-- retrieve selected item code --%>
<%
   String id = request.getParameter("productId");
%>

<%-- retrieve button that was clicked --%>
<%
  String button = request.getParameter("productButton");
%>

<%-- redorect to SearchItem servlet --%>
<%
  session.setAttribute("productId", id);
  session.setAttribute("productButton", button);
  response.sendRedirect("../SearchProduct");
%>
