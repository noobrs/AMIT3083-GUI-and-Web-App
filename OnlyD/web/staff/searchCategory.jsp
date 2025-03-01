<%@include file="staffAuthentication.jsp"%>
<%-- retrieve selected item code --%>
<%
   String id = request.getParameter("categoryId");
%>

<%-- retrieve button that was clicked --%>
<%
  String button = request.getParameter("categoryButton");
%>

<%-- redorect to SearchItem servlet --%>
<%
  session.setAttribute("categoryId", id);
  session.setAttribute("categoryButton", button);
  response.sendRedirect("../SearchCategory");
%>
