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
            cust = (Customer)em.createNamedQuery("Customer.findByUsername")
                    .setParameter("username", username)
                    .setParameter("deletedStatus", Customer.DELETED_STATUS)
                    .getSingleResult();
        } catch (Exception e) {
            return null;
        }
        
        return cust;
    }
    
    public Customer findCustomerByEmail(String email){
        Customer cust;
        
        try {
            cust = (Customer)em.createNamedQuery("Customer.findByEmail")
                    .setParameter("email", email)
                    .setParameter("deletedStatus", Customer.DELETED_STATUS)
                    .getSingleResult();
        } catch (Exception e) {
            return null;
        }
        
        return cust;
    }
    
    public Customer findCustomerByPhoneNumber(String phoneNumber){
        Customer cust;
        
        try {
            cust = (Customer)em.createNamedQuery("Customer.findByPhoneNumber")
                    .setParameter("phoneNumber", phoneNumber)
                    .setParameter("deletedStatus", Customer.DELETED_STATUS)
                    .getSingleResult();
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
            tempCust.setName(customer.getName());
            tempCust.setPassword(customer.getPassword());
            tempCust.setPhoneNumber(customer.getPhoneNumber());
            tempCust.setUsername(customer.getUsername());
            tempCust.setStatus(customer.getStatus());
            return true;
        }
        return false;
    }
    
    public List<Customer> findAll() {
        List<Customer> customerList;
        
        try {
            customerList = em.createNamedQuery("Customer.findAll")
                .setParameter("deletedStatus", Customer.DELETED_STATUS)
                .getResultList();
        } catch (Exception e) {
            return null;
        }
        
        return customerList;
    }
}
