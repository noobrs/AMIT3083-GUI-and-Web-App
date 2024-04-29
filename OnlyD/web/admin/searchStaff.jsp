<%
    String staffID = request.getParameter("staffID");
    
    String button = request.getParameter("button");
    
    session.setAttribute("staffID", staffID);
    session.setAttribute("button", button);
    response.sendRedirect("../SearchStaff");
%>
