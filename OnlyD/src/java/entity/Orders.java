/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entity;

import java.io.Serializable;
import java.util.Date;
import java.util.List;
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
import jakarta.xml.bind.annotation.XmlRootElement;
import jakarta.xml.bind.annotation.XmlTransient;
/**
 *
 * @author GIGABYTE
 */
@Entity
@Table(name = "ORDERS")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Orders.findAll", query = "SELECT o FROM Orders o"),
    @NamedQuery(name = "Orders.findByOrderid", query = "SELECT o FROM Orders o WHERE o.orderid = :orderid"),
    @NamedQuery(name = "Orders.findByOrderdatetime", query = "SELECT o FROM Orders o WHERE o.orderdatetime = :orderdatetime"),
    @NamedQuery(name = "Orders.findByShippingaddress", query = "SELECT o FROM Orders o WHERE o.shippingaddress = :shippingaddress"),
    @NamedQuery(name = "Orders.findByPaymenttype", query = "SELECT o FROM Orders o WHERE o.paymenttype = :paymenttype"),
    @NamedQuery(name = "Orders.findBySubtotal", query = "SELECT o FROM Orders o WHERE o.subtotal = :subtotal"),
    @NamedQuery(name = "Orders.findByTotaldiscount", query = "SELECT o FROM Orders o WHERE o.totaldiscount = :totaldiscount"),
    @NamedQuery(name = "Orders.findByShippingfee", query = "SELECT o FROM Orders o WHERE o.shippingfee = :shippingfee"),
    @NamedQuery(name = "Orders.findByTotal", query = "SELECT o FROM Orders o WHERE o.total = :total")})
public class Orders implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "ORDERID")
    private Integer orderid;
    @Column(name = "ORDERDATETIME")
    @Temporal(TemporalType.DATE)
    private Date orderdatetime;
    @Column(name = "SHIPPINGADDRESS")
    private String shippingaddress;
    @Column(name = "PAYMENTTYPE")
    private String paymenttype;
    // @Max(value=?)  @Min(value=?)//if you know range of your decimal fields consider using these annotations to enforce field validation
    @Column(name = "SUBTOTAL")
    private Double subtotal;
    @Column(name = "TOTALDISCOUNT")
    private Double totaldiscount;
    @Column(name = "SHIPPINGFEE")
    private Double shippingfee;
    @Column(name = "TOTAL")
    private Double total;
    @JoinColumn(name = "CUSTOMERID", referencedColumnName = "CUSTOMERID")
    @ManyToOne(optional = false)
    private Customer customerid;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "orders")
    private List<Productorder> productorderList;

    public Orders() {
    }

    public Orders(Integer orderid) {
        this.orderid = orderid;
    }
    
    public Orders(Date orderdatetime, String shippingaddress, String paymenttype, Double subtotal, Double totaldiscount, Double shippingfee,Double total, Customer customerid) {
        this.orderdatetime = orderdatetime;
        this.shippingaddress = shippingaddress;
        this.paymenttype = paymenttype;
        this.subtotal = subtotal;
        this.totaldiscount = totaldiscount;
        this.shippingfee = shippingfee;
        this.total = total;
        this.customerid = customerid;
    }

    public Integer getOrderid() {
        return orderid;
    }

    public void setOrderid(Integer orderid) {
        this.orderid = orderid;
    }

    public Date getOrderdatetime() {
        return orderdatetime;
    }

    public void setOrderdatetime(Date orderdatetime) {
        this.orderdatetime = orderdatetime;
    }

    public String getShippingaddress() {
        return shippingaddress;
    }

    public void setShippingaddress(String shippingaddress) {
        this.shippingaddress = shippingaddress;
    }

    public String getPaymenttype() {
        return paymenttype;
    }

    public void setPaymenttype(String paymenttype) {
        this.paymenttype = paymenttype;
    }

    public Double getSubtotal() {
        return subtotal;
    }

    public void setSubtotal(Double subtotal) {
        this.subtotal = subtotal;
    }

    public Double getTotaldiscount() {
        return totaldiscount;
    }

    public void setTotaldiscount(Double totaldiscount) {
        this.totaldiscount = totaldiscount;
    }

    public Double getShippingfee() {
        return shippingfee;
    }

    public void setShippingfee(Double shippingfee) {
        this.shippingfee = shippingfee;
    }

    public Double getTotal() {
        return total;
    }

    public void setTotal(Double total) {
        this.total = total;
    }

    public Customer getCustomerid() {
        return customerid;
    }

    public void setCustomerid(Customer customerid) {
        this.customerid = customerid;
    }

    @XmlTransient
    public List<Productorder> getProductorderList() {
        return productorderList;
    }

    public void setProductorderList(List<Productorder> productorderList) {
        this.productorderList = productorderList;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (orderid != null ? orderid.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Orders)) {
            return false;
        }
        Orders other = (Orders) object;
        if ((this.orderid == null && other.orderid != null) || (this.orderid != null && !this.orderid.equals(other.orderid))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "entity.Orders[ orderid=" + orderid + " ]";
    }
    
}
