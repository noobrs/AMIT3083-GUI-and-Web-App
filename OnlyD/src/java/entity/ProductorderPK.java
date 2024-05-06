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
public class ProductorderPK implements Serializable {

    @Basic(optional = false)
    @NotNull
    @Column(name = "ORDERID")
    private int orderid;
    @Basic(optional = false)
    @NotNull
    @Column(name = "PRODUCTID")
    private int productid;

    public ProductorderPK() {
    }

    public ProductorderPK(int orderid, int productid) {
        this.orderid = orderid;
        this.productid = productid;
    }

    public int getOrderid() {
        return orderid;
    }

    public void setOrderid(int orderid) {
        this.orderid = orderid;
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
        hash += (int) orderid;
        hash += (int) productid;
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof ProductorderPK)) {
            return false;
        }
        ProductorderPK other = (ProductorderPK) object;
        if (this.orderid != other.orderid) {
            return false;
        }
        if (this.productid != other.productid) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "entity.ProductorderPK[ orderid=" + orderid + ", productid=" + productid + " ]";
    }
    
}
