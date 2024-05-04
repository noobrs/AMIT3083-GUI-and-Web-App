/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entity;

import jakarta.persistence.Basic;
import jakarta.persistence.Column;
import jakarta.persistence.Embeddable;
import jakarta.validation.constraints.NotNull;
import java.io.Serializable;

/**
 *
 * @author Vin Sen
 */
@Embeddable
public class ProductpromotionPK implements Serializable {

    @Basic(optional = false)
    @NotNull
    @Column(name = "PROMOTIONID")
    private int promotionid;
    @Basic(optional = false)
    @NotNull
    @Column(name = "PRODUCTID")
    private int productid;

    public ProductpromotionPK() {
    }

    public ProductpromotionPK(int promotionid, int productid) {
        this.promotionid = promotionid;
        this.productid = productid;
    }

    public int getPromotionid() {
        return promotionid;
    }

    public void setPromotionid(int promotionid) {
        this.promotionid = promotionid;
    }

    public int getProductid() {
        return productid;
    }

    public void setProductid(int productid) {
        this.productid = productid;
    }

    @Override
    public int hashCode() {
        int hash = 7;
        hash = 23 * hash + this.promotionid;
        hash = 23 * hash + this.productid;
        return hash;
    }

    @Override
    public boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj == null) {
            return false;
        }
        if (getClass() != obj.getClass()) {
            return false;
        }
        final ProductpromotionPK other = (ProductpromotionPK) obj;
        if (this.promotionid != other.promotionid) {
            return false;
        }
        return this.productid == other.productid;
    }

    @Override
    public String toString() {
        return "ProductpromotionPK{" + "promotionid=" + promotionid + ", productid=" + productid + '}';
    }
    
}
