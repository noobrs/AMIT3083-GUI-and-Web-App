/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package service;

import entity.Staff;
import jakarta.annotation.Resource;
import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;
import jakarta.persistence.Query;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Vin Sen
 */
public class StaffService {

    @PersistenceContext
    EntityManager em;
    @Resource
    Query query;

    public StaffService(EntityManager em) {
        this.em = em;
    }

    public void addStaff(Staff staff) {
        em.persist(staff);
    }

//    public Staff findStaffById(String id){
//        Staff staff = em.find(Staff.class, id);
//        return staff;
//    }
    public Staff findStaffByStaffId(String staffID) {
        Staff staff;
        try {
            staff = (Staff) em.createNamedQuery("Staff.findByStaffID")
                    .setParameter("staffID", staffID)
                    .setParameter("deletedStatus", Staff.DELETED_STATUS)
                    .getSingleResult();
        } catch (Exception e) {
            return null;
        }

        return staff;
    }

    public Staff findStaffByEmail(String email) {
        Staff staff;

        try {
            staff = (Staff) em.createNamedQuery("Staff.findByEmail")
                    .setParameter("email", email)
                    .setParameter("deletedStatus", Staff.DELETED_STATUS)
                    .getSingleResult();
        } catch (Exception e) {
            return null;
        }

        return staff;
    }

    public boolean deleteStaff(String staffID) {
        Staff staff = this.findStaffByStaffId(staffID);
        if (staff != null) {
            em.remove(staff);
            return true;
        }
        return false;
    }

    public boolean updateStaff(Staff staff) {
        Staff tempStaff = this.findStaffByStaffId(staff.getStaffID());
        if (tempStaff != null) {
            tempStaff.setName(staff.getName());
            tempStaff.setEmail(staff.getEmail());
            tempStaff.setPassword(staff.getPassword());
            tempStaff.setStatus(staff.getStatus());
            return true;
        }
        return false;
    }
    
     public List<Staff> findAllWithDeletedStatus() {
        List<Staff> staffList;
        try {
            staffList = em.createNamedQuery("Staff.findAllWithDeletedStatus")                    
                    .getResultList();
        } catch (Exception e) {
            return null;
        }
        return staffList;
    }

    public List<Staff> findAll() {
        List<Staff> staffList;
        try {
            staffList = em.createNamedQuery("Staff.findAll")
                    .setParameter("deletedStatus", Staff.DELETED_STATUS)
                    .getResultList();
        } catch (Exception e) {
            return null;
        }
        return staffList;
    }

}
