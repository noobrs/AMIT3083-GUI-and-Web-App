/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import entity.Category;
import entity.Product;
import entity.Promotion;
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
import service.PromotionService;

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
            PromotionService promotionService = new PromotionService(em);
            List<Product> productList = productService.findByStatus(1);
            List<Category> categoryList = categoryService.findByStatus(1);
            HttpSession session = request.getSession();

            double[] promoPrice = new double[productList.size()];
            for (int i = 0; i < productList.size(); i++) {
                if (productList.get(i).getIspromo() == true) {

                    Promotion activePromo = promotionService.findActivePromotionByProductId(productList.get(i).getProductid());
                    promoPrice[i] = productList.get(i).getPrice() * (100 - activePromo.getDiscountpercentage()) / 100;
                }
            }
            session.setAttribute("promoPrice", promoPrice);

            session.setAttribute("productListUser", productList);
            session.setAttribute("categoryListUser", categoryList);
            int i = 0;

            for (Product product : productList) {
                Category category = product.getCategoryid();
                session.setAttribute("Category" + i, category);
                i++;
            }
            response.sendRedirect("user/productlist.jsp");
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
