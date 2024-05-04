/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entity;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.JoinTable;
import jakarta.persistence.ManyToMany;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;
import java.io.Serializable;
import java.util.List;
import entity.Product;
import jakarta.persistence.NamedQueries;
import jakarta.persistence.NamedQuery;
import jakarta.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author danie
 */
@Entity
@Table(name = "PRODUCTPROMOTION")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "ProductPromotion.findAll", query = "SELECT p FROM Promotion p WHERE p.status != :deletedStatus"),
    @NamedQuery(name = "ProductPromotion.findByPromotionID", query = "SELECT p FROM Promotion p WHERE p.promotionID = :promotionID AND p.status != :deletedStatus"),
    @NamedQuery(name = "ProductPromotion.findByProductID", query = "SELECT d FROM ProductID d WHERE d.productID = :productID AND d.status != :deletedStatus")})

public class ProductPromotion implements Serializable {

    @Id
    @ManyToOne
    @JoinColumn(name = "PRODUCTID")
    private Product product;

    @Id
    @ManyToOne
    @JoinColumn(name = "PROMOTIONID")
    private Promotion promotion;

    // Other fields, constructors, getters, and setters...\
    public ProductPromotion() {

    }

    public ProductPromotion(Product product, Promotion promotion) {
        this.product = product;
        this.promotion = promotion;
    }

    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }

    public Promotion getPromotion() {
        return promotion;
    }

    public void setPromotion(Promotion promotion) {
        this.promotion = promotion;
    }

}
