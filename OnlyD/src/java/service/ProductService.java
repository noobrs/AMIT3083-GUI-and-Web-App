/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package service;

import entity.Product;
import entity.Category;
import jakarta.annotation.Resource;
import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;
import jakarta.persistence.Query;
import jakarta.persistence.TypedQuery;
import java.util.List;

/**
 *
 * @author GIGABYTE
 */
public class ProductService {

    @PersistenceContext
    EntityManager mgr;
    @Resource
    Query query;

    public ProductService(EntityManager mgr) {
        this.mgr = mgr;
    }

    public boolean addProduct(Product product) {
        mgr.persist(product);
        return true;
    }

    public Product findProductByID(int id) {
        Product product = mgr.find(Product.class, id);
        return product;
    }

    public boolean deleteProduct(int id) {
        Product tempProduct = findProductByID(id);
        if (tempProduct != null) {
            tempProduct.setStatus(0);
            return true;
        }
        return false;
    }

    public List<Product> findAll() {
        List productList = mgr.createNamedQuery("Product.findAll").getResultList();
        return productList;
    }

    public List<Product> findByStatus(int status) {
        TypedQuery<Product> productList = mgr.createNamedQuery("Product.findByStatus",Product.class);
        productList.setParameter("status",status);
        return productList.getResultList();
    }
    
    public List<Product> findByNamePrefix(String prefix, int status) {
        TypedQuery<Product> productList = mgr.createNamedQuery("Product.findByNamePrefix",Product.class);
        productList.setParameter("prefix",prefix + "%");
        productList.setParameter("status",status);
        return productList.getResultList();
    }
    
    public List<Product> findByCatPrefix(String prefix, int status, Category id) {
        TypedQuery<Product> productList = mgr.createNamedQuery("Product.findByCatPrefix",Product.class);
        productList.setParameter("prefix",prefix + "%");
        productList.setParameter("status",status);
        productList.setParameter("categoryid",id);
        return productList.getResultList();
    }


    public boolean updateProduct(Product product) {
        Product tempProduct = findProductByID(product.getProductid());
        if (tempProduct != null) {
            tempProduct.setName(product.getName());
            tempProduct.setStock(product.getStock());
            tempProduct.setDescription(product.getDescription());
            tempProduct.setPrice(product.getPrice());
            tempProduct.setImage(product.getImage());
            tempProduct.setStatus(product.getStatus());
            tempProduct.setCategoryid(product.getCategoryid());
            tempProduct.setStaffid(product.getStaffid());
            return true;
        }
        return false;
    }
}
