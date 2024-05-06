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
import java.util.Objects;
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

        try {
            HttpSession session = request.getSession();
            CartService cartService = new CartService(em);
            int productId = Integer.parseInt(request.getParameter("productId"));
            int quantity = Integer.parseInt(request.getParameter("quantity"));
            boolean addedToCart = false;

            Customer cust = (Customer) session.getAttribute("customer");

            // cust logged in
            if (cust != null) {
                Product product = new ProductService(em).findProductByID(productId);

                Productcart cartItem = new Productcart(new ProductcartPK(cust.getCustomerID(), productId));
                cartItem.setProduct(product);
                cartItem.setQuantity(quantity);
                List<Productcart> productcartList = cust.getProductcartList(); //  old cart list

                if (!productcartList.isEmpty()) {
                    for (Productcart existedPC : productcartList) {
                        if (Integer.compare(existedPC.getProduct().getProductid(), cartItem.getProduct().getProductid()) == 0) {
                            int sum = existedPC.getQuantity() + quantity;
                            if (Integer.compare(sum, product.getStock()) > 0) {
                                response.getWriter().println("not enough stock");
                                return;
                            }
                        }
                    }
                }

                utx.begin();
                addedToCart = cartService.addCart(cartItem);
                utx.commit();

                if (addedToCart) {

                    utx.begin();
                    cust = em.find(Customer.class, cust.getCustomerID());
                    em.refresh(cust);
                    utx.commit();

                    session.setAttribute("customer", cust); //just temp object, need to remove when combine

                    request.getRequestDispatcher("/ViewCart").forward(request, response);

                } else {
                    // If product addition failed, handle the error (e.g., display an error message)
                    response.getWriter().println("Failed to add product to cart");
                }

//                // check if current stock is enough
//                if (product.getStock() >= quantity) {
//
//                } else {
//                    response.getWriter().println("not enough stock");
//                }
            } else{
                session.setAttribute("statusMsg", "Try to login to add to cart!");
                request.getRequestDispatcher("login.jsp").forward(request, response);
            }

        } catch (NumberFormatException e) {
            // Handle invalid product ID parameter
            response.getWriter().println("Invalid product ID");
            e.printStackTrace();
        } catch (Exception e) {
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
