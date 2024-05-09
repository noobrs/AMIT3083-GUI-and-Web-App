/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import entity.Customer;
import jakarta.annotation.Resource;
import jakarta.transaction.UserTransaction;
import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import service.CartService;
import service.CustomerService;

public class RemoveFromCart extends HttpServlet {

    @PersistenceContext
    EntityManager em;
    @Resource
    UserTransaction utx;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();

        try {
            int productId = Integer.parseInt(request.getParameter("productId"));

            Customer cust = (Customer) session.getAttribute("customer");
            CartService cartService = new CartService(em);
            CustomerService custService = new CustomerService(em);

            // Check if the customer is logged in
            if (cust != null) {
                utx.begin();
                // Remove the item from the cart
                boolean removed = cartService.removeCartItem(cust.getCustomerID(), productId);

                if (removed) {
                    utx.commit();

                    utx.begin();
                    cust = custService.findCustomerById(cust.getCustomerID());
                    em.refresh(cust);
                    cust.initializeProductcartList();
                    cust.initializeOrderList();
                    session.setAttribute("customer", cust);
                    utx.commit();

                    // Redirect back to the cart page
                    response.sendRedirect("ViewCart");
                } else {
                    // if removal failed
                    throw new IllegalArgumentException("Failed to remove product from cart");
                }
            } else {
                // If the customer is not logged in, redirect to the login page
                session.setAttribute("statusMsg", "Not a user, try to login!");
                response.sendRedirect("login.jsp");
            }
        } catch (NumberFormatException e) {
            // Handle invalid product ID parameter
            session.setAttribute("errorMessage", "Invalid Product");
            response.sendRedirect("ViewCart");
            e.printStackTrace();
        } catch (IllegalArgumentException e) {
            session.setAttribute("errorMessage", e.getMessage());
            response.sendRedirect("ViewCart");
        } catch (Exception e) {
            // Handle other exceptions
            response.getWriter().println("Error processing the request");
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
