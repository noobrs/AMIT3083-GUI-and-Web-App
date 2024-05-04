/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package service;

import entity.Productcart;
import entity.ProductcartPK;
import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;
import jakarta.persistence.TypedQuery;

import java.util.List;

public class CartService {

    @PersistenceContext
    private EntityManager em;

    public CartService(EntityManager em) {
        this.em = em;
    }

    public boolean addToCart(Productcart cartItem) {

        try {
            em.persist(cartItem);
            return true;
        } catch (Exception e) {
            return false;

        }
    }

    public List<Productcart> getCartItems(int customerId) {
//        TypedQuery<Productcart> query = em.createQuery("SELECT c FROM Productcart c WHERE c.productcartPK.customerid = :customerId", Productcart.class);
//        query.setParameter("customerId", customerId);
//        return query.getResultList();
        List<Productcart> productcartList;
        try {
            productcartList = (List<Productcart>) em.createNamedQuery("Productcart.findByCustomerid")
                    .setParameter("customerid", customerId)
                    .getResultList();
        } catch (Exception e) {
            return null;
        }

        return productcartList;

    }

    public boolean addCartItemQuantity(Productcart existedCartItem) {
        try {
            Productcart cartItem = em.find(Productcart.class, existedCartItem.getProductcartPK());
            if (cartItem != null) {
                cartItem.setQuantity(cartItem.getQuantity() + existedCartItem.getQuantity());
                return true;
            }
            return false;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

//    public boolean updateCartItemQuantity(int customerId, int productId, int newQuantity) {
//        try {
//            Productcart cartItem = em.find(Productcart.class, new ProductcartPK(customerId, productId));
//            if (cartItem != null) {
//                cartItem.setQuantity(newQuantity);
//                return true;
//            }
//            return false;
//        } catch (Exception e) {
//            e.printStackTrace();
//            return false;
//        }
//    }
    public void updateCartItems(List<Productcart> cartItems) {
        for (Productcart cartItem : cartItems) {
            em.merge(cartItem); // Use merge to update existing entities
        }
    }

    public boolean removeCartItem(int customerId, int productId) {
        try {
            Productcart cartItem = em.find(Productcart.class, new ProductcartPK(customerId, productId));
            if (cartItem != null) {
                em.remove(cartItem);
                return true;
            }
            return false;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }
}
