/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import entity.Staff;
import jakarta.annotation.Resource;
import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.transaction.UserTransaction;
import service.StaffService;

/**
 *
 * @author Vin Sen
 */
public class StaffVerification extends HttpServlet {

    @PersistenceContext
    EntityManager em;
    @Resource
    UserTransaction utx;

//    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
//            throws ServletException, IOException {
//
//        String staffName = "";
//        String staffEmail = "";
//        String staffPassword = "";
//        String reStaffPassword = "";
//        String errorMessage = "";
//
//        StaffService staffService = new StaffService(em);
//        HttpSession session = request.getSession();
//
//        try {
//            Staff staff = (Staff) session.getAttribute("staff");
//
//            if (staff == null) {
//                response.sendError(404);
//            }
//
//            staffName = request.getParameter("staffName");
//            staffEmail = request.getParameter("staffEmail");
//            staffPassword = request.getParameter("staffPassword");
//            reStaffPassword = request.getParameter("reStaffPassword");
//
//            if (staffService.findStaffByEmail(staffEmail) != null) {
//                errorMessage += "Email existed!<br>";
//            } else if (!staffEmail.matches(Staff.EMAIL_REGEX)) {
//                errorMessage += "Invalid Email Format!<br>";
//            }
//
//            if (!staffPassword.equals(reStaffPassword)) {
//                errorMessage += "Password do not match. Please enter again!<br>";
//            } else if (staffPassword.length() < 8 || !staffPassword.matches(Staff.PASSWORD_REGEX)) {
//                errorMessage += "Invalid password format! Please make sure password contains at least<br>"
//                        + "1 uppercase<br>"
//                        + "1 lowercase<br>"
//                        + "1 digit<br>"
//                        + "1 special character<br>"
//                        + "8 characters<br>";
//            }
//
//            if (!errorMessage.equals("")) {
//                request.setAttribute("errorMessage", errorMessage);
//                getServletContext().getRequestDispatcher("/staff/firstTimeLogin.jsp");
//            } else {
//                staff.setName(staffName);
//                staff.setEmail(staffEmail);
//                staff.setPassword(staffPassword);
//                staff.setStatus(Staff.ACTIVE_STATUS);
//
//                utx.begin();
//                staffService.updateStaff(staff);
//                utx.commit();
//                session.removeAttribute("staff");
//                session.setAttribute("verificationStatus", "Verify Successfully!");
//                response.sendRedirect("staff/staffLogin.jsp");
//            }
//
//        } catch (NullPointerException e) {
//            errorMessage += e.getMessage();
//            request.setAttribute("errorMessage", errorMessage);
//            getServletContext().getRequestDispatcher("/staff/firstTimeLogin.jsp").forward(request, response);
//        } catch (Exception e) {
//        }
//    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String staffName = "";
        String staffEmail = "";
        String staffPassword = "";
        String reStaffPassword = "";

        StaffService staffService = new StaffService(em);
        HttpSession session = request.getSession();

        try {
            Staff staff = (Staff) session.getAttribute("staff");

            if (staff == null) {
                throw new IllegalArgumentException("Staff not found!");
            }

            staffName = request.getParameter("staffName");
            staffEmail = request.getParameter("staffEmail");
            staffPassword = request.getParameter("staffPassword");
            reStaffPassword = request.getParameter("reStaffPassword");

            if (staffService.findStaffByEmail(staffEmail) != null) {
                throw new IllegalArgumentException("Email existed!");
            } else if (!staffEmail.matches(Staff.EMAIL_REGEX)) {
                throw new IllegalArgumentException("Invalid Email Format!");
            }

            if (!staffPassword.equals(reStaffPassword)) {
                throw new IllegalArgumentException("Paswords not match!");
            } else if (staffPassword.length() < 8 || !staffPassword.matches(Staff.PASSWORD_REGEX)) {
                throw new IllegalArgumentException("Invalid password format!");
            }

            staff.setName(staffName);
            staff.setEmail(staffEmail);
            staff.setPassword(staffPassword);
            staff.setStatus(Staff.ACTIVE_STATUS);

            utx.begin();
            staffService.updateStaff(staff);
            utx.commit();
            session.removeAttribute("staff");
            session.removeAttribute("errorMessage");
            session.removeAttribute("enteredStaffName");
            session.removeAttribute("enteredStaffEmail");
            session.setAttribute("verificationStatus", "Verify Successfully!");
            response.sendRedirect("staff/staffLogin.jsp");

        } catch (IllegalArgumentException e) {
            session.setAttribute("errorMessage", e.getMessage());
            session.setAttribute("enteredStaffName", staffName);
            session.setAttribute("enteredStaffEmail", staffEmail);
            response.sendRedirect("staff/firstTimeLogin.jsp");
        } catch (Exception e) {
        }
    }

}
