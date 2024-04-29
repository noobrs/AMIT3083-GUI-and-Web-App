<%
    String username = request.getParameter("username");
    
    String button = request.getParameter("button");
    
    session.setAttribute("username", username);
    session.setAttribute("button", button);
    response.sendRedirect("../SearchCustomer");
%>
