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
import service.ProductService;

/**
 *
 * @author GIGABYTE
 */
public class SearchProduct extends HttpServlet {
    
    @PersistenceContext
    EntityManager em;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       try {
            ProductService productService = new ProductService(em);
            HttpSession session = request.getSession();
            String code = (String) session.getAttribute("productId");
            int id = Integer.parseInt(code);
            String button = (String) session.getAttribute("productButton");

            Product product = productService.findProductByID(id);
//            Category category = product.getCategoryid();
            Staff staff = product.getStaffid();
            session.setAttribute("product", product);
//            session.setAttribute("category", category);
            //session.setAttribute("staff", staff);
            if (button.equals("Delete")) {
                response.sendRedirect("staff/deleteProductConfirmation.jsp");
            } else {
                session.setAttribute("path","staff/updateProductConfirmation.jsp");
                response.sendRedirect("GetCategoryForProduct");
            }
  
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
