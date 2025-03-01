/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import entity.Category;
import entity.Product;
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

            response.sendRedirect("admin/deleteCategoryConfirm.jsp");

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
