/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import entity.Category;
import entity.Product;
import entity.Staff;
import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.List;
import service.ProductService;

/**
 *
 * @author GIGABYTE
 */
public class ViewProductStaff extends HttpServlet {

    @PersistenceContext
    EntityManager em;
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       try {
            ProductService productService = new ProductService(em);
            List<Product> productList = productService.findAll();
            HttpSession session = request.getSession();
            int i = 0;
            
            session.setAttribute("productListStaff", productList);
            
            for (Product product: productList){ 
                Category category = product.getCategoryid();
                Staff staff = product.getStaffid();
                
                session.setAttribute("Category" + i, category);
                session.setAttribute("Staff" + i, staff);
                i++;
            }

            response.sendRedirect("staff/productListStaff.jsp");
        } catch (Exception ex) {
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
