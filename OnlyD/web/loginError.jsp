<%
    session.setAttribute("errorMessage", "Login Error! Try again!");
    request.getRequestDispatcher("admin/adminLogin.jsp").forward(request, response);
%>
