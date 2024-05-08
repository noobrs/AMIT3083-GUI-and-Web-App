/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entity;

import jakarta.persistence.Basic;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.NamedQueries;
import jakarta.persistence.NamedQuery;
import jakarta.persistence.Table;
import jakarta.validation.constraints.Size;
import jakarta.xml.bind.annotation.XmlRootElement;
import java.io.Serializable;

/**
 *
 * @author Danie
 */
@Entity
@Table(name = "PROMOTION")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Promotion.findAll", query = "SELECT p FROM Promotion p"),
    @NamedQuery(name = "Promotion.findByPromotionid", query = "SELECT p FROM Promotion p WHERE p.promotionid = :promotionid"),
    @NamedQuery(name = "Promotion.findByPromotioncode", query = "SELECT p FROM Promotion p WHERE p.promotioncode = :promotioncode"),
    @NamedQuery(name = "Promotion.findByDiscountpercentage", query = "SELECT p FROM Promotion p WHERE p.discountpercentage = :discountpercentage"),
    @NamedQuery(name = "Promotion.findByRedemptionquantity", query = "SELECT p FROM Promotion p WHERE p.redemptionquantity = :redemptionquantity"),
    @NamedQuery(name = "Promotion.findByStatus", query = "SELECT p FROM Promotion p WHERE p.status = :status"),
    @NamedQuery(name = "Promotion.findAllWithoutStatus", query = "SELECT p FROM Promotion p WHERE p.status != :status")})
public class Promotion implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "PROMOTIONID")
    private Integer promotionid;
    @Size(max = 100)
    @Column(name = "PROMOTIONCODE")
    private String promotioncode;
    // @Max(value=?)  @Min(value=?)//if you know range of your decimal fields consider using these annotations to enforce field validation
    @Column(name = "DISCOUNTPERCENTAGE")
    private Double discountpercentage;
    @Column(name = "REDEMPTIONQUANTITY")
    private Integer redemptionquantity;
    @Column(name = "STATUS")
    private Integer status;
    @JoinColumn(name = "STAFFID", referencedColumnName = "STAFFID")
    @ManyToOne
    private Staff staffid;
    
    public static final int ACTIVE_STATUS = 1;
    public static final int DELETED_STATUS = 2;
    public static final int REDEEMED_STATUS = 3;

    public Promotion() {
    }

    public Promotion(Integer promotionid) {
        this.promotionid = promotionid;
    }

    public Promotion(String promotioncode, Double discountpercentage, Integer redemptionquantity, Integer status, Staff staffid) {
        this.promotioncode = promotioncode;
        this.discountpercentage = discountpercentage;
        this.redemptionquantity = redemptionquantity;
        this.status = status;
        this.staffid = staffid;
    }

    public Integer getPromotionid() {
        return promotionid;
    }

    public void setPromotionid(Integer promotionid) {
        this.promotionid = promotionid;
    }

    public String getPromotioncode() {
        return promotioncode;
    }

    public void setPromotioncode(String promotioncode) {
        this.promotioncode = promotioncode;
    }

    public Double getDiscountpercentage() {
        return discountpercentage;
    }

    public void setDiscountpercentage(Double discountpercentage) {
        this.discountpercentage = discountpercentage;
    }

    public Integer getRedemptionquantity() {
        return redemptionquantity;
    }

    public void setRedemptionquantity(Integer redemptionquantity) {
        this.redemptionquantity = redemptionquantity;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public Staff getStaffid() {
        return staffid;
    }

    public void setStaffid(Staff staffid) {
        this.staffid = staffid;
    }        

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (promotionid != null ? promotionid.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Promotion)) {
            return false;
        }
        Promotion other = (Promotion) object;
        if ((this.promotionid == null && other.promotionid != null) || (this.promotionid != null && !this.promotionid.equals(other.promotionid))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "entity.Promotion[ promotionid=" + promotionid + " ]";
    }
    
}
