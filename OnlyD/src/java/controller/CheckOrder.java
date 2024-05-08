/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import entity.Customer;
import entity.Productcart;
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
import java.util.List;
import service.CartService;
import service.OrderService;
import service.ProductService;
import service.PromotionService;

/**
 *
 * @author Vin Sen
 */
public class CheckOrder extends HttpServlet {

    @PersistenceContext
    EntityManager em;
    @Resource
    UserTransaction utx;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        String button = request.getParameter("orderButton");
        List<Productcart> selected = (List<Productcart>) session.getAttribute("selectedCartItem");
        Customer cust = (Customer) session.getAttribute("customer");
        ProductService productService = new ProductService(em);
        OrderService orderService = new OrderService(em);
        CartService cartService = new CartService(em);
        PromotionService promoService = new PromotionService(em);

        try {
            // check if promo code applied
            if (button.equals("Apply")) {
                
                String promoCode = request.getParameter("promoCodeEntered");

                Promotion promotion = promoService.findPromotionByPromotionCode(promoCode);
                if (promotion != null) {
                    if (promotion.getStatus() == Promotion.ACTIVE_STATUS) {

                        session.setAttribute("promoApplied", promotion);
                        response.sendRedirect("user/checkout.jsp");

                    } else {
                        response.getWriter().println("promo not same");
                        throw new IllegalArgumentException("promo not same");
                    }
                } else {
                    response.getWriter().println("promo null");
                }

            // go to payment
            } else {
                //String address = request.getParameter("address");
                Double subtotal = Double.valueOf(request.getParameter("subtotal"));
                Double discount = Double.valueOf(request.getParameter("totaldiscount"));
                Double shippingfee = Double.valueOf(request.getParameter("shippingfee"));
                Double total = Double.valueOf(request.getParameter("total"));
                
                //session.setAttribute("address", address);
                session.setAttribute("subtotal", subtotal);
                session.setAttribute("discount", discount);
                session.setAttribute("shippingfee", shippingfee);
                session.setAttribute("total", total);
                
                response.sendRedirect("user/payment.jsp");
            }
        } catch (Exception e) {
            response.getWriter().println(e.getMessage());
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
