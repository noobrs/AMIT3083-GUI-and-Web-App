/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package service;

import entity.Orders;
import entity.Productorder;
import jakarta.annotation.Resource;
import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;
import jakarta.persistence.Query;
import java.util.List;

public class OrderService {

    @PersistenceContext
    EntityManager mgr;
    @Resource
    Query query;

    public OrderService(EntityManager mgr) {
        this.mgr = mgr;
    }

    public List<Orders> findAll() {
        List<Orders> orderList = mgr.createNamedQuery("Orders.findAll").getResultList();

        return orderList;
    }

    public boolean addOrder(Orders order) {
        mgr.persist(order);
        return true;
    }

    public boolean addProductOrder(Productorder productorder) {
        mgr.persist(productorder);
        return true;
    }

    public Orders findOrderByID(int id) {
        Orders order = mgr.find(Orders.class, id);
        return order;
    }

    public Productorder findProductOrderByID(int id) {
        Productorder productorder = mgr.find(Productorder.class, id);
        return productorder;
    }
}
