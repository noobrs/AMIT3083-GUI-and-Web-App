/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import entity.Customer;
import entity.Orders;
import entity.Product;
import entity.Productcart;
import entity.Productorder;
import jakarta.annotation.Resource;
import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.transaction.UserTransaction;
import java.util.Date;
import java.util.List;
import service.OrderService;
import service.ProductService;

/**
 *
 * @author GIGABYTE
 */
public class AddOrder extends HttpServlet {

    @PersistenceContext
    EntityManager em;
    @Resource
    UserTransaction utx;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        List<Productcart> selected = (List<Productcart>) session.getAttribute("selectedCartItem");
        Customer cust = (Customer) session.getAttribute("customer");
        ProductService productService = new ProductService(em);
        OrderService orderService = new OrderService(em);

        try {

            Date currentDate = new Date();
            String address = request.getParameter("address");
            String paymenttype = request.getParameter("paymentMethod");
            Double subtotal = Double.valueOf(request.getParameter("subtotal"));
            Double discount = Double.valueOf(request.getParameter("totaldiscount"));
            Double shippingfee = Double.valueOf(request.getParameter("shippingfee"));
            Double total = Double.valueOf(request.getParameter("total"));

            Orders order = new Orders(currentDate, address, paymenttype, subtotal, discount, shippingfee, total, cust);

            utx.begin();
            orderService.addOrder(order);
            utx.commit();

            int tempOrderId = order.getOrderid();

            for (Productcart productcart : selected) {
                Product tempP = productcart.getProduct();
                int id = tempP.getProductid();
                Product p = productService.findProductByID(id);
                Productorder po = new Productorder(tempOrderId,id,productcart.getQuantity());
                p.setStock(p.getStock() - productcart.getQuantity());
                utx.begin();
                productService.updateProduct(p);
                orderService.addProductOrder(po);
                utx.commit();
            }
                
            response.sendRedirect("tempPayment.jsp");
            
        } catch (Exception e) {
            response.getWriter().println(e.getMessage());
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
