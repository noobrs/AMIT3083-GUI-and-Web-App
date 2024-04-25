/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entity;

import jakarta.persistence.Column;
import jakarta.persistence.EmbeddedId;
import jakarta.persistence.Entity;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.NamedQueries;
import jakarta.persistence.NamedQuery;
import jakarta.persistence.Table;
import jakarta.xml.bind.annotation.XmlRootElement;
import java.io.Serializable;

/**
 *
 * @author Vin Sen
 */
@Entity
@Table(name = "ProductCart")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "ProductCart.findAll", query = "SELECT p FROM ProductCart p"),
    @NamedQuery(name = "ProductCart.findByCartID", query = "SELECT p FROM ProductCart p WHERE p.productCartPK.cartID = :cartID"),
    @NamedQuery(name = "ProductCart.findByProductID", query = "SELECT p FROM ProductCart p WHERE p.productCartPK.productID = :productID"),
    @NamedQuery(name = "ProductCart.findByQuantity", query = "SELECT p FROM ProductCart p WHERE p.quantity = :quantity")})
public class ProductCart implements Serializable {

    private static final long serialVersionUID = 1L;
    @EmbeddedId
    protected ProductCartPK productCartPK;
    @Column(name = "Quantity")
    private Integer quantity;
    @JoinColumn(name = "CartID", referencedColumnName = "CartID", insertable = false, updatable = false)
    @ManyToOne(optional = false)
    private Cart cart;
    @JoinColumn(name = "ProductID", referencedColumnName = "ProductID", insertable = false, updatable = false)
    @ManyToOne(optional = false)
    private Product product;

    public ProductCart() {
    }

    public ProductCart(ProductCartPK productCartPK) {
        this.productCartPK = productCartPK;
    }

    public ProductCart(int cartID, int productID) {
        this.productCartPK = new ProductCartPK(cartID, productID);
    }

    public ProductCartPK getProductCartPK() {
        return productCartPK;
    }

    public void setProductCartPK(ProductCartPK productCartPK) {
        this.productCartPK = productCartPK;
    }

    public Integer getQuantity() {
        return quantity;
    }

    public void setQuantity(Integer quantity) {
        this.quantity = quantity;
    }

    public Cart getCart() {
        return cart;
    }

    public void setCart(Cart cart) {
        this.cart = cart;
    }

    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (productCartPK != null ? productCartPK.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof ProductCart)) {
            return false;
        }
        ProductCart other = (ProductCart) object;
        if ((this.productCartPK == null && other.productCartPK != null) || (this.productCartPK != null && !this.productCartPK.equals(other.productCartPK))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "entity.ProductCart[ productCartPK=" + productCartPK + " ]";
    }
    
}
