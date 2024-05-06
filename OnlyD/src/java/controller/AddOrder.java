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
import entity.Promotion;
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
import service.PromotionService;

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
        String button = request.getParameter("orderButton");
        List<Productcart> selected = (List<Productcart>) session.getAttribute("selectedCartItem");
        Customer cust = (Customer) session.getAttribute("customer");
        ProductService productService = new ProductService(em);
        OrderService orderService = new OrderService(em);
        CartService cartService = new CartService(em);
        PromotionService promoService = new PromotionService(em);

        try {

            String paymentType = request.getParameter("paymentType");
            String cardStatus = request.getParameter("cardStatus");

            // select card and havent go to carPayment page
            if (paymentType.equals("card") && cardStatus == null) {
                
                response.sendRedirect("user/cardPayment.jsp");
                
            } else {
                String address = request.getParameter("sAddress1");
                String state = request.getParameter("sState");
                String city = request.getParameter("sCity");
                String postCode = request.getParameter("sPostCode");

                String fullAddress = address + "<br>" + city + ", " + postCode + ", " + state;
                Date currentDate = new Date();
                Double subtotal = (Double)session.getAttribute("subtotal");
                Double discount = (Double)session.getAttribute("totaldiscount");
                Double shippingfee = (Double)session.getAttribute("shippingfee");
                Double total = (Double)session.getAttribute("total");
                Promotion promoApplied = (Promotion) session.getAttribute("promoApplied");
                
                Orders order = new Orders(currentDate, address, paymentType, subtotal, discount, shippingfee, total, cust);

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

                if (promoApplied != null) {
                    int currentQty = promoApplied.getRedemptionquantity() - 1;
                    promoApplied.setRedemptionquantity(currentQty);
                    if (currentQty == 0) {
                        promoApplied.setStatus(Promotion.REDEEMED_STATUS);
                    }
                    boolean success = promoService.updatePromotion(promoApplied);
                }

                utx.commit();

                session.removeAttribute("promoApplied");
                response.sendRedirect("payment.jsp");
            }

        } catch (Exception e) {
            response.getWriter().println(e.getMessage());
        }

    }

    protected void processPromoCode(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();

        try {
            String promoCode = request.getParameter("promoCodeEntered");
            PromotionService promoService = new PromotionService(em);

            Promotion promotion = promoService.findPromotionByPromotionCode(promoCode);
            if (promotion != null) {
                if (promotion.getStatus() == Promotion.ACTIVE_STATUS) {

//                    int currentQty = promotion.getRedemptionquantity() - 1;
//                    promotion.setRedemptionquantity(currentQty);
//                    if (currentQty == 0) {
//                        promotion.setStatus(Promotion.REDEEMED_STATUS);
//                    }
                    session.setAttribute("promoApplied", promotion);
                    response.sendRedirect("user/checkout.jsp");

//                    utx.begin();
//                    boolean success = promoService.updatePromotion(promotion);
//                    utx.commit();
//
//                    if (success) {
//
//                    } else {
//                        response.getWriter().println("fail");
//                    }
                } else {

                    response.getWriter().println("promo not same");
                }
            } else {

                response.getWriter().println("promo null");
            }

        } catch (Exception e) {
            e.printStackTrace();
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
