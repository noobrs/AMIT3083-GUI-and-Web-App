/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package service;

import entity.Productpromotion;
import entity.Promotion;
import jakarta.annotation.Resource;
import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;
import jakarta.persistence.Query;
import java.util.List;

/**
 *
 * @author danie
 */
public class PromotionService {

    @PersistenceContext
    EntityManager em;
    @Resource
    Query query;

    public PromotionService(EntityManager em) {
        this.em = em;
    }

    public void addPromotion(Promotion promotion) {
        em.persist(promotion);
    }

    public boolean addProductPromotion(List<Productpromotion> newProductpromoList) {

        Productpromotion temp;

        try {
            for (Productpromotion p : newProductpromoList) {
                temp = em.find(Productpromotion.class, p.getProductpromotionPK());

                if (temp == null) {
                    em.persist(p);
                } else {
                    return false;
                }
            }
            return true;
        } catch (Exception e) {
            return false;
        }
    }

    public List<Productpromotion> getPromotionItemsByPromotionId(int promotionId) {

        List<Productpromotion> productpromotionList;
        try {
            productpromotionList = (List<Productpromotion>) em.createNamedQuery("Productpromotion.findByPromotionid")
                    .setParameter("promotionid", promotionId)
                    .getResultList();
        } catch (Exception e) {
            return null;
        }

        return productpromotionList;
    }
    
    public Promotion findActivePromotionByProductId(int productId){        
                
        List<Productpromotion> productpromoLists = em.createNamedQuery("Productpromotion.findByProductid", Productpromotion.class)
                .setParameter("productid", productId)
                .getResultList();
        
        if(!productpromoLists.isEmpty()){
            for(Productpromotion pp : productpromoLists){
                if(pp.getPromotion().getStatus() == Promotion.ACTIVE_STATUS){
                    return pp.getPromotion();
                }
            }
        }
        return null;
    }
    
//    public List<Promotion> findActivePromotions(){
//        List<Promotion> promoLists;
//        try {
//            promoLists = em.createNamedQuery("Promotion.findByStatus", Promotion.class)
//                    .setParameter("status", Promotion.ACTIVE_STATUS)
//                    .getResultList();
//            
//        } catch (Exception e) {
//            e.printStackTrace();
//            return null;
//        }
//        return promoLists;
//    }

    public List<Productpromotion> getPromotionItemsByProductId(int productId) {

        List<Productpromotion> productpromotionList;
        try {
            productpromotionList = (List<Productpromotion>) em.createNamedQuery("Productpromotion.findByProductid")
                    .setParameter("promotionid", productId)
                    .getResultList();
        } catch (Exception e) {
            return null;
        }

        return productpromotionList;
    }

    public Promotion findPromotionByPromotionId(Integer promotionid) {
        Promotion promotion;
        try {
            promotion = (Promotion) em.createNamedQuery("Promotion.findByPromotionID")
                    .setParameter("promotionid", promotionid)
                    .setParameter("deletedStatus", Promotion.DELETED_STATUS)
                    .getSingleResult();
        } catch (Exception e) {
            return null;
        }

        return promotion;
    }

    public boolean deletePromotion(Integer promotionid) {
        Promotion promotion = this.findPromotionByPromotionId(promotionid);
        if (promotion != null) {
            em.remove(promotion);
            return true;
        }
        return false;
    }

    public boolean updatePromotion(Promotion promotion) {
        Promotion tempPromotion = this.findPromotionByPromotionId(promotion.getPromotionid());
        if (tempPromotion != null) {
            tempPromotion.setDiscountpercentage(promotion.getDiscountpercentage());
            tempPromotion.setStartdatetime(promotion.getStartdatetime());
            tempPromotion.setEnddatetime(promotion.getEnddatetime());
            tempPromotion.setStatus(promotion.getStatus());
            return true;
        }
        return false;
    }

    public List<Promotion> findAllWithDeletedStatus() {
        List<Promotion> promotionList;
        try {
            promotionList = em.createNamedQuery("Promotion.findAllWithDeletedStatus")
                    .getResultList();
        } catch (Exception e) {
            return null;
        }
        return promotionList;
    }

    public List<Promotion> findAll() {
        List<Promotion> promotionList;
        try {
            promotionList = em.createNamedQuery("Promotion.findAll")
                    .setParameter("deletedStatus", Promotion.DELETED_STATUS)
                    .getResultList();
        } catch (Exception e) {
            return null;
        }
        return promotionList;
    }
}
