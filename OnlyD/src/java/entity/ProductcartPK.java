/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entity;

import java.io.Serializable;
import jakarta.persistence.Basic;
import jakarta.persistence.Column;
import jakarta.persistence.Embeddable;

/**
 *
 * @author danie
 */
@Embeddable
public class ProductcartPK implements Serializable {

    @Basic(optional = false)
    @Column(name = "CUSTOMERID")
    private int customerid;
    @Basic(optional = false)
    @Column(name = "PRODUCTID")
    private int productid;

    public ProductcartPK() {
    }

    public ProductcartPK(int customerid, int productid) {
        this.customerid = customerid;
        this.productid = productid;
    }

    public int getCustomerid() {
        return customerid;
    }

    public void setCustomerid(int customerid) {
        this.customerid = customerid;
    }

    public int getProductid() {
        return productid;
    }

    public void setProductid(int productid) {
        this.productid = productid;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (int) customerid;
        hash += (int) productid;
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof ProductcartPK)) {
            return false;
        }
        ProductcartPK other = (ProductcartPK) object;
        if (this.customerid != other.customerid) {
            return false;
        }
        if (this.productid != other.productid) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "entity.ProductcartPK[ customerid=" + customerid + ", productid=" + productid + " ]";
    }
    
}
