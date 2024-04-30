/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import entity.Promotion;
import java.text.SimpleDateFormat;
import java.util.logging.Level;
import java.util.logging.Logger;
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
import java.util.ArrayList;
import java.util.Date;
import java.util.List;


/**
 *
 * @author danie
 */
public class AddPromotion extends HttpServlet {
    
    @PersistenceContext
    EntityManager em;
    @Resource
    UserTransaction utx;
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            double discountPercentage = Double.parseDouble(request.getParameter("discountPercentage"));
            SimpleDateFormat dateFormat = new SimpleDateFormat("dd-MM-yyyy");
            Date startDateTime = dateFormat.parse(request.getParameter("startDateTime"));
            Date endDateTime = dateFormat.parse(request.getParameter("endDateTime"));

            // Creating a new Promotion object with the retrieved parameters
//            Promotion promotion = new Promotion();
//            promotion.setDiscountPercentage(discountPercentage);
//            promotion.setStartDateTime(startDateTime);
//            promotion.setEndDateTime(endDateTime);

            // Starting a new transaction
            utx.begin();
            Promotion promotion = new Promotion(discountPercentage, startDateTime, endDateTime);

            // Persisting the Promotion object to the database
            em.persist(promotion);

            
            
            // Committing the transaction
            utx.commit();

            // Redirecting to a success page
            response.sendRedirect("promotion.jsp");
        } catch (Exception ex) {
//            Logger.getLogger(AddPromotion.class.getName()).log(Level.SEVERE, null, ex);
        }
    }


}
