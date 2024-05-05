/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entity;

import java.io.Serializable;
import jakarta.persistence.Column;
import jakarta.persistence.EmbeddedId;
import jakarta.persistence.Entity;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.NamedQueries;
import jakarta.persistence.NamedQuery;
import jakarta.persistence.Table;
import jakarta.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author GIGABYTE
 */
@Entity
@Table(name = "PRODUCTORDER")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Productorder.findAll", query = "SELECT p FROM Productorder p"),
    @NamedQuery(name = "Productorder.findByOrderid", query = "SELECT p FROM Productorder p WHERE p.productorderPK.orderid = :orderid"),
    @NamedQuery(name = "Productorder.findByProductid", query = "SELECT p FROM Productorder p WHERE p.productorderPK.productid = :productid"),
    @NamedQuery(name = "Productorder.findByQuantity", query = "SELECT p FROM Productorder p WHERE p.quantity = :quantity")})
public class Productorder implements Serializable {

    private static final long serialVersionUID = 1L;
    @EmbeddedId
    protected ProductorderPK productorderPK;
    @Column(name = "QUANTITY")
    private Integer quantity;
    @JoinColumn(name = "ORDERID", referencedColumnName = "ORDERID", insertable = false, updatable = false)
    @ManyToOne(optional = false)
    private Orders orders;
    @JoinColumn(name = "PRODUCTID", referencedColumnName = "PRODUCTID", insertable = false, updatable = false)
    @ManyToOne(optional = false)
    private Product product;

    public Productorder() {
    }

    public Productorder(ProductorderPK productorderPK) {
        this.productorderPK = productorderPK;
    }

    public Productorder(int orderid, int productid) {
        this.productorderPK = new ProductorderPK(orderid, productid);
    }

    public ProductorderPK getProductorderPK() {
        return productorderPK;
    }

    public void setProductorderPK(ProductorderPK productorderPK) {
        this.productorderPK = productorderPK;
    }

    public Integer getQuantity() {
        return quantity;
    }

    public void setQuantity(Integer quantity) {
        this.quantity = quantity;
    }

    public Orders getOrders() {
        return orders;
    }

    public void setOrders(Orders orders) {
        this.orders = orders;
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
        hash += (productorderPK != null ? productorderPK.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Productorder)) {
            return false;
        }
        Productorder other = (Productorder) object;
        if ((this.productorderPK == null && other.productorderPK != null) || (this.productorderPK != null && !this.productorderPK.equals(other.productorderPK))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "entity.Productorder[ productorderPK=" + productorderPK + " ]";
    }
    
}
