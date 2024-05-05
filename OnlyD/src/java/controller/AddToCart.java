/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controller;

import entity.Customer;
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
                
                Productcart cartItem = new Productcart(new ProductcartPK(cust.getCustomerID(), productId));
                cartItem.setProduct(new ProductService(em).findProductByID(productId));
                cartItem.setQuantity(quantity);
                List<Productcart> productcartList = cust.getProductcartList();

                boolean itemExisted = false;

                if (productcartList.size() > 1) {
                    for (Productcart existedPC : productcartList) {
                        if (Objects.equals(existedPC.getProduct().getProductid(), cartItem.getProduct().getProductid())) {
                            itemExisted = true;
                        }
                    }
                }

                productcartList.add(cartItem);

                utx.begin();
                addedToCart = cartService.addCart(cartItem);
                utx.commit();

                if (addedToCart) {
//                session.setAttribute("productcartList", productcartList);
//                response.sendRedirect("user/cart.jsp");
                    session.setAttribute("customer", cust); //just temp object, need to remove when combine
                    
                    request.getRequestDispatcher("/ViewCart").forward(request, response);

                } else {
                    // If product addition failed, handle the error (e.g., display an error message)
                    response.getWriter().println("Failed to add product to cart");
                }
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
