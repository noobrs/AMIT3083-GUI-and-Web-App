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
import service.ProductService;

/**
 *
 * @author GIGABYTE
 */
public class AddProduct extends HttpServlet {

    @PersistenceContext
    EntityManager em;
    @Resource
    UserTransaction utx;


    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            String name = request.getParameter("name");

            String priceStr = request.getParameter("price");
            double price = Double.parseDouble(priceStr);

            String stockStr = request.getParameter("stock");
            int stock = Integer.parseInt(stockStr);

            String description = request.getParameter("description");
            
            String image = "../image/img_" + request.getParameter("imgId") +".jpg";
            
            int status = 1;

            String categoryidStr = request.getParameter("categoryid");
            int cid = Integer.parseInt(categoryidStr);
            Category categoryid = new Category(cid);

            String sid = request.getParameter("staffid");
            Staff staffid = new Staff(sid);

            Product product = new Product(name, price, stock, description, image, status, categoryid, staffid);
            ProductService productService = new ProductService(em);
            utx.begin();
            boolean success = productService.addProduct(product);
            utx.commit();
            HttpSession session = request.getSession();
            session.setAttribute("successAddProduct", success);
            response.sendRedirect("staff/addProductConfirm.jsp");
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
