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
import service.CustomerService;

/**
 *
 * @author Vin Sen
 */
public class UpdateCustomer extends HttpServlet {

    @PersistenceContext
    EntityManager em;
    @Resource
    UserTransaction utx;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        CustomerService custService = new CustomerService(em);
        String username = "";
        String name = "";
        String email = "";
        String phoneNumber = "";
        String password = "";
        String rePassword = "";
        Customer tempCust;

        try {
            name = request.getParameter("name");
            email = request.getParameter("email");
            username = request.getParameter("username");
            phoneNumber = request.getParameter("phoneNumber");
            password = request.getParameter("password");
            rePassword = request.getParameter("rePassword");

            Customer cust = (Customer) session.getAttribute("custFound");

            // username validation
            tempCust = custService.findCustomerByUsername(username);
            if (tempCust != null && (tempCust.getCustomerID() != cust.getCustomerID())) {
                throw new IllegalArgumentException("Username existed!");
            } else if (username.length() < 8) {
                throw new IllegalArgumentException("Username must have at least 8 characters!");
            }

            // email validation
            tempCust = custService.findCustomerByEmail(email);
            if (tempCust != null && (tempCust.getCustomerID() != cust.getCustomerID())) {
                throw new IllegalArgumentException("Email existed!");
            } else if (!email.matches(Customer.EMAIL_REGEX)) {
                throw new IllegalArgumentException("Invalid Email Format!");
            }

            // phone number validation
            tempCust = custService.findCustomerByPhoneNumber(phoneNumber);
            if (tempCust != null && (tempCust.getCustomerID() != cust.getCustomerID())) {
                throw new IllegalArgumentException("Phone Number existed!");
            } else if (!phoneNumber.matches(Customer.PHONENUMBER_REGEX)) {
                throw new IllegalArgumentException("Invalid Phone Number Format!");
            }

            // password validation
            if (!password.matches(rePassword)) {
                throw new IllegalArgumentException("Passwords not match!");
            } else if (password.length() < 8 || !password.matches(Customer.PASSWORD_REGEX)) {
                throw new IllegalArgumentException("Invalid Password Format!");
            }

            cust.setName(name);
            cust.setUsername(username);
            cust.setEmail(email);
            cust.setPhoneNumber(phoneNumber);
            cust.setPassword(password);

            utx.begin();
            boolean success = custService.updateCustomer(cust);
            utx.commit();

            session.setAttribute("updateCustStatus", success);
            session.removeAttribute("errorMessage");
            session.removeAttribute("custFound");
            session.removeAttribute("enteredName");
            session.removeAttribute("enteredEmail");
            session.removeAttribute("enteredUsername");
            session.removeAttribute("enteredPhoneNumber");
            response.sendRedirect("admin/adminDashboard.jsp");

        } catch (IllegalArgumentException e) {
            session.setAttribute("enteredName", name);
            session.setAttribute("enteredEmail", email);
            session.setAttribute("enteredUsername", username);
            session.setAttribute("enteredPhoneNumber", phoneNumber);
            session.setAttribute("errorMessage", e.getMessage());
            response.sendRedirect("admin/updateCustomer.jsp");
        } catch (Exception e) {
        }
    }

}
