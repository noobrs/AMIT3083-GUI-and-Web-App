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
 * @author GIGABYTE
 */
@Embeddable
public class ProductcartPK implements Serializable {

    @Basic(optional = false)
    @Column(name = "CARTID")
    private int cartid;
    @Basic(optional = false)
    @Column(name = "PRODUCTID")
    private int productid;

    public ProductcartPK() {
    }

    public ProductcartPK(int cartid, int productid) {
        this.cartid = cartid;
        this.productid = productid;
    }

    public int getCartid() {
        return cartid;
    }

    public void setCartid(int cartid) {
        this.cartid = cartid;
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
        hash += (int) cartid;
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
        if (this.cartid != other.cartid) {
            return false;
        }
        if (this.productid != other.productid) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "entity.ProductcartPK[ cartid=" + cartid + ", productid=" + productid + " ]";
    }
    
}
