<%-- retrieve selected item code --%>
<%
   String id = request.getParameter("id");
%>

<%-- retrieve button that was clicked --%>
<%
  String button = request.getParameter("button");
%>

<%-- redorect to SearchItem servlet --%>
<%
  session.setAttribute("id", id);
  session.setAttribute("button", button);
  response.sendRedirect("../SearchProduct");
%>
