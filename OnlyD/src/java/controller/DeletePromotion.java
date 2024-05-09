/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import entity.Promotion;
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
import service.PromotionService;
import service.StaffService;

public class DeletePromotion extends HttpServlet {

    @PersistenceContext
    EntityManager em;
    @Resource
    UserTransaction utx;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        try {
            PromotionService promoService = new PromotionService(em);
            Staff staff = (Staff) session.getAttribute("staff");
            Promotion promo = (Promotion) session.getAttribute("promotion");

            if (promo != null) {

                // if is admin action
                if (request.isUserInRole("AdminRole") || staff == null) {
                    StaffService staffService = new StaffService(em);
                    staff = staffService.findStaffByStaffId(Staff.ADMIN_ID);
                }

                promo.setStatus(Promotion.DELETED_STATUS);
                promo.setStaffid(staff);
                utx.begin();
                boolean success = promoService.updatePromotion(promo);
                utx.commit();

                if (success) {
                    session.setAttribute("statusMsg", "Promotion deleted successfully!");
                    response.sendRedirect("staff/staffDashboard.jsp");
                } else {
                    session.setAttribute("statusMsg", "Failed to delete promotion!");
                    response.sendRedirect("staff/staffDashboard.jsp");
                }

            }

        } catch (Exception e) {
            session.setAttribute("statusMsg", e.getMessage());
            response.sendRedirect("staff/staffDashboard.jsp");
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
