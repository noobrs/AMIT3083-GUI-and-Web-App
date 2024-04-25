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
public class ProductCartPK implements Serializable {

    @Basic(optional = false)
    @NotNull
    @Column(name = "CartID")
    private int cartID;
    @Basic(optional = false)
    @NotNull
    @Column(name = "ProductID")
    private int productID;

    public ProductCartPK() {
    }

    public ProductCartPK(int cartID, int productID) {
        this.cartID = cartID;
        this.productID = productID;
    }

    public int getCartID() {
        return cartID;
    }

    public void setCartID(int cartID) {
        this.cartID = cartID;
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
        hash += (int) cartID;
        hash += (int) productID;
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof ProductCartPK)) {
            return false;
        }
        ProductCartPK other = (ProductCartPK) object;
        if (this.cartID != other.cartID) {
            return false;
        }
        if (this.productID != other.productID) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "entity.ProductCartPK[ cartID=" + cartID + ", productID=" + productID + " ]";
    }
    
}
