/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package service;

import entity.Promotion;
import jakarta.annotation.Resource;
import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;
import jakarta.persistence.Query;
import java.util.List;

/**
 *
 * @author Danie
 */
public class PromotionService {

    @PersistenceContext
    EntityManager em;
    @Resource
    Query query;

    public PromotionService(EntityManager em) {
        this.em = em;
    }

    public boolean addPromotion(Promotion promotion) {
        try {
            em.persist(promotion);
            return true;
        } catch (Exception e) {
            return false;
        }
    }

    public Promotion findPromotionByPromotionId(int promotionId) {
        Promotion promo = em.find(Promotion.class, promotionId);
        return promo;
    }

    public Promotion findPromotionByPromotionCode(String promoCode) {
        Promotion promo;
        try {
            promo = (Promotion) em.createNamedQuery("Promotion.findByPromotioncode")
                    .setParameter("promotioncode", promoCode)
                    .getSingleResult();
        } catch (Exception e) {
            return null;
        }

        return promo;
    }

    public List<Promotion> findByStatus(int status) {
        List<Promotion> promoList = em.createNamedQuery("Promotion.findByStatus")
                .setParameter("status", status)
                .getResultList();
        
        return promoList;
    }
    
    public List<Promotion> findWithoutSelectedStatus(int status){
        List<Promotion> promoList = em.createNamedQuery("Promotion.findAllWithoutStatus")
                .setParameter("status", status)
                .getResultList();
        
        return promoList;
    }

    public boolean updatePromotion(Promotion promotion) {
        Promotion temp = this.findPromotionByPromotionId(promotion.getPromotionid());
        if (temp != null) {
            temp.setPromotioncode(promotion.getPromotioncode());
            temp.setDiscountpercentage(promotion.getDiscountpercentage());
            temp.setRedemptionquantity(promotion.getRedemptionquantity());
            temp.setStaffid(promotion.getStaffid());
            temp.setStatus(promotion.getStatus());
            return true;
        }
        return false;
    }

    public List<Promotion> findAll() {
        List<Promotion> promoList;
        try {
            promoList = em.createNamedQuery("Promotion.findAll").getResultList();
        } catch (Exception e) {
            return null;
        }
        return promoList;
    }

}
