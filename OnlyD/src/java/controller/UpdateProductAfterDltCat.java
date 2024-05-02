/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import entity.Category;
import entity.Product;
import entity.Staff;
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
import java.util.List;
import service.CategoryService;
import service.ProductService;

/**
 *
 * @author GIGABYTE
 */
public class UpdateProductAfterDltCat extends HttpServlet {
    
    @PersistenceContext
    EntityManager em;
    @Resource
    UserTransaction utx;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            CategoryService categoryService = new CategoryService(em);
            ProductService productService = new ProductService(em);
            HttpSession session = request.getSession();
            Category category = (Category)session.getAttribute("category");
            List<Category> categoryList = categoryService.findAll();
            List<Product> productList = productService.findAll();
            int id = category.getCategoryid(); //category deleted
            int tempId = 0; //use to store the "NULL" category id
            
            for (Category categoryP : categoryList) { //find category "NULL"
                if (categoryP.getCategoryname().equals("NULL")) {
                    tempId = categoryP.getCategoryid(); //store "NULL" id
                }
            }
            
            Category tempCategory = new Category(tempId);
            
            for (Product productP : productList) { //find those product have get deleted category id
                Category testCategory = productP.getCategoryid();
                int cid = testCategory.getCategoryid();
                if (cid == id) { 
                    productP.setCategoryid(tempCategory);
                    utx.begin();
                    productService.updateProduct(productP);
                    utx.commit();
                }
            }

            response.sendRedirect("staff/deleteCategoryConfirm.jsp");

        } catch (Exception ex) {
            response.getWriter().println(ex.getMessage());
        } 
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
