/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

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
import service.ProductService; // Import ProductService

@WebServlet(name = "Checkout", urlPatterns = {"/Checkout"})
public class Checkout extends HttpServlet {
    @PersistenceContext
    EntityManager em;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            HttpSession session = request.getSession();
            session.setAttribute("errorMessage", null);
            List<Productcart> productcartList = (List<Productcart>) session.getAttribute("productcartList");
            String[] selectedProductIds = request.getParameterValues("selectedProducts");
            System.out.println("getParam: " + selectedProductIds.toString());

            if (selectedProductIds != null && selectedProductIds.length > 0) {
                
                // Check if any selected product quantity exceeds available stock
                for (String productId : selectedProductIds) {
                    // Add logging statement to check selected product IDs
        System.out.println("Selected Product ID(Checkout): " + productId);
                    int selectedProductId = Integer.parseInt(productId);
                    for (Productcart cartItem : productcartList) {
                        Product product = cartItem.getProduct();
                        if (product.getProductid() == selectedProductId) {
                            int cartQuantity = cartItem.getQuantity();
                            int availableQuantity = getProductQuantity(request, selectedProductId); // Get product quantity from product service
                            if (cartQuantity > availableQuantity) {
                                String errorMessage = "Not enough stock for " + product.getName() + ". Quantity in cart: " + cartQuantity + ", Available quantity: " + availableQuantity;
                                session.setAttribute("errorMessage", errorMessage);
                                response.sendRedirect("user/cart.jsp");
                                return;
                            }
                            break; // Break the loop once the product is found
                        }
                    }
                }
            }

            // If all selected items pass the validation, proceed to the checkout page
            response.sendRedirect("checkout.jsp");

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("error.jsp");
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

