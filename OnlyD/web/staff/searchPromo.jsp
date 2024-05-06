<%@include file="staffAuthentication.jsp"%>
<%-- retrieve selected item code --%>
<%
   String id = request.getParameter("promoId");
%>

<%-- retrieve button that was clicked --%>
<%
  String button = request.getParameter("promoButton");
%>

<%-- redorect to SearchItem servlet --%>
<%
  session.setAttribute("promoId", id);
  session.setAttribute("promoButton", button);
  response.sendRedirect("../SearchPromotion");
%>
