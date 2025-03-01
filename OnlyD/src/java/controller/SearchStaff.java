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
public class SearchStaff extends HttpServlet {

    @PersistenceContext
    EntityManager em;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
            StaffService staffService = new StaffService(em);
            HttpSession session = request.getSession();
            String staffID = (String)session.getAttribute("staffID");    
            String button = (String)session.getAttribute("button");
            
            Staff staff = staffService.findStaffByStaffId(staffID);
            
            session.setAttribute("staffFound", staff);
            if(button.equals("Delete Staff")){
                response.sendRedirect("admin/deleteStaff.jsp");
            }else if(button.equals("Update Staff")){
                response.sendRedirect("admin/updateStaff.jsp");
            }
            
        } catch (Exception e) {
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
