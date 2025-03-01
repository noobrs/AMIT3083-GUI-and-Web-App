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
public class UpdateStaff extends HttpServlet {

    @PersistenceContext
    EntityManager em;
    @Resource
    UserTransaction utx;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        String staffName = "";
        String staffEmail = "";
        String staffPassword = "";
        String reStaffPassword = "";
        Staff tempStaff;
        
        try {
            staffName = request.getParameter("staffName");
            staffEmail = request.getParameter("staffEmail");
            staffPassword = request.getParameter("staffPassword");
            reStaffPassword = request.getParameter("reStaffPassword");

            StaffService staffService = new StaffService(em);

            Staff staff = (Staff) session.getAttribute("staffFound");

            // email validation
            tempStaff = staffService.findStaffByEmail(staffEmail);
            if (staffService.findStaffByEmail(staffEmail) != null && (tempStaff.getStaffid() != staff.getStaffid())) {
                throw new NullPointerException("Email existed!");
            } else if (!staffEmail.matches(Staff.EMAIL_REGEX)) {
                throw new NullPointerException("Invalid Email Format!");
            }

            if (!staffPassword.equals(reStaffPassword)) {
                throw new NullPointerException("Passwords not match!");
            } else if (staffPassword.length() < 8 || !staffPassword.matches(Staff.PASSWORD_REGEX)) {
                throw new NullPointerException("Invalid Password Format!");
            }

            staff.setName(staffName);
            staff.setEmail(staffEmail);
            staff.setPassword(staffPassword);

            utx.begin();
            boolean success = staffService.updateStaff(staff);
            utx.commit();

            session.setAttribute("statusMsg", "Update Staff Successfully!");
            session.removeAttribute("errorMessage");
            session.removeAttribute("staffFound");
            session.removeAttribute("enteredStaffName");
            session.removeAttribute("enteredStaffEmail");
            response.sendRedirect("staff/staffDashboard.jsp");

        } catch (NullPointerException e) {
            session.setAttribute("errorMessage", e.getMessage());
            session.setAttribute("enteredStaffName", staffName);
            session.setAttribute("enteredStaffEmail", staffEmail);
            response.sendRedirect("admin/updateStaff.jsp");

        } catch (Exception e) {
        }
    }
}
