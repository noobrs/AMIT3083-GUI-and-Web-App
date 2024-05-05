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
import javax.naming.InitialContext;
import service.CartService;

public class RemoveFromCart extends HttpServlet {

    @PersistenceContext
    EntityManager em;
    @Resource
    UserTransaction utx;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            HttpSession session = request.getSession();
            CartService cartService = new CartService(em);
            int productId = Integer.parseInt(request.getParameter("productId"));

            Customer cust = (Customer) session.getAttribute("customer");

            // Check if the customer is logged in
            if (cust != null) {
                //UserTransaction utx = (UserTransaction) new InitialContext().lookup("java:comp/UserTransaction");
                utx.begin(); // Begin the transaction
                // Remove the item from the cart
                boolean removed = cartService.removeCartItem(cust.getCustomerID(), productId);

                if (removed) {
                    utx.commit(); // Commit the transaction
                    // Redirect back to the cart page
                    response.sendRedirect("ViewCart");
                } else {
                    // If removal failed, handle the error
                    response.getWriter().println("Failed to remove product from cart");
                }
            } else {
                // If the customer is not logged in, redirect to the login page
                session.setAttribute("statusMsg", "Not a user, try to login!");
                response.sendRedirect("login.jsp");
            }
        } catch (NumberFormatException e) {
            // Handle invalid product ID parameter
            response.getWriter().println("Invalid product ID");
            e.printStackTrace();
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