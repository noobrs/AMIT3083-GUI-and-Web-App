/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import entity.Category;
import entity.Product;
import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.List;
import service.CategoryService;
import service.ProductService;

/**
 *
 * @author GIGABYTE
 */
public class ViewProduct extends HttpServlet {

    @PersistenceContext
    EntityManager em;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            ProductService productService = new ProductService(em);
            CategoryService categoryService = new CategoryService(em);
            List<Product> productList = productService.findByStatus(1);
            List<Category> categoryList = categoryService.findByStatus(1);
            HttpSession session = request.getSession();

            session.setAttribute("productListUser", productList);
            session.setAttribute("categoryListUser", categoryList);
            
            response.sendRedirect("user/productlist.jsp");
            return;
            //request.getRequestDispatcher("/user/productlist.jsp").forward(request, response);
        } catch (Exception ex) {
            response.getWriter().println(ex.getMessage());
            ex.printStackTrace();
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
