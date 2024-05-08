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
import service.ProductService;
import service.CategoryService;

/**
 *
 * @author GIGABYTE
 */
public class SearchProductByUser extends HttpServlet {

    @PersistenceContext
    EntityManager em;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            ProductService productService = new ProductService(em);
            CategoryService categoryService = new CategoryService(em);
            HttpSession session = request.getSession();
            String prefix = request.getParameter("productName");
            String button = request.getParameter("searchButton");
            int tempId = -1;
            int i = 0;
            
            // if direct search from header, the cat is null
            List<Category> categoryListT = (List)session.getAttribute("categoryListUser");
            if(categoryListT == null){
                categoryListT = categoryService.findAll();
                session.setAttribute("categoryListUser", categoryListT);
            }

            if (button.equals("Search") || button.equals("List All")) {
                List<Product> productList = productService.findByNamePrefix(prefix, 1);
                

                for (Product product : productList) {
                    Category category = product.getCategoryid();
                    session.setAttribute("Category" + i, category);
                    i++;
                }

                session.setAttribute("productListUser", productList);
                response.sendRedirect("user/productlist.jsp");
            } else {
                List<Category> categoryList = categoryService.findByStatus(1);
                for (Category c : categoryList) {
                    String tempName = c.getCategoryname().trim();
                    if (tempName.equals(button.trim())) {
                        tempId = c.getCategoryid();
                    }
                }

                Category tempCat = new Category(tempId);

                List<Product> productList = productService.findByCatPrefix(prefix, 1, tempCat);

                for (Product product : productList) {
                    Category category = product.getCategoryid();
                    session.setAttribute("Category" + i, category);
                    i++;
                }

                session.setAttribute("productListUser", productList);
                response.sendRedirect("user/productlist.jsp");
            }

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