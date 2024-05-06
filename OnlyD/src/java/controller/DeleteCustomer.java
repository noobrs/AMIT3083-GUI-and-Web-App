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
public class DeleteCustomer extends HttpServlet {

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

        try {
            CustomerService custService = new CustomerService(em);
            HttpSession session = request.getSession();
            Customer cust = (Customer) session.getAttribute("custFound");

            cust.setStatus(Customer.DELETED_STATUS);

            utx.begin();
            boolean success = custService.updateCustomer(cust);
            utx.commit();

            if (success) {
                session.setAttribute("statusMsg", "Customer deleted successfully!");
            } else {
                session.setAttribute("statusMsg", "Unable to delete customer!");
            }
            session.removeAttribute("custFound");
            response.sendRedirect("admin/adminDashboard.jsp");
            
        } catch (Exception e) {
        }
    }

}
