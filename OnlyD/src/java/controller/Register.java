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

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        String name = "";
        String email = "";
        String username = "";
        String phoneNumber = "";
        String password = "";
        String rePassword = "";

        String passwordRegex = "^(?=.*[A-Z])(?=.*[a-z])(?=.*\\d)(?=.*[\\W_]).+$";

        CustomerService custService = new CustomerService(em);
        String errorMessage = "";

        try {
            name = request.getParameter("name");
            email = request.getParameter("email");
            username = request.getParameter("username");
            phoneNumber = request.getParameter("phoneNumber");
            password = request.getParameter("password");
            rePassword = request.getParameter("rePassword");            
            
            // check null values
            if (name == null || email == null || username == null || phoneNumber == null
                    || password == null || rePassword == null) {
                errorMessage += "Null value";
                request.setAttribute("errorMessage", errorMessage);
                request.getRequestDispatcher("/register.jsp").forward(request, response);

            }

            // check email, username and phoneNumber existence
            if (custService.findCustomerByUsername(username) != null) {
                errorMessage += "Username existed. Try again!<br>";
            }

            if (custService.findCustomerByEmail(email) != null) {
                errorMessage += "Email existed. Try again!<br>";
            }

            if (custService.findCustomerByPhoneNumber(phoneNumber) != null) {
                errorMessage += "Phone Number existed. Try again!<br>";
            }

            // check password and rePassword
            if (!password.equals(rePassword)) {
                errorMessage += "Passwords do not match. Please enter again!<br>";
            } else if (password.length() < 8 || !password.matches(passwordRegex)) {
                errorMessage += "Invalid password format! Please make sure password contains at least<br>"
                        + "1 uppercase<br>"
                        + "1 lowercase<br>"
                        + "1 digit<br>"
                        + "1 special character<br>"
                        + "8 characters<br>";
            }

            if (!errorMessage.equals("")) {
                request.setAttribute("nameValue", name);
                request.setAttribute("emailValue", email);
                request.setAttribute("usernameValue", username);
                request.setAttribute("phoneNumberValue", phoneNumber);
                request.setAttribute("errorMessage", errorMessage);
                //request.getRequestDispatcher("/register.jsp").forward(request, response);
                //response.sendRedirect("register.jsp");

                RequestDispatcher rd = getServletContext().getRequestDispatcher("/register.jsp");
                rd.forward(request, response);
                return;
            }

            //create new customer object
            Customer cust = new Customer(name, email, username, phoneNumber, password);

            // start persist customer object into database
            utx.begin();
            custService.addCustomer(cust);
            utx.commit();

            // add customer to server?
            // action after registered 
            //  if correct -> redirect to login page
            response.sendRedirect("registerSuccess.jsp");

            //  if wrong -> redirect back to register page with remaining data and details error msg
        } catch (RollbackException ex) { // utx.commit() failed
            request.setAttribute("nameValue", name);
            request.setAttribute("emailValue", email);
            request.setAttribute("usernameValue", username);
            request.setAttribute("phoneNumberValue", phoneNumber);
            request.setAttribute("passwordValue", password);
            request.setAttribute("rePasswordValue", rePassword);

            session.setAttribute("status", "Rollback");
            //response.sendRedirect("register.jsp");

            RequestDispatcher rd = getServletContext().getRequestDispatcher("/register.jsp");
            rd.forward(request, response);

            response.getWriter().println(ex.getMessage() + " [Rollback]");

        } catch (Exception ex) {
            Logger.getLogger(Register.class.getName()).log(Level.SEVERE, null, ex);
            response.getWriter().println(ex.getMessage());
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.sendRedirect("register.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }
}
