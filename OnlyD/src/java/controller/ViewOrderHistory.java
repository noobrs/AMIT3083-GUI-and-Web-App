/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import entity.Customer;
import entity.Orders;
import entity.Productorder;
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
import java.util.List;
import service.CustomerService;

/**
 *
 * @author Vin Sen
 */
public class ViewOrderHistory extends HttpServlet {

    @PersistenceContext
    EntityManager em;
    @Resource
    UserTransaction utx;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();

        try {
            CustomerService custService = new CustomerService(em);
            Customer cust = (Customer) session.getAttribute("customer");
            
            // if not customer then redirect to login
            if(cust == null){
                session.setAttribute("statusMsg", "Not a user, try to login!");
                response.sendRedirect("login.jsp");
            }
            
            // get the latest order list in cust
            utx.begin();
            Customer temp = custService.findCustomerById(cust.getCustomerID());
            em.refresh(temp);
            utx.commit();
            
            session.setAttribute("customer", temp);
            
            response.sendRedirect("user/orderHistory.jsp");

        } catch (Exception e) {
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
