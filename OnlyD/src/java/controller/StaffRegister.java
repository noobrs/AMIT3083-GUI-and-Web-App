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
@WebServlet("/staffRegister")
public class StaffRegister extends HttpServlet {

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
        HttpSession session = request.getSession();
        StaffService staffService = new StaffService(em);
        int newStaffID = 0;

        try {
            List<Staff> staffList = staffService.findAllWithDeletedStatus();

            if (staffList == null || staffList.isEmpty()) {
                newStaffID = 1;
            } else {
                for(int i = 0; i < staffList.size(); i++){
                    int temp = Integer.parseInt(staffList.get(i).getStaffID(),1,5,10);
                    if(newStaffID < temp){
                        newStaffID = temp;
                    }
                }
                newStaffID++;
                
//                Staff lastStaff = staffList.get(staffList.size() - 1);
//                newStaffID = Integer.parseInt(lastStaff.getStaffID(), 1, 5, 10) + 1;
            }

            session.setAttribute("reStaffIDValue", String.format("S%04d", newStaffID));
            
            response.sendRedirect("admin/registerStaff.jsp");
        } catch (Exception e) {
            response.getWriter().println(e.getMessage());
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String staffID = "";
        String staffName = "";
        String errorMessage = "";
        StaffService staffService = new StaffService(em);
        HttpSession session = request.getSession();

        try {
            staffID = request.getParameter("staffID");
            staffName = request.getParameter("staffName");

            // if false
            if (!validateFirstTimeRegister(staffID, staffName)) {
                errorMessage += "Staff ID existed or value(s) cannot be null!<br>";
                request.setAttribute("errorMessage", errorMessage);
                getServletContext().getRequestDispatcher("/registerStaff.jsp").forward(request, response);

            } else {
                Staff staff = new Staff(staffID, staffName, Staff.VERIFICATION_STATUS);
                staff.setPassword(staff.getDefaultPassword());

                utx.begin();
                staffService.addStaff(staff);
                utx.commit();                

                session.setAttribute("staffRegSuccess", "New staff, " + staff.getName() + " registered successfully.<br>" +
                        "Default password will be: " + staff.getDefaultPassword() + "<br>");
                response.sendRedirect("admin/staffRegisterStatus.jsp");
            }
        } catch (Exception e) {
            errorMessage += e.getMessage();
            request.setAttribute("errorMessage", errorMessage);
            getServletContext().getRequestDispatcher("/registerStaff.jsp").forward(request, response);
        }
    }

    private boolean validateFirstTimeRegister(String staffID, String staffName) {

        StaffService staffService = new StaffService(em);

        try {
            Staff staff = staffService.findStaffByStaffId(staffID);

            // staffID existed
            if (staff != null) {
                return false;
            }

            // no value for staffName
            if (staffName == null || staffName.equals("")) {
                return false;
            }
        } catch (Exception e) {
            return false;
        }

        return true;
    }

}
