/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import entity.Product;
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

/**
 *
 * @author Vin Sen
 */
public class ViewTopSold extends HttpServlet {

    @PersistenceContext
    EntityManager em;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();

        try {
            ProductService productService = new ProductService(em);

            List<Integer> sold = em.createNativeQuery("select po.productid from PRODUCTORDER po group by po.productid order by sum(po.quantity) desc").getResultList();
            List<Integer> soldQty = em.createNativeQuery("select sum(po.quantity) from PRODUCTORDER po group by po.productid order by sum(po.quantity) desc").getResultList();

            List<Product> productSold = new ArrayList<>();

            for (Integer pID : sold) {
                productSold.add(productService.findProductByID(pID));
            }

            session.setAttribute("productSold", productSold);
            session.setAttribute("soldQty", soldQty);            
            response.sendRedirect("admin/topSoldReport.jsp");

        } catch (Exception e) {
            e.printStackTrace();
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
