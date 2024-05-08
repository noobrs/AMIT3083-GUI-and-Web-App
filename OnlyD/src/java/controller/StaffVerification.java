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
            } 

            if (!staffPassword.equals(reStaffPassword)) {
                throw new IllegalArgumentException("Paswords not match!");
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
