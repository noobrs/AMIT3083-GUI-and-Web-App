/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

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
import java.util.ArrayList;
import java.util.List;
import service.ProductService;
import service.PromotionService;

public class SearchDetailForHome extends HttpServlet {

    @PersistenceContext
    EntityManager em;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();

        try {
            ProductService productService = new ProductService(em);
            PromotionService promotionService = new PromotionService(em);

            List<Integer> topSoldProdID = em.createNativeQuery("select po.productid from PRODUCTORDER po group by po.productid order by sum(po.quantity) desc").getResultList();

            List<Product> topSoldProduct = new ArrayList<>();

            for (Integer pID : topSoldProdID) {
                topSoldProduct.add(productService.findProductByID(pID));
            }
            
            //sList<Product> productList = productService.findByStatus(1);
            List<Promotion> promotionList = promotionService.findByStatus(1);
            
            session.setAttribute("productListImage", topSoldProduct);
            session.setAttribute("promotionListHome", promotionList);
            response.sendRedirect(request.getContextPath());
            
        } catch (Exception e) {
            response.getWriter().println(e.getMessage());
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
