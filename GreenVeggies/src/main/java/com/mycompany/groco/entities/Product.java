package com.mycompany.groco.entities;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;

/**
 *
 * @author rishu
 */
@Entity
public class Product {
    @Id
    @GeneratedValue(strategy=GenerationType.IDENTITY)
    private int id;
    @Column(name="P_Name",length=100)
    private String productName;
    @Column(name="V_Name",length=100)
    private String vendorName;
    @Column(name="V_Address",length=100)
    private String vendorAddress;
    @Column(name="P_Desc",length=1000)
    private String productDesc;
    @Column(name="Image")
    private String productPic;
    @Column(name="Price")
    private float price;
    @Column(name="Discount")
    private int discount;
    @Column(name="Quantity")
    private float quantity;
    @ManyToOne
    private Category category;

    public Product() {
    }

    public Product(String productName,String vendorName,String vendorAddress,String productDesc, String productPic, int price, int discount, int quantity,Category category) {
        this.productName = productName;
        this.vendorName=vendorName;
        this.vendorAddress=vendorAddress;
        this.productDesc = productDesc;
        this.productPic = productPic;
        this.price = price;
        this.discount = discount;
        this.quantity = quantity;
        this.category=category;
    }

    public Product(int id, String productName,String vendorName,String vendorAddress, String productDesc, String productPic, float price, int discount, float quantity,Category category) {
        this.id = id;
        this.productName = productName;
        this.vendorName=vendorName;
        this.vendorAddress=vendorAddress;
        this.productDesc = productDesc;
        this.productPic = productPic;
        this.price = price;
        this.discount = discount;
        this.quantity = quantity;
        this.category=category;
    }

    public String getVendorName() {
        return vendorName;
    }

    public void setVendorName(String vendorName) {
        this.vendorName = vendorName;
    }

    public String getVendorAddress() {
        return vendorAddress;
    }

    public void setVendorAddress(String vendorAddress) {
        this.vendorAddress = vendorAddress;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public String getProductDesc() {
        return productDesc;
    }

    public void setProductDesc(String productDesc) {
        this.productDesc = productDesc;
    }

    public String getProductPic() {
        return productPic;
    }

    public void setProductPic(String productPic) {
        this.productPic = productPic;
    }

    public float getPrice() {
        return price;
    }

    public void setPrice(float price) {
        this.price = price;
    }

    public int getDiscount() {
        return discount;
    }

    public void setDiscount(int discount) {
        this.discount = discount;
    }

    public float getQuantity() {
        return quantity;
    }

    public void setQuantity(float quantity) {
        this.quantity = quantity;
    }

    public Category getCategory() {
        return category;
    }

    public void setCategory(Category category) {
        this.category = category;
    }
    

    @Override
    public String toString() {
        return "Product{" + "id=" + id + ", productName=" + productName + ", productDesc=" + productDesc + ", productPic=" + productPic + ", price=" + price + ", discount=" + discount + ", quantity=" + quantity + '}';
    }
    
}
