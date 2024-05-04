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
import service.CustomerService;

/**
 *
 * @author Vin Sen
 */
public class Login extends HttpServlet {

    @PersistenceContext
    EntityManager em;

//    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
//            throws ServletException, IOException {
//
//        HttpSession session = request.getSession();
//        String username;
//        String password;
//        CustomerService custService = new CustomerService(em);
//        Customer cust;
//
//        // means login ady
//        if (session.getAttribute("customer") != null) {
//            response.sendRedirect("index.jsp");
//        } else if (session.getAttribute("staff") != null) {
//            // automatically log out staff if customer attempt to login
//            session.removeAttribute("staff");
//        }
//
//        try {
//            username = request.getParameter("username");
//            password = request.getParameter("password");
//            cust = custService.findCustomerByUsername(username);
//
//            if (cust == null) {
//                request.setAttribute("errorMessage", "Login fail! Incorrect username or password!");
//                request.getRequestDispatcher("/login.jsp").forward(request, response);
//            } else {
//                if (!cust.getPassword().equals(password)) {
//                    request.setAttribute("errorMessage", "Login fail! Incorrect username or password!");
//                    request.getRequestDispatcher("/login.jsp").forward(request, response);
//                } else {
//                    session.setAttribute("customer", cust);
//                    response.sendRedirect("index.jsp");
//                }
//
//            }
//
//        } catch (Exception ex) {
//            Logger.getLogger(Login.class.getName()).log(Level.SEVERE, null, ex);
//            response.getWriter().println(ex.getMessage());
//        }
//    }
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        HttpSession session = request.getSession();
        String username = "";
        String password = "";
        CustomerService custService = new CustomerService(em);
        Customer cust;

        try {
            // means login ady
//            if (session.getAttribute("customer") != null) {
//                response.sendRedirect("index.jsp");
//            } else if (session.getAttribute("staff") != null) {
//                // automatically log out staff if customer attempt to login
//                session.invalidate();
//                session = request.getSession();
//            } else if (request.isUserInRole("AdminRole")) {
//                session.invalidate();
//                session = request.getSession();
//            }

            username = request.getParameter("username");
            password = request.getParameter("password");
            cust = custService.findCustomerByUsername(username);

            if (cust == null || (!cust.getPassword().equals(password))) {
                throw new IllegalArgumentException("Login fail! Incorrect username or password!");
            } else {
                session.setAttribute("customer", cust);
                session.setAttribute("isCustomer", true);
                response.sendRedirect("index.jsp");
            }

        } catch (IllegalArgumentException e) {
            session.setAttribute("errorMessage", e.getMessage());
            session.setAttribute("enteredUsername", username);
            response.sendRedirect("login.jsp");
        } catch (IOException e) {
        }
    }

}
