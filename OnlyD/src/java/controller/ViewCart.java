/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import entity.Customer;
import entity.Productcart;
import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.List;
import service.CartService;

/**
 *
 * @author Asus
 */
public class ViewCart extends HttpServlet {

    @PersistenceContext
    EntityManager em;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            CartService cartService = new CartService(em);
            HttpSession session = request.getSession();

            Customer cust = (Customer) session.getAttribute("customer");

            // customer logged in
            if (cust != null) {
                // get customer cart
//                List<Productcart> productcartList = cartService.getCartItems(cust.getCustomerID());
                List<Productcart> productcartList = cust.getProductcartList();
                session.setAttribute("productcartList", productcartList);
                response.sendRedirect("user/cart.jsp");
            } else{
                
                session.setAttribute("statusMsg", "Not a user, try to login!");
                response.sendRedirect("login.jsp");
            }

        } catch (Exception ex) {
            response.getWriter().println(ex.getMessage());
            ex.printStackTrace();
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
