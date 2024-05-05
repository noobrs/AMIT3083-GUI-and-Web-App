/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package service;

import entity.Product;
import entity.Productorder;
import entity.Orders;
import jakarta.annotation.Resource;
import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;
import jakarta.persistence.Query;
import jakarta.persistence.TypedQuery;
import java.util.List;

public class OrderService {
 
    @PersistenceContext
    EntityManager mgr;
    @Resource
    Query query;
    
    public OrderService(EntityManager mgr) {
        this.mgr = mgr;
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
    
    public List<Productorder> findByOrderid(int id) {
        TypedQuery<Productorder> productList = mgr.createNamedQuery("Productorder.findByOrderid",Productorder.class);
        productList.setParameter("id",id);
        return productList.getResultList();
    }
}
