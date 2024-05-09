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
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.transaction.UserTransaction;
import java.util.List;
import service.PromotionService;
import service.StaffService;

public class UpdatePromotion extends HttpServlet {

    @PersistenceContext
    EntityManager em;
    @Resource
    UserTransaction utx;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();

        try {
            PromotionService promoService = new PromotionService(em);
            Promotion selectedPromo = (Promotion) session.getAttribute("promotion");
            String promoCode = request.getParameter("promoCode");
            double discountPercentage = Double.parseDouble(request.getParameter("discountPercentage"));
            int redemptionQty = Integer.parseInt(request.getParameter("redemptionQty"));
            Staff staff = (Staff) session.getAttribute("staff");
            List<Promotion> activePromoList = promoService.findByStatus(Promotion.ACTIVE_STATUS);

            for (Promotion p : activePromoList) {
                if (p.getPromotioncode().equals(promoCode)
                        && !p.getPromotionid().equals(selectedPromo.getPromotionid())) {
                    throw new IllegalArgumentException("Promotion Code Existed!");
                }
            }

            // if is admin action
            if (request.isUserInRole("AdminRole") || staff == null) {
                StaffService staffService = new StaffService(em);
                staff = staffService.findStaffByStaffId(Staff.ADMIN_ID);
            }

            selectedPromo.setPromotioncode(promoCode);
            selectedPromo.setDiscountpercentage(discountPercentage);
            selectedPromo.setRedemptionquantity(redemptionQty);
            selectedPromo.setStaffid(staff);

            utx.begin();
            boolean success = promoService.updatePromotion(selectedPromo);
            utx.commit();

            if (success) {
                session.setAttribute("updatePromoMsg", "Promotion updated successfully!");
                response.sendRedirect("staff/staffDashboard.jsp");
            } else {
                session.setAttribute("updatePromoMsg", "Failed to update promotion!");
                response.sendRedirect("staff/staffDashboard.jsp");
            }

        } catch (IllegalArgumentException e) {
            session.setAttribute("updatePromoMsg", e.getMessage());
            response.sendRedirect("staff/updatePromoConfirmation.jsp");
        } catch (Exception e) {
            e.printStackTrace();
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
