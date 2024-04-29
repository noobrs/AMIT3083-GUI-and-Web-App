/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import entity.Customer;
import jakarta.annotation.Resource;
import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.transaction.UserTransaction;
import java.util.logging.Level;
import java.util.logging.Logger;
import service.CustomerService;

/**
 *
 * @author Vin Sen
 */
public class Login extends HttpServlet {

    @PersistenceContext
    EntityManager em;
    @Resource
    UserTransaction utx;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        String username;
        String password;
        CustomerService custService = new CustomerService(em);
        Customer cust;

        // means login ady
        if (session.getAttribute("customer") != null) {
            response.sendRedirect("index.jsp");
        } else if (session.getAttribute("staff") != null) {
            // automatically log out staff if customer attempt to login
            session.removeAttribute("staff");
        }

        try {
            username = request.getParameter("username");
            password = request.getParameter("password");
            cust = custService.findCustomerByUsername(username);

            if (cust == null) {
                request.setAttribute("errorMessage", "Login fail! Incorrect username or password!");
                request.getRequestDispatcher("/login.jsp").forward(request, response);
            } else {
                if (!cust.getPassword().equals(password)) {
                    request.setAttribute("errorMessage", "Login fail! Incorrect username or password!");
                    request.getRequestDispatcher("/login.jsp").forward(request, response);
                } else {
                    session.setAttribute("customer", cust);
                    response.sendRedirect("index.jsp");
                }              
                
            }

        } catch (Exception ex) {
            Logger.getLogger(Login.class.getName()).log(Level.SEVERE, null, ex);
            response.getWriter().println(ex.getMessage());
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
