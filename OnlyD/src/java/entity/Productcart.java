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
 * @author danie
 */
@Entity
@Table(name = "PRODUCTCART")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Productcart.findAll", query = "SELECT p FROM Productcart p"),
    @NamedQuery(name = "Productcart.findByCustomerid", query = "SELECT p FROM Productcart p WHERE p.productcartPK.customerid = :customerid"),
    @NamedQuery(name = "Productcart.findByProductid", query = "SELECT p FROM Productcart p WHERE p.productcartPK.productid = :productid"),
    @NamedQuery(name = "Productcart.findByQuantity", query = "SELECT p FROM Productcart p WHERE p.quantity = :quantity")})
public class Productcart implements Serializable {

    private static final long serialVersionUID = 1L;
    @EmbeddedId
    protected ProductcartPK productcartPK;
    @Column(name = "QUANTITY")
    private Integer quantity;
    @JoinColumn(name = "CUSTOMERID", referencedColumnName = "CUSTOMERID", insertable = false, updatable = false)
    @ManyToOne(optional = false)
    private Customer customer;
    @JoinColumn(name = "PRODUCTID", referencedColumnName = "PRODUCTID", insertable = false, updatable = false)
    @ManyToOne(optional = false)
    private Product product;

    public Productcart() {
    }

    public Productcart(ProductcartPK productcartPK) {
        this.productcartPK = productcartPK;
    }

    public Productcart(int customerid, int productid) {
        this.productcartPK = new ProductcartPK(customerid, productid);
    }

    public ProductcartPK getProductcartPK() {
        return productcartPK;
    }

    public void setProductcartPK(ProductcartPK productcartPK) {
        this.productcartPK = productcartPK;
    }

    public Integer getQuantity() {
        return quantity;
    }

    public void setQuantity(Integer quantity) {
        this.quantity = quantity;
    }

    public Customer getCustomer() {
        return customer;
    }

    public void setCustomer(Customer customer) {
        this.customer = customer;
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
        hash += (productcartPK != null ? productcartPK.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Productcart)) {
            return false;
        }
        Productcart other = (Productcart) object;
        if ((this.productcartPK == null && other.productcartPK != null) || (this.productcartPK != null && !this.productcartPK.equals(other.productcartPK))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "entity.Productcart[ productcartPK=" + productcartPK + " ]";
    }
    
}
