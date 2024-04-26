/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package service;

import entity.Customer;
import jakarta.annotation.Resource;
import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;
import jakarta.persistence.Query;
import java.util.List;

public class CustomerService {
    
    @PersistenceContext
    EntityManager em;
    @Resource
    Query query;

    public CustomerService(EntityManager em) {
        this.em = em;
    }
    
    public void addCustomer(Customer customer){
        em.persist(customer);              
    }
    
    public Customer findCustomerById(int id){
        Customer cust = em.find(Customer.class, id);
        return cust;
    }
    
    public Customer findCustomerByUsername(String username){
        Customer cust;
        try {
            cust = (Customer)em.createNamedQuery("Customer.findByUsername").setParameter("username", username).getSingleResult();
        } catch (Exception e) {
            return null;
        }
        
        return cust;
    }
    
    public Customer findCustomerByEmail(String email){
        Customer cust;
        
        try {
            cust = (Customer)em.createNamedQuery("Customer.findByEmail").setParameter("email", email).getSingleResult();
        } catch (Exception e) {
            return null;
        }
        
        return cust;
    }
    
    public Customer findCustomerByPhoneNumber(String phoneNumber){
        Customer cust;
        
        try {
            cust = (Customer)em.createNamedQuery("Customer.findByPhoneNumber").setParameter("phoneNumber", phoneNumber).getSingleResult();
        } catch (Exception e) {
            return null;
        }
        return cust;
    }
    
    public boolean deleteCustomer(int id){
        Customer cust = this.findCustomerById(id);
        if(cust != null){
            em.remove(cust);
            return true;
        }        
        return false;
    }
    
    public boolean updateCustomer(Customer customer){
        Customer tempCust = this.findCustomerById(customer.getCustomerID());
        if(tempCust != null){
            tempCust.setEmail(customer.getEmail());
            tempCust.setName(customer.getEmail());
            tempCust.setPassword(customer.getPassword());
            tempCust.setPhoneNumber(customer.getPhoneNumber());
            tempCust.setUsername(customer.getUsername());
            return true;
        }
        return false;
    }
    
    public List<Customer> findAll() {
        List<Customer> customerList = em.createNamedQuery("Customer.findAll").getResultList();
        return customerList;
    }
}
