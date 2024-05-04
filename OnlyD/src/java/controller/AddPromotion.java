/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import entity.ProductPromotion;
import entity.Promotion;
import java.text.SimpleDateFormat;
import java.util.logging.Level;
import java.util.logging.Logger;
import jakarta.annotation.Resource;
import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;
import jakarta.servlet.RequestDispatcher;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.transaction.RollbackException;
import jakarta.transaction.UserTransaction;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import service.ProductPromotionService;
import service.PromotionService;

/**
 *
 * @author danie
 */
@WebServlet("/addPromotion")
public class AddPromotion extends HttpServlet {

    @PersistenceContext
    EntityManager em;
    @Resource
    UserTransaction utx;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        double discountPercentage = 0;
        Date startDateTime;
        Date endDateTime;
        PromotionService promotionService = new PromotionService(em);
        ProductPromotionService productPromotionService = new ProductPromotionService(em);

        try {
            discountPercentage = Double.parseDouble(request.getParameter("discountPercentage"));
            SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
            startDateTime = dateFormat.parse(request.getParameter("startDateTime"));
            endDateTime = dateFormat.parse(request.getParameter("endDateTime"));
            String errorMessage = "Empty input";

            if (discountPercentage == 0 || startDateTime == null || endDateTime == null) {
                errorMessage += "Null values";
                request.setAttribute("errorMessage", errorMessage);
                request.getRequestDispatcher("/addPromotion.jsp").forward(request, response);

            }

            if (!errorMessage.equals("")) {

                request.setAttribute("discountPercentage", discountPercentage);
                request.setAttribute("startDateTime", startDateTime);
                request.setAttribute("endDateTime", endDateTime);
                request.setAttribute("errorMessage", errorMessage);
                
                //request.getRequestDispatcher("/register.jsp").forward(request, response);
                //response.sendRedirect("register.jsp");

                RequestDispatcher rd = getServletContext().getRequestDispatcher("/register.jsp");
                rd.forward(request, response);
                return;
            }

            response.sendRedirect("addPromotion.jsp");

//        } catch (ParseException | NumberFormatException ex) {
//            // Handle parsing/formatting errors
//            String errorMessage = "Error parsing input data";
//            request.setAttribute("errorMessage", errorMessage);
//            request.getRequestDispatcher("/addPromotion.jsp").forward(request, response);
//        } catch (RollbackException rx) {
//            // Handle database rollback errors
//            String errorMessage = "Database error occurred";
//            request.setAttribute("errorMessage", errorMessage);
//            request.getRequestDispatcher("/addPromotion.jsp").forward(request, response);
//        } 
        }catch (Exception e) {
            // Handle other unexpected errors
            String errorMessage = "Unexpected error occurred";
            request.setAttribute("errorMessage", errorMessage);
            request.getRequestDispatcher("/addPromotion.jsp").forward(request, response);
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        double discountPercentage = 0;
        Date startDateTime;
        Date endDateTime;
        PromotionService promotionService = new PromotionService(em);
        HttpSession session = request.getSession();

        try {
//             Promotion promotion = (Promotion) session.getAttribute("promotion");
            
            discountPercentage = Double.parseDouble(request.getParameter("discountPercentage"));
            SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
            startDateTime = dateFormat.parse(request.getParameter("startDateTime"));
            endDateTime = dateFormat.parse(request.getParameter("endDateTime"));
            
//            RequestDispatcher rd = request.getRequestDispatcher("addPromotion.jsp");
//            rd.forward(request, response);
            // Creating a new Promotion object with the retrieved parameters
//            Promotion promotion = new Promotion();
//            promotion.setDiscountpercentage(discountPercentage);
//            promotion.setStartdatetime(startDateTime);
//            promotion.setEnddatetime(endDateTime);
//            promotion.setStatus(Promotion.ACTIVE_STATUS);
            Promotion promotion = new Promotion(discountPercentage, startDateTime, endDateTime, Promotion.ACTIVE_STATUS);

            // Starting a new transaction
            utx.begin();

            // Persisting the Promotion object to the database
            promotionService.addPromotion(promotion);

            // Committing the transaction
            utx.commit();

            // Redirecting to a success page
            session.setAttribute("Promotion successful", "New Promo, " + promotion.getPromotionid() + " added successfully.<br>");
            response.sendRedirect("staff/promotion.jsp");
        } catch (Exception ex) {
//            Logger.getLogger(AddPromotion.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

}
