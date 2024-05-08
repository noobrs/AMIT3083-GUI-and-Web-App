/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import entity.Orders;
import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import service.OrderService;

/**
 *
 * @author Vin Sen
 */
public class ProcessSales extends HttpServlet {

    @PersistenceContext
    EntityManager em;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, ParseException {

        HttpSession session = request.getSession();
        OrderService orderService = new OrderService(em);

        try {
            SimpleDateFormat dailyFormat = new SimpleDateFormat("dd-MM-yyyy");
            SimpleDateFormat monthFormat = new SimpleDateFormat("MM-yyyy");
            SimpleDateFormat yearFormat = new SimpleDateFormat("yyyy");

            List<Orders> orderList = orderService.findAll();
            List<String> dailyList = new ArrayList<>();
            List<String> monthList = new ArrayList<>();
            List<String> yearList = new ArrayList<>();

            for (Orders o : orderList) {
                if (!dailyList.contains(dailyFormat.format(o.getOrderdatetime()))) {
                    dailyList.add(dailyFormat.format(o.getOrderdatetime()));
                }

                if (!monthList.contains(monthFormat.format(o.getOrderdatetime()))) {
                    monthList.add(monthFormat.format(o.getOrderdatetime()));
                }
                if (!yearList.contains(yearFormat.format(o.getOrderdatetime()))) {
                    yearList.add(yearFormat.format(o.getOrderdatetime()));
                }
            }

            session.setAttribute("dailyList", dailyList);
            session.setAttribute("monthList", monthList);
            session.setAttribute("yearList", yearList);
            response.sendRedirect("admin/selectSalesRecord.jsp");

        } catch (Exception e) {
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (ParseException ex) {
            Logger.getLogger(ProcessSales.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (ParseException ex) {
            Logger.getLogger(ProcessSales.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

}
