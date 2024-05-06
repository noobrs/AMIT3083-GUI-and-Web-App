/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import entity.Product;
import entity.Productorder;
import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;
import jakarta.persistence.TypedQuery;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;

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
//            List<Productorder> productorderList = em.createNamedQuery("Productorder.findAll", Productorder.class).getResultList();
//
//            List<Object[]> results = em.createQuery(
//                    "SELECT po.product, SUM(po.quantity) AS totalQuantity "
//                    + "FROM ProductOrder po "
//                    + "GROUP BY po.product "
//                    + "ORDER BY totalQuantity DESC")
//                    .setMaxResults(10) // Limit the results to the top 10
//                    .getResultList();
//
//            List<Product> topSoldProducts = new ArrayList<>();
//            for (Object[] result : results) {
//                Product product = (Product) result[0];
//                topSoldProducts.add(product);
//            }
//            
//            session.setAttribute("topSoldList", topSoldProducts);
//            response.sendRedirect("admin/topSoldReport.jsp");

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
