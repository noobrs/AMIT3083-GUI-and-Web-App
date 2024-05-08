/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import entity.Customer;
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

/**
 *
 * @author Vin Sen
 */
public class Login extends HttpServlet {

    @PersistenceContext
    EntityManager em;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        String username = "";
        String password = "";
        CustomerService custService = new CustomerService(em);
        Customer cust;

        CartService cartService = new CartService(em);

        try {

            username = request.getParameter("username");
            password = request.getParameter("password");
            cust = custService.findCustomerByUsername(username);

            if (cust == null || (!cust.getPassword().equals(password))) {
                throw new IllegalArgumentException("Login fail! Incorrect username or password!");
            } else {
                
                if (request.isUserInRole("AdminRole") || (Boolean) session.getAttribute("isStaff") != null) {
                    session.invalidate();
                    session = request.getSession(true);
                }

                session.setAttribute("customer", cust);
                cust.setProductcartList(cartService.getCartItems(cust.getCustomerID()));
                session.setAttribute("isCustomer", true);
                response.sendRedirect("index.jsp");
            }

        } catch (IllegalArgumentException e) {
            session.setAttribute("errorMessage", e.getMessage());
            session.setAttribute("enteredUsername", username);
            response.sendRedirect("login.jsp");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

}
