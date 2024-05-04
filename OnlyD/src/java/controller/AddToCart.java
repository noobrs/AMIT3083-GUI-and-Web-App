/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controller;

import entity.Customer;
import entity.Product;
import entity.Productcart;
import entity.ProductcartPK;
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
import java.util.List;
import service.CartService;
import service.CustomerService;
import service.ProductService;

/**
 * Servlet implementation class AddToCart
 */
public class AddToCart extends HttpServlet {

    @PersistenceContext
    EntityManager em;
    @Resource
    UserTransaction utx;
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        HttpSession session = request.getSession();
        
        try {
            // Retrieve the product ID from the request parameter
            int productId = Integer.parseInt(request.getParameter("productId"));
            
            // Retrieve the customer ID from the session (replace "customerIdKey" with your actual session attribute key)
            //int customerId = (int) request.getSession().getAttribute("customerIdKey");
         
            //// vinsen part
//            Customer customer = (Customer) session.getAttribute("customer");
//            if(customer != null){
//                int customerId = customer.getCustomerID();
//            }
            
            int customerId = 2;
            CustomerService custService = new CustomerService(em);
            Customer cust = custService.findCustomerById(customerId);
            
            // Define a default quantity (you can adjust this as needed)
            int quantity = 1;
            
            // Assuming you have a CartService class for managing cart-related operations
            CartService cartService = new CartService(em);
            
            // Add the product to the cart
            Productcart cartItem = new Productcart(new ProductcartPK(customerId, productId));
            cartItem.setProduct(new ProductService(em).findProductByID(productId));
            cartItem.setQuantity(quantity);
            
            
            List<Productcart> productcartList = cust.getProductcartList();
            productcartList.add(cartItem);
            
            
            utx.begin();
            boolean addedToCart = cartService.addToCart(cartItem);
            utx.commit();
            
            if (addedToCart) {
                // If product successfully added to cart, redirect to the Cart.jsp page
//                session.setAttribute("productcartList", productcartList);
//                response.sendRedirect("user/cart.jsp");
                    session.setAttribute("customer", cust); //just temp object, need to remove when combine
                    request.getRequestDispatcher("/ViewCart").forward(request, response);

            } else {
                // If product addition failed, handle the error (e.g., display an error message)
                response.getWriter().println("Failed to add product to cart");
            }
        } catch (NumberFormatException e) {
            // Handle invalid product ID parameter
            response.getWriter().println("Invalid product ID");
        }catch (Exception e){
            response.getWriter().println("Invalid product ID");
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
