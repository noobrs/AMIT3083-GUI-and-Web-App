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
import service.CartService;
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
        CartService cartService = new CartService(em);

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
                Productorder po = new Productorder(tempOrderId, id, productcart.getQuantity());
                p.setStock(p.getStock() - productcart.getQuantity());
                utx.begin();
                productService.updateProduct(p);
                orderService.addProductOrder(po);
                utx.commit();
            }

            utx.begin();
            for (Productcart pc : selected) {
                boolean removed = cartService.removeCartItem(cust.getCustomerID(), pc.getProduct().getProductid());
                if (!removed) {
                    response.getWriter().println("unable to remove");
                }
            }
            utx.commit();
            utx.begin();
            cust = em.find(Customer.class, cust.getCustomerID());
            em.refresh(cust);
            utx.commit();

            response.sendRedirect("payment.jsp");

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

//private void removeFromCart(HttpServletRequest request, HttpServletResponse response) throws IOException{
//        try {
//            HttpSession session = request.getSession();
//            CartService cartService = new CartService(em);
//            int productId = Integer.parseInt(request.getParameter("productId"));
//
//            Customer cust = (Customer) session.getAttribute("customer");
//
//            // Check if the customer is logged in
//            if (cust != null) {
//                utx.begin();
//                boolean removed = cartService.removeCartItem(cust.getCustomerID(), productId);
//
//                if (removed) {
//                    utx.commit(); // Commit the transaction
//
//                    utx.begin();
//                    cust = em.find(Customer.class, cust.getCustomerID());
//                    em.refresh(cust);
//                    utx.commit();
//
//                    // Redirect back to the cart page
//                    response.sendRedirect("ViewCart");
//                } else {
//                    // If removal failed, handle the error
//                    response.getWriter().println("Failed to remove product from cart");
//                }
//            } else {
//                // If the customer is not logged in, redirect to the login page
//                session.setAttribute("statusMsg", "Not a user, try to login!");
//                response.sendRedirect("login.jsp");
//            }
//        } catch (NumberFormatException e) {
//            // Handle invalid product ID parameter
//            response.getWriter().println("Invalid product ID");
//            e.printStackTrace();
//        } catch (Exception e) {
//            // Handle other exceptions
//            response.getWriter().println("Error processing the request");
//            e.printStackTrace();
//        }
//    }
}
