/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import entity.Customer;
import jakarta.annotation.Resource;
import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;
import jakarta.servlet.RequestDispatcher;
import jakarta.transaction.RollbackException;
import java.io.IOException;
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
public class Register extends HttpServlet {

    @PersistenceContext
    EntityManager em;
    @Resource
    UserTransaction utx;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.sendRedirect("register.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        String name = "";
        String email = "";
        String username = "";
        String phoneNumber = "";
        String password = "";
        String rePassword = "";
        CustomerService custService = new CustomerService(em);

        try {
            name = request.getParameter("name");
            email = request.getParameter("email");
            username = request.getParameter("username");
            phoneNumber = request.getParameter("phoneNumber");
            password = request.getParameter("password");
            rePassword = request.getParameter("rePassword");

            // username validation
            if (custService.findCustomerByUsername(username) != null) {
                throw new IllegalArgumentException("Username existed!");
            } else if (username.length() < 8) {
                throw new IllegalArgumentException("Username must have at least 8 characters!");
            }

            // email validation
            if (custService.findCustomerByEmail(email) != null) {
                throw new IllegalArgumentException("Email existed!");
            }

            // phone number validation
            if (custService.findCustomerByPhoneNumber(phoneNumber) != null) {
                throw new IllegalArgumentException("Phone Number existed!");
            } 

            // password validation
            if (!password.matches(rePassword)) {
                throw new IllegalArgumentException("Passwords not match!");
            } 
            
            Customer cust = new Customer(name, username, phoneNumber, email, password, Customer.ACTIVE_STATUS);
            
            utx.begin();
            custService.addCustomer(cust);
            utx.commit();
            
            session.setAttribute("statusMsg", "Customer Register Successfully!");
            
            if(request.isUserInRole("AdminRole")){
                response.sendRedirect("staff/staffDashboard.jsp");
            }else{               
                response.sendRedirect("login.jsp");
            }            

        } catch (IllegalArgumentException e) {
            
            session.setAttribute("enteredName", name);
            session.setAttribute("enteredEmail", email);
            session.setAttribute("enteredUsername", username);
            session.setAttribute("enteredPhoneNumber", phoneNumber);
            session.setAttribute("errorMessage", e.getMessage());
            response.sendRedirect("register.jsp");
            
        } catch (Exception e) {
        }
    }
}
