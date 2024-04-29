/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import entity.Category;
import entity.Product;
import entity.Staff;
import exception.NegativeException;
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
public class UpdateProduct extends HttpServlet {

    @PersistenceContext
    EntityManager em;
    @Resource
    UserTransaction utx;
    
    String errorMsg = null;
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            String name = request.getParameter("name");
            if (name == null || name.isEmpty()) {
                throw new NullPointerException("Name cannot be empty");
            }

            String priceStr = request.getParameter("price");
            if (priceStr == null || priceStr.isEmpty()) {
                throw new NullPointerException("Price cannot be empty");
            }
            double price = Double.parseDouble(priceStr);
            if( price <= 0){
                throw new NegativeException("Price cannot be zero or negative");
            }
            
            String stockStr = request.getParameter("stock");
            if (stockStr == null || stockStr.isEmpty()) {
                throw new NullPointerException("Stock cannot be empty");
            }
            int stock = Integer.parseInt(stockStr);
            if( stock <= 0){
                throw new NegativeException("Stock cannot be negative");
            }

            String description = request.getParameter("description");
            if (description == null || description.isEmpty()) {
                throw new NullPointerException("Description cannot be empty");
            }

            String image = request.getParameter("image");
            if (image == null || image.isEmpty()) {
                throw new NullPointerException("Image cannot be empty");
            }
            
            int status = Integer.parseInt(request.getParameter("status"));

            String categoryidStr = request.getParameter("categoryid");
            if (categoryidStr == null || categoryidStr.isEmpty()) {
                throw new NullPointerException("Category ID cannot be empty");
            }
            int cid = Integer.parseInt(categoryidStr);
            Category categoryid = new Category(cid);

            String sid = request.getParameter("staffid");
            if (sid == null || sid.isEmpty()) {
                throw new NullPointerException("Staff ID cannot be empty");
            }
            Staff staffid = new Staff(sid);
            HttpSession session = request.getSession();
            String code = (String) session.getAttribute("id");
            int id = Integer.parseInt(code);
            
            ProductService productService = new ProductService(em);
            Product product = new Product(id, name, price, stock, description, image, status, categoryid, staffid);

            utx.begin();
            boolean success = productService.updateProduct(product);
            utx.commit();

            session.setAttribute("success", success);
            response.sendRedirect("staff/updateProductConfirm.jsp");

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
