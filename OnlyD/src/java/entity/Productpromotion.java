/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entity;

import jakarta.persistence.EmbeddedId;
import jakarta.persistence.Entity;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.NamedQueries;
import jakarta.persistence.NamedQuery;
import jakarta.persistence.Table;
import jakarta.xml.bind.annotation.XmlRootElement;
import java.io.Serializable;
import java.util.Objects;

/**
 *
 * @author Vin Sen
 */
@Entity
@Table(name = "PRODUCTPROMOTION")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Productpromotion.findAll", query = "SELECT p FROM Productpromotion p"),
    @NamedQuery(name = "Productpromotion.findByPromotionid", query = "SELECT p FROM Productpromotion p WHERE p.productpromotionPK.promotionid = :promotionid"),
    @NamedQuery(name = "Productpromotion.findByProductid", query = "SELECT p FROM Productpromotion p WHERE p.productpromotionPK.productid = :productid")})
public class Productpromotion implements Serializable {

    private static final long serialVersionUID = 1L;
    @EmbeddedId
    protected ProductpromotionPK productpromotionPK;
    @JoinColumn(name = "PROMOTIONID", referencedColumnName = "PROMOTIONID", insertable = false, updatable = false)
    @ManyToOne(optional = false)
    private Promotion promotion;
    @JoinColumn(name = "PRODUCTID", referencedColumnName = "PRODUCTID", insertable = false, updatable = false)
    @ManyToOne(optional = false)
    private Product product;

    public Productpromotion() {
    }

    public Productpromotion(ProductpromotionPK productpromotionPK) {
        this.productpromotionPK = productpromotionPK;
    }

    public Productpromotion(int promotionid, int productid) {
        this.productpromotionPK = new ProductpromotionPK(promotionid, productid);
    }

    public ProductpromotionPK getProductpromotionPK() {
        return productpromotionPK;
    }

    public void setProductpromotionPK(ProductpromotionPK productpromotionPK) {
        this.productpromotionPK = productpromotionPK;
    }

    public Promotion getPromotion() {
        return promotion;
    }

    public void setPromotion(Promotion promotion) {
        this.promotion = promotion;
    }

    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }

    @Override
    public int hashCode() {
        int hash = 7;
        hash = 59 * hash + Objects.hashCode(this.productpromotionPK);
        hash = 59 * hash + Objects.hashCode(this.promotion);
        hash = 59 * hash + Objects.hashCode(this.product);
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
        final Productpromotion other = (Productpromotion) obj;
        if (!Objects.equals(this.productpromotionPK, other.productpromotionPK)) {
            return false;
        }
        if (!Objects.equals(this.promotion, other.promotion)) {
            return false;
        }
        return Objects.equals(this.product, other.product);
    }

    @Override
    public String toString() {
        return "Productpromotion{" + "productpromotionPK=" + productpromotionPK + ", promotion=" + promotion + ", product=" + product + '}';
    }
    
}
