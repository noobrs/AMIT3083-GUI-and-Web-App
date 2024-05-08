/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import entity.Promotion;
import entity.Staff;
import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import service.PromotionService;

/**
 *
 * @author Danie
 */
public class SearchPromotion extends HttpServlet {

    @PersistenceContext
    EntityManager em;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        HttpSession session = request.getSession();
        
        try {
            PromotionService promoService = new PromotionService(em);
            int promoId = Integer.parseInt((String)session.getAttribute("promoId"));
            String button = (String)session.getAttribute("promoButton");
            
            Promotion promo = promoService.findPromotionByPromotionId(promoId);
            Staff staff = promo.getStaffid();
            
            session.setAttribute("promotion", promo);
            
            if(button.equals("Delete Promotion")){
                response.sendRedirect("staff/deletePromoConfirmation.jsp");
            }else if(button.equals("Update Promotion")){
                response.sendRedirect("staff/updatePromoConfirmation.jsp");
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
