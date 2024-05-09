<%
        Boolean isStaff = (Boolean) session.getAttribute("isStaff");
        Boolean isCustomer = (Boolean) session.getAttribute("isCustomer");
        boolean isAdmin = request.isUserInRole("AdminRole");

        // guest
        if (!isAdmin && isStaff == null && isCustomer == null) {
            //request.getRequestDispatcher("/staff/staffLogin.jsp").forward(request, response);
            response.sendRedirect("staffLogin.jsp");
        } else if (isCustomer != null) {
            //request.getRequestDispatcher("/unauthorizedError.jsp").forward(request, response);
            response.sendRedirect("../unauthorizedError.jsp");
        }
%>
