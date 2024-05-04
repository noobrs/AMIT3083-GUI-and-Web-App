/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import entity.Category;
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
import service.CategoryService;

/**
 *
 * @author GIGABYTE
 */
public class DeleteCategory extends HttpServlet {

    @PersistenceContext
    EntityManager em;
    @Resource
    UserTransaction utx;
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            CategoryService categoryService = new CategoryService(em);
            HttpSession session = request.getSession();
            Category category = (Category)session.getAttribute("category");
            int id = category.getCategoryid();

            utx.begin();
            boolean success = categoryService.deleteCategory(id);
            utx.commit();
            
            session.setAttribute("successDltCategory", success);
            response.sendRedirect("UpdateProductAfterDltCat");
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
