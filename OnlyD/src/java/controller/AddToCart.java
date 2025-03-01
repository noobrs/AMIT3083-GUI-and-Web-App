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

public class AddToCart extends HttpServlet {

    @PersistenceContext
    EntityManager em;
    @Resource
    UserTransaction utx;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();

        try {

            CartService cartService = new CartService(em);
            int productId = Integer.parseInt(request.getParameter("productId"));
            int quantity = Integer.parseInt(request.getParameter("quantity"));
            boolean addedToCart = false;

            Customer cust = (Customer) session.getAttribute("customer");
            CustomerService custService = new CustomerService(em);
            ProductService productService = new ProductService(em);

            // cust logged in
            if (cust != null) {
                Product product = productService.findProductByID(productId);

                Productcart cartItem = new Productcart(new ProductcartPK(cust.getCustomerID(), productId));
                cartItem.setProduct(product);
                cartItem.setQuantity(quantity);
                List<Productcart> productcartList = cust.getProductcartList(); //  old cart list

                // check if product is in customer cart
                if (!productcartList.isEmpty()) {
                    for (Productcart existedPC : productcartList) {
                        // check stock
                        if (Integer.compare(existedPC.getProduct().getProductid(), cartItem.getProduct().getProductid()) == 0) {
                            int sum = existedPC.getQuantity() + quantity;

                            // total quantity > product stock
                            if (Integer.compare(sum, product.getStock()) > 0) {
//                                response.getWriter().println("not enough stock");
//                                return;
                                throw new IllegalArgumentException("Not enough stock!");
                            }
                        }
                    }
                }

                // check if input qty > stock
                if (quantity > product.getStock()) {
//                    response.getWriter().println("not enough stock");
//                    return;
                    throw new IllegalArgumentException("Not enough stock!");
                }

                utx.begin();
                addedToCart = cartService.addCart(cartItem);
                utx.commit();

                if (addedToCart) {

                    utx.begin();
                    cust = custService.findCustomerById(cust.getCustomerID());
                    em.refresh(cust);
                    cust.initializeProductcartList();
                    cust.initializeOrderList();
                    utx.commit();

                    session.setAttribute("customer", cust);
                    request.getRequestDispatcher("/ViewCart").forward(request, response);

                } else {
                    // if product addition failed
                    throw new IllegalArgumentException("Failed to add product to cart");
                }

            } else {

                session.setAttribute("actionMsg", "Not a user! Try to login");
                response.sendRedirect("ViewProduct");
            }

        } catch (IllegalArgumentException e) {
            session.setAttribute("actionMsg", e.getMessage());
            response.sendRedirect("ViewProduct");
        } 
        catch (Exception e) {
            response.getWriter().println("Invalid product ID");
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
