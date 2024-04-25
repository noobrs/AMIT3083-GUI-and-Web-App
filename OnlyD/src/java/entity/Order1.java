/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entity;

import jakarta.persistence.Basic;
import jakarta.persistence.CascadeType;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.NamedQueries;
import jakarta.persistence.NamedQuery;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;
import jakarta.persistence.Temporal;
import jakarta.persistence.TemporalType;
import jakarta.validation.constraints.Size;
import jakarta.xml.bind.annotation.XmlRootElement;
import jakarta.xml.bind.annotation.XmlTransient;
import java.io.Serializable;
import java.util.Date;
import java.util.List;

/**
 *
 * @author Vin Sen
 */
@Entity
@Table(name = "Order")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Order1.findAll", query = "SELECT o FROM Order1 o"),
    @NamedQuery(name = "Order1.findByOrderID", query = "SELECT o FROM Order1 o WHERE o.orderID = :orderID"),
    @NamedQuery(name = "Order1.findByOrderDateTime", query = "SELECT o FROM Order1 o WHERE o.orderDateTime = :orderDateTime"),
    @NamedQuery(name = "Order1.findByShippingAddress", query = "SELECT o FROM Order1 o WHERE o.shippingAddress = :shippingAddress"),
    @NamedQuery(name = "Order1.findByPaymentType", query = "SELECT o FROM Order1 o WHERE o.paymentType = :paymentType"),
    @NamedQuery(name = "Order1.findBySubtotal", query = "SELECT o FROM Order1 o WHERE o.subtotal = :subtotal"),
    @NamedQuery(name = "Order1.findByTotalDiscount", query = "SELECT o FROM Order1 o WHERE o.totalDiscount = :totalDiscount"),
    @NamedQuery(name = "Order1.findByShippingFee", query = "SELECT o FROM Order1 o WHERE o.shippingFee = :shippingFee"),
    @NamedQuery(name = "Order1.findByTotal", query = "SELECT o FROM Order1 o WHERE o.total = :total")})
public class Order1 implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "OrderID")
    private Integer orderID;
    @Column(name = "OrderDateTime")
    @Temporal(TemporalType.DATE)
    private Date orderDateTime;
    @Size(max = 255)
    @Column(name = "ShippingAddress")
    private String shippingAddress;
    @Size(max = 100)
    @Column(name = "PaymentType")
    private String paymentType;
    // @Max(value=?)  @Min(value=?)//if you know range of your decimal fields consider using these annotations to enforce field validation
    @Column(name = "Subtotal")
    private Double subtotal;
    @Column(name = "TotalDiscount")
    private Double totalDiscount;
    @Column(name = "ShippingFee")
    private Double shippingFee;
    @Column(name = "Total")
    private Double total;
    @JoinColumn(name = "CustomerID", referencedColumnName = "CustomerID")
    @ManyToOne(optional = false)
    private Customer customerID;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "order1")
    private List<ProductOrder> productOrderList;

    public Order1() {
    }

    public Order1(Integer orderID) {
        this.orderID = orderID;
    }

    public Integer getOrderID() {
        return orderID;
    }

    public void setOrderID(Integer orderID) {
        this.orderID = orderID;
    }

    public Date getOrderDateTime() {
        return orderDateTime;
    }

    public void setOrderDateTime(Date orderDateTime) {
        this.orderDateTime = orderDateTime;
    }

    public String getShippingAddress() {
        return shippingAddress;
    }

    public void setShippingAddress(String shippingAddress) {
        this.shippingAddress = shippingAddress;
    }

    public String getPaymentType() {
        return paymentType;
    }

    public void setPaymentType(String paymentType) {
        this.paymentType = paymentType;
    }

    public Double getSubtotal() {
        return subtotal;
    }

    public void setSubtotal(Double subtotal) {
        this.subtotal = subtotal;
    }

    public Double getTotalDiscount() {
        return totalDiscount;
    }

    public void setTotalDiscount(Double totalDiscount) {
        this.totalDiscount = totalDiscount;
    }

    public Double getShippingFee() {
        return shippingFee;
    }

    public void setShippingFee(Double shippingFee) {
        this.shippingFee = shippingFee;
    }

    public Double getTotal() {
        return total;
    }

    public void setTotal(Double total) {
        this.total = total;
    }

    public Customer getCustomerID() {
        return customerID;
    }

    public void setCustomerID(Customer customerID) {
        this.customerID = customerID;
    }

    @XmlTransient
    public List<ProductOrder> getProductOrderList() {
        return productOrderList;
    }

    public void setProductOrderList(List<ProductOrder> productOrderList) {
        this.productOrderList = productOrderList;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (orderID != null ? orderID.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Order1)) {
            return false;
        }
        Order1 other = (Order1) object;
        if ((this.orderID == null && other.orderID != null) || (this.orderID != null && !this.orderID.equals(other.orderID))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "entity.Order1[ orderID=" + orderID + " ]";
    }
    
}
