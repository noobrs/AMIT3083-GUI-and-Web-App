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

        HttpSession session = request.getSession();

        try {
            int productId = Integer.parseInt(request.getParameter("productId"));
            boolean addedToCart = false;

            CustomerService custService = new CustomerService(em);
            CartService cartService = new CartService(em);
            int quantity = Integer.parseInt(request.getParameter("quantity"));

            //// vinsen part
            Customer cust = (Customer) session.getAttribute("customer");
            if (cust != null) {
                Productcart cartItem = new Productcart(new ProductcartPK(cust.getCustomerID(), productId));
                cartItem.setProduct(new ProductService(em).findProductByID(productId));
                cartItem.setQuantity(quantity);
                List<Productcart> productcartList = cust.getProductcartList();
                productcartList.add(cartItem);

                boolean itemExisted = false;

                utx.begin();
                System.out.println(productcartList.size());
                if (productcartList.size() > 1) {
                    for (Productcart existedPC : productcartList) {
                        if (Objects.equals(existedPC.getProduct().getProductid(), cartItem.getProduct().getProductid())) {
                            itemExisted = true;
                        }
                    }
                }

                if (itemExisted) {
                    addedToCart = cartService.addCartItemQuantity(cartItem);
                } else {
                    addedToCart = cartService.addToCart(cartItem);
                }
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
