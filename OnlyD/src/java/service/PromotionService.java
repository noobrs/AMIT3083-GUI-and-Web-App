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
    
    public void addPromotion(Promotion promotion){
        em.persist(promotion);
    }
}
