/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import entity.Customer;
import entity.Product;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;
import entity.Productcart;
import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;
import java.util.ArrayList;
import service.CartService;
import service.ProductService; // Import ProductService

@WebServlet(name = "Checkout", urlPatterns = {"/Checkout"})
public class Checkout extends HttpServlet {

    @PersistenceContext
    EntityManager em;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();

        try {
//            session.setAttribute("errorMessage", null);
            List<Productcart> productcartList = (List<Productcart>) session.getAttribute("productcartList");
            String[] selectedProductIds = request.getParameterValues("selectedProducts");
            List<Productcart> selected = new ArrayList<>();

            if (selectedProductIds != null && selectedProductIds.length > 0) {

                // Check if any selected product quantity exceeds available stock
                for (String productId : selectedProductIds) {

                    int selectedProductId = Integer.parseInt(productId);

                    for (Productcart cartItem : productcartList) {

                        Product product = cartItem.getProduct();

                        if (product.getProductid() == selectedProductId) {

                            int cartQuantity = cartItem.getQuantity();
                            int availableQuantity = getProductQuantity(request, selectedProductId); // Get product quantity from product service

                            if (cartQuantity > availableQuantity) {

                                throw new IllegalArgumentException("Not enough stock for " + product.getName() + ". Quantity in cart: " + cartQuantity + ", Available quantity: " + availableQuantity);
                            }
                            selected.add(cartItem);
                            break; // Break the loop once the product is found
                        }
                    }
                }
                // If all selected items pass the validation, proceed to the checkout page
                session.setAttribute("selectedCartItem", selected);
                response.sendRedirect("user/checkout.jsp");
            } else {
                session.setAttribute("errorMessage", "No product selected!");
                response.sendRedirect("ViewCart");
            }

        } catch (IllegalArgumentException e) {
            session.setAttribute("errorMessage", e.getMessage());
            response.sendRedirect("ViewCart");
        } catch (Exception e) {
            e.printStackTrace();
            session.setAttribute("errorMessage", e.getMessage());
            response.sendRedirect("ViewCart");
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

    // Method to retrieve product quantity from product service
    private int getProductQuantity(HttpServletRequest request, int productId) {
        // Retrieve the product service instance from session or inject it into the servlet
        ProductService productService = new ProductService(em);

        // Use the product service to get the product quantity
        int quantity = productService.getProductQuantity(productId);

        return quantity;
    }

}
