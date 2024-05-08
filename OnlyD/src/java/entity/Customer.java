/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entity;

import jakarta.persistence.Basic;
import jakarta.persistence.CascadeType;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.NamedQueries;
import jakarta.persistence.NamedQuery;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;
import jakarta.validation.constraints.Size;
import jakarta.xml.bind.annotation.XmlRootElement;
import java.io.Serializable;
import java.util.List;

/**
 *
 * @author Vin Sen
 */
@Entity
@Table(name = "CUSTOMER")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Customer.findAll", query = "SELECT c FROM Customer c WHERE c.status != :deletedStatus"),
    @NamedQuery(name = "Customer.findByCustomerID", query = "SELECT c FROM Customer c WHERE c.customerID = :customerID AND c.status != :deletedStatus"),
    @NamedQuery(name = "Customer.findByName", query = "SELECT c FROM Customer c WHERE c.name = :name AND c.status != :deletedStatus"),
    @NamedQuery(name = "Customer.findByUsername", query = "SELECT c FROM Customer c WHERE c.username = :username AND c.status != :deletedStatus"),
    @NamedQuery(name = "Customer.findByPhoneNumber", query = "SELECT c FROM Customer c WHERE c.phoneNumber = :phoneNumber AND c.status != :deletedStatus"),
    @NamedQuery(name = "Customer.findByEmail", query = "SELECT c FROM Customer c WHERE c.email = :email AND c.status != :deletedStatus"),
    @NamedQuery(name = "Customer.findByPassword", query = "SELECT c FROM Customer c WHERE c.password = :password"),
    @NamedQuery(name = "Customer.findByStatus", query = "SELECT c FROM Customer c WHERE c.status = :status")})
public class Customer implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "CUSTOMERID")
    private Integer customerID;
    @Size(max = 100)
    @Column(name = "NAME")
    private String name;
    @Size(max = 50)
    @Column(name = "USERNAME")
    private String username;
    @Size(max = 20)
    @Column(name = "PHONENUMBER")
    private String phoneNumber;
    // @Pattern(regexp="[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?", message="Invalid email")//if the field contains email address consider using this annotation to enforce field validation
    @Size(max = 100)
    @Column(name = "EMAIL")
    private String email;
    @Size(max = 255)
    @Column(name = "PASSWORD")
    private String password;
    @Column(name = "STATUS")
    private Integer status;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "customerid")
    private List<Orders> ordersList;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "customer", fetch = FetchType.LAZY)
    private List<Productcart> productcartList;

    public static final int ACTIVE_STATUS = 1;
    public static final int DELETED_STATUS = 2;

    public Customer() {
    }

    public Customer(Integer customerID) {
        this.customerID = customerID;
    }

    public Customer(String name, String username, String phoneNumber, String email, String password, Integer status) {
        this.name = name;
        this.username = username;
        this.phoneNumber = phoneNumber;
        this.email = email;
        this.password = password;
        this.status = status;
    }

    public Customer(String name, String email, String username, String phoneNumber, String password) {
        this.name = name;
        this.username = username;
        this.phoneNumber = phoneNumber;
        this.email = email;
        this.password = password;
    }

    public Integer getCustomerID() {
        return customerID;
    }

    public void setCustomerID(Integer customerID) {
        this.customerID = customerID;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public List<Orders> getOrdersList() {
        return ordersList;
    }

    public void setOrdersList(List<Orders> ordersList) {
        this.ordersList = ordersList;
    }

    public List<Productcart> getProductcartList() {
        return productcartList;
    }

    public void setProductcartList(List<Productcart> productcartList) {
        this.productcartList = productcartList;
    }

    public void initializeProductcartList() {
        if (productcartList != null) {
            productcartList.size(); // This will trigger the initialization of the lazy relationship
        }
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (customerID != null ? customerID.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Customer)) {
            return false;
        }
        Customer other = (Customer) object;
        if ((this.customerID == null && other.customerID != null) || (this.customerID != null && !this.customerID.equals(other.customerID))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "entity.Customer[ customerID=" + customerID + " ]";
    }

}
