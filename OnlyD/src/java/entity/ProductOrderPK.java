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
public class ProductOrderPK implements Serializable {

    @Basic(optional = false)
    @NotNull
    @Column(name = "OrderID")
    private int orderID;
    @Basic(optional = false)
    @NotNull
    @Column(name = "ProductID")
    private int productID;

    public ProductOrderPK() {
    }

    public ProductOrderPK(int orderID, int productID) {
        this.orderID = orderID;
        this.productID = productID;
    }

    public int getOrderID() {
        return orderID;
    }

    public void setOrderID(int orderID) {
        this.orderID = orderID;
    }

    public int getProductID() {
        return productID;
    }

    public void setProductID(int productID) {
        this.productID = productID;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (int) orderID;
        hash += (int) productID;
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof ProductOrderPK)) {
            return false;
        }
        ProductOrderPK other = (ProductOrderPK) object;
        if (this.orderID != other.orderID) {
            return false;
        }
        if (this.productID != other.productID) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "entity.ProductOrderPK[ orderID=" + orderID + ", productID=" + productID + " ]";
    }
    
}
