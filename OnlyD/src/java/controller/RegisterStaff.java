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
        processRequest(request, response);
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

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }
}
