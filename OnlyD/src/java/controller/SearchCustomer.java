/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import entity.Customer;
import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;
import java.io.IOException;
import java.io.PrintWriter;
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
public class SearchCustomer extends HttpServlet {

    @PersistenceContext
    EntityManager em;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
            CustomerService custService = new CustomerService(em);
            HttpSession session = request.getSession();
            String username = (String)session.getAttribute("username");
            String button = (String)session.getAttribute("button");
            
            Customer cust = custService.findCustomerByUsername(username);
            
            session.setAttribute("custFound", cust);
            if(button.equals("Delete Customer")){
                response.sendRedirect("admin/deleteCustomer.jsp");
            }else if(button.equals("Update Customer")){
                response.sendRedirect("admin/updateCustomer.jsp");
            }
            
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
