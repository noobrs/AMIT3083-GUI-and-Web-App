/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import entity.Orders;
import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import service.OrderService;

/**
 *
 * @author Vin Sen
 */
public class ViewSalesReport extends HttpServlet {

    @PersistenceContext
    EntityManager em;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        OrderService orderService = new OrderService(em);

        try {
            session.removeAttribute("day");
            session.removeAttribute("month");
            session.removeAttribute("year");
            session.removeAttribute("foundOrderList");

            String requestDay = request.getParameter("day");
            String requestMonth = request.getParameter("month");
            String requestYear = request.getParameter("year");

            List<Orders> foundOrderList = new ArrayList<>();

            if (requestDay != null) {

                SimpleDateFormat dailyFormat = new SimpleDateFormat("dd-MM-yyyy");

                foundOrderList = em.createNamedQuery("Orders.findByOrderdatetime")
                        .setParameter("orderdatetime", dailyFormat.parse(requestDay))
                        .getResultList();

                session.setAttribute("day", requestDay);

            } else if (requestMonth != null) {

                int parsedMonth = Integer.parseInt(requestMonth, 0, 2, 10);
                int parsedYear = Integer.parseInt(requestMonth, 3, 7, 10);
//                List<Orders> orderList = orderService.findAll();
//
//                Calendar calendar = Calendar.getInstance();
                
                foundOrderList = em.createNamedQuery("Orders.findByOrderMonth")
                        .setParameter("year", parsedYear)
                        .setParameter("month", parsedMonth)
                        .getResultList();

//                for (Orders o : orderList) {
//                    calendar.setTime(o.getOrderdatetime());
//                    if ((calendar.get(Calendar.MONTH)+1 == parsedMonth) && (calendar.get(Calendar.YEAR) == parsedYear)) {
//                        foundOrderList.add(o);
//                    }
//                }

                session.setAttribute("month", requestMonth);

            } else if (requestYear != null) {

                foundOrderList = em.createNamedQuery("Orders.findByOrderYear")
                        .setParameter("year", Integer.valueOf(requestYear))
                        .getResultList();

                session.setAttribute("year", requestYear);

            }

            session.setAttribute("foundOrderList", foundOrderList);
            response.sendRedirect("admin/viewSalesReport.jsp");

        } catch (Exception e) {
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
