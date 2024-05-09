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
public class DeleteStaff extends HttpServlet {

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

        try {
            StaffService staffService = new StaffService(em);
            HttpSession session = request.getSession();
            Staff staff = (Staff) session.getAttribute("staffFound");

            staff.setStatus(Staff.DELETED_STATUS);

            utx.begin();
            boolean success = staffService.updateStaff(staff);
            utx.commit();

            if (success) {
                session.setAttribute("statusMsg", "Staff deleted successfully!");
            } else {
                session.setAttribute("statusMsg", "Unable to delete staff!");
            }

            session.removeAttribute("staffFound");
            response.sendRedirect("staff/staffDashboard.jsp");

        } catch (Exception e) {
        }
    }
}
