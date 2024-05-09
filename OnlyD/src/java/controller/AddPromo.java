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
import java.util.List;
import service.PromotionService;
import service.StaffService;

public class AddPromo extends HttpServlet {

    @PersistenceContext
    EntityManager em;
    @Resource
    UserTransaction utx;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();

        try {
            String promoCode = request.getParameter("promoCode");
            double discountPercentage = Double.parseDouble(request.getParameter("discountPercentage"));
            int redemptionQty = Integer.parseInt(request.getParameter("redemptionQty"));

            Staff staff = (Staff) session.getAttribute("staff");
            PromotionService promoService = new PromotionService(em);

            List<Promotion> activePromoList = promoService.findByStatus(Promotion.ACTIVE_STATUS);

            if (activePromoList != null || !activePromoList.isEmpty()) {
                for (Promotion p : activePromoList) {
                    if (p.getPromotioncode().equals(promoCode)) {
                        throw new IllegalArgumentException("Promotion Code Existed!");
                    }
                }
            }

            // if is admin action
            if (request.isUserInRole("AdminRole") || staff == null) {
                StaffService staffService = new StaffService(em);
                staff = staffService.findStaffByStaffId(Staff.ADMIN_ID);
            }

            Promotion promo = new Promotion(promoCode, discountPercentage, redemptionQty, Promotion.ACTIVE_STATUS, staff);

            utx.begin();
            promoService.addPromotion(promo);
            utx.commit();

            session.setAttribute("addPromoMsg", "Promotion Added Successfully!");
            response.sendRedirect("staff/addPromoConfirm.jsp");

        } catch (IllegalArgumentException e) {
            session.setAttribute("statusMsg", e.getMessage());
            response.sendRedirect("staff/addPromotion.jsp");
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
