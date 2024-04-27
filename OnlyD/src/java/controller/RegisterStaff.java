/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import entity.Staff;
import jakarta.annotation.Resource;
import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;
import jakarta.servlet.RequestDispatcher;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.transaction.UserTransaction;
import java.util.List;
import service.StaffService;

/**
 *
 * @author Vin Sen
 */
public class RegisterStaff extends HttpServlet {

    @PersistenceContext
    EntityManager em;
    @Resource
    UserTransaction utx;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");

        if (action.equals("1")) {
            doPostAdmin(request, response);
        } else if (action.equals("2")) {
            doPostStaff(request, response);
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        StaffService staffService = new StaffService(em);
        int newStaffID;

        try {
            List<Staff> staffList = staffService.findAll();

            if (staffList == null) {
                newStaffID = 1;
            } else if (staffList.isEmpty()) {
                newStaffID = 1;
            } else {
                Staff lastStaff = staffList.get(staffList.size() - 1);
                newStaffID = Integer.parseInt(lastStaff.getStaffID(), 1, 5, 10) + 1;
            }

            session.setAttribute("staffIDValue", String.format("S%04d", newStaffID));
            
            response.sendRedirect("admin/registerStaff.jsp");
        } catch (Exception e) {
            response.getWriter().println(e.getMessage());
        }

    }

    protected void doPostAdmin(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        String staffID = "";
        String staffName = "";

        StaffService staffService = new StaffService(em);
        String errorMessage = "";

        try {
            staffID = request.getParameter("staffID");
            staffName = request.getParameter("staffName");

            // check null
            if (staffID == null || staffName == null) {
                errorMessage += "Null Values";
                request.setAttribute("errorMessage", errorMessage);

                RequestDispatcher rd = getServletContext().getRequestDispatcher("/registerStaff.jsp");
                rd.forward(request, response);
            }

            // validate input
            if (staffService.findStaffByStaffId(staffID) != null) {
                errorMessage += "Staff ID existed. Try again<br>";
            }

            if (!errorMessage.equals("")) {
                request.setAttribute("staffIDValue", staffID);
                request.setAttribute("staffName", staffName);
                request.setAttribute("errorMessage", errorMessage);

                RequestDispatcher rd = getServletContext().getRequestDispatcher("/registerStaff.jsp");
                rd.forward(request, response);
                return;
            }

            Staff staff = new Staff(staffID, staffName, false);
            staff.setPassword(staff.getDefaultPassword());

            utx.begin();
            staffService.addStaff(staff);
            utx.commit();

            session.setAttribute("registeredStaff", staff);
            response.sendRedirect("staffDetails.jsp");

        } catch (Exception e) {
            response.getWriter().println(e.getMessage());
        }
    }

    protected void doPostStaff(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();

        String staffName = "";
        String staffEmail = "";
        String staffPassword = "";
        String reStaffPassword = "";
        String errorMessage = "";

        StaffService staffService = new StaffService(em);

        String emailRegex = "^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\\.[a-zA-Z]{2,}$";
        String passwordRegex = "^(?=.*[A-Z])(?=.*[a-z])(?=.*\\d)(?=.*[\\W_]).+$";

        try {
            Staff staff = (Staff) session.getAttribute("staff");

            if (staff == null) {
                response.sendError(404);
            }

            staffName = request.getParameter("staffName");
            staffEmail = request.getParameter("staffEmail");
            staffPassword = request.getParameter("staffPassword");
            reStaffPassword = request.getParameter("reStaffPassword");

            if (staffService.findStaffByEmail(staffEmail) != null) {
                errorMessage += "Email existed!<br>";
            } else if (!staffEmail.matches(emailRegex)) {
                errorMessage += "Invalid Email Format!<br>";
            }

            if (!staffPassword.equals(reStaffPassword)) {
                errorMessage += "Password do not match. Please enter again!<br>";
            } else if (staffPassword.length() < 8 || !staffPassword.matches(passwordRegex)) {
                errorMessage += "Invalid password format! Please make sure password contains at least<br>"
                        + "1 uppercase<br>"
                        + "1 lowercase<br>"
                        + "1 digit<br>"
                        + "1 special character<br>"
                        + "8 characters<br>";
            }

        } catch (Exception e) {
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }
}
