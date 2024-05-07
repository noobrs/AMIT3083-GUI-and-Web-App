/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import entity.Staff;
import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import service.StaffService;

/**
 *
 * @author Vin Sen
 */
public class StaffLogin extends HttpServlet {

    @PersistenceContext
    EntityManager em;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        String staffID = "";
        String password;
        StaffService staffService = new StaffService(em);
        Staff staff;

        try {
            staffID = request.getParameter("staffID");
            password = request.getParameter("staffPassword");
            staff = staffService.findStaffByStaffId(staffID);

            // unable to find the staff
            if (staff == null || (!staff.getPassword().equals(password) && staff.getStatus() != Staff.VERIFICATION_STATUS)) {
                throw new IllegalArgumentException("Login fail! Incorrect username or password!");
                                
            } else if (staff.getStatus() == Staff.VERIFICATION_STATUS) {
                
                session.setAttribute("staff", staff);
                session.setAttribute("isStaff", true);
                response.sendRedirect("staff/firstTimeLogin.jsp");
                
            } else {
                
                session.setAttribute("staff", staff);
                session.setAttribute("isStaff", true);
                response.sendRedirect("staff/staffDashboard.jsp");
            }

        } catch (IllegalArgumentException e) {
            session.setAttribute("errorMessage", e.getMessage());
            session.setAttribute("enteredStaffID", staffID);
            response.sendRedirect("staff/staffLogin.jsp");           
        } catch (Exception e) {
            session.setAttribute("exceptionMsg", e.getMessage());
            response.sendError(500);
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

}
