/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import entity.Product;
import entity.Productpromotion;
import entity.ProductpromotionPK;
import entity.Promotion;
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
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import service.PromotionService;

/**
 *
 * @author Vin Sen
 */
public class ProcessProductToPromo extends HttpServlet {

    @PersistenceContext
    EntityManager em;
    @Resource
    UserTransaction utx;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
            HttpSession session = request.getSession();
            List<Product> productList = (List) session.getAttribute("productListToPromo");
            List<Product> selectedProductList = new ArrayList<Product>();
            double discountPercentage = 0;
            Date startDateTime;
            Date endDateTime;
            PromotionService promotionService = new PromotionService(em);

            // get selected product
            for (int i = 0; i < productList.size(); i++) {
                if (request.getParameter("productArr[" + i + "]") != null) {
                    selectedProductList.add(productList.get(i));
                }
            }

            // process input
            discountPercentage = Double.parseDouble(request.getParameter("discountPercentage"));
            SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
            startDateTime = dateFormat.parse(request.getParameter("promoStartDate"));
            endDateTime = dateFormat.parse(request.getParameter("promoEndDate"));

            Promotion promotion = new Promotion(discountPercentage, startDateTime, endDateTime, Promotion.ACTIVE_STATUS);

            utx.begin();
            promotionService.addPromotion(promotion);
            utx.commit();

            utx.begin();
            List<Productpromotion> productpromoList = new ArrayList<>();
            for (Product p : selectedProductList) {
                productpromoList.add(new Productpromotion(new ProductpromotionPK(promotion.getPromotionid(), p.getProductid())));
            }

            boolean added = promotionService.addProductPromotion(productpromoList);
            utx.commit();
            
            if (added) {
                session.setAttribute("Promotion successful", "New Promo, " + promotion.getPromotionid() + " added successfully.<br>");
                response.sendRedirect("staff/promotion.jsp");
            } else {
                response.sendRedirect("ViewProductToPromo");
            }

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
