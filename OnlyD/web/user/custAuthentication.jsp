<%
        Boolean isStaff = (Boolean) session.getAttribute("isStaff");
        Boolean isCustomer = (Boolean) session.getAttribute("isCustomer");
        boolean isAdmin = request.isUserInRole("AdminRole");

        // guest
        if (!isAdmin && isStaff == null && isCustomer == null) {
            request.getRequestDispatcher("/login.jsp").forward(request, response);
        }
%>
