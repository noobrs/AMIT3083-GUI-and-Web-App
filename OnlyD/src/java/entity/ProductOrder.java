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
@Table(name = "ProductOrder")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "ProductOrder.findAll", query = "SELECT p FROM ProductOrder p"),
    @NamedQuery(name = "ProductOrder.findByOrderID", query = "SELECT p FROM ProductOrder p WHERE p.productOrderPK.orderID = :orderID"),
    @NamedQuery(name = "ProductOrder.findByProductID", query = "SELECT p FROM ProductOrder p WHERE p.productOrderPK.productID = :productID"),
    @NamedQuery(name = "ProductOrder.findByQuantity", query = "SELECT p FROM ProductOrder p WHERE p.quantity = :quantity")})
public class ProductOrder implements Serializable {

    private static final long serialVersionUID = 1L;
    @EmbeddedId
    protected ProductOrderPK productOrderPK;
    @Column(name = "Quantity")
    private Integer quantity;
    @JoinColumn(name = "OrderID", referencedColumnName = "OrderID", insertable = false, updatable = false)
    @ManyToOne(optional = false)
    private Order1 order1;
    @JoinColumn(name = "ProductID", referencedColumnName = "ProductID", insertable = false, updatable = false)
    @ManyToOne(optional = false)
    private Product product;

    public ProductOrder() {
    }

    public ProductOrder(ProductOrderPK productOrderPK) {
        this.productOrderPK = productOrderPK;
    }

    public ProductOrder(int orderID, int productID) {
        this.productOrderPK = new ProductOrderPK(orderID, productID);
    }

    public ProductOrderPK getProductOrderPK() {
        return productOrderPK;
    }

    public void setProductOrderPK(ProductOrderPK productOrderPK) {
        this.productOrderPK = productOrderPK;
    }

    public Integer getQuantity() {
        return quantity;
    }

    public void setQuantity(Integer quantity) {
        this.quantity = quantity;
    }

    public Order1 getOrder1() {
        return order1;
    }

    public void setOrder1(Order1 order1) {
        this.order1 = order1;
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
        hash += (productOrderPK != null ? productOrderPK.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof ProductOrder)) {
            return false;
        }
        ProductOrder other = (ProductOrder) object;
        if ((this.productOrderPK == null && other.productOrderPK != null) || (this.productOrderPK != null && !this.productOrderPK.equals(other.productOrderPK))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "entity.ProductOrder[ productOrderPK=" + productOrderPK + " ]";
    }
    
}
