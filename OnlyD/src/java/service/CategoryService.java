/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package service;

import entity.Category;
import jakarta.annotation.Resource;
import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;
import jakarta.persistence.Query;
import jakarta.persistence.TypedQuery;
import java.util.List;

public class CategoryService {
     @PersistenceContext
    EntityManager mgr;
    @Resource
    Query query;

    public CategoryService(EntityManager mgr) {
        this.mgr = mgr;
    }

    public boolean addCategory(Category category) {
        mgr.persist(category);
        return true;
    }
    
    public boolean deleteCategory(int id) {
        Category tempCategory = findCategoryByID(id);
        if (tempCategory != null) {
            tempCategory.setStatus(0);
            return true;
        }
        return false;
    }

    public Category findCategoryByID(int id) {
        Category category = mgr.find(Category.class, id);
        return category;
    }
    
    public List<Category> findByStatus(int status) {
        TypedQuery<Category> categoryList = mgr.createNamedQuery("Category.findByStatus",Category.class);
        categoryList.setParameter("status",status);
        return categoryList.getResultList();
    }
    
    public List<Category> findAll() {
        List categoryList = mgr.createNamedQuery("Category.findAll").getResultList();
        return categoryList;
    }
    
        public boolean updateCategory(Category category) {
        Category tempCategory = findCategoryByID(category.getCategoryid());
        if (tempCategory != null) {
            tempCategory.setCategoryname(category.getCategoryname());
            tempCategory.setStatus(category.getStatus());
            return true;
        }
        return false;
    }
}
