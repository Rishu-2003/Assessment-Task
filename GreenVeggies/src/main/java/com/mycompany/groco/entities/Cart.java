package com.mycompany.groco.entities;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
@Entity
public class Cart {
    @Id
    @GeneratedValue(strategy=GenerationType.IDENTITY)
    private int Id;
    @Column(name="User_Id")
    private int userId;
    @Column(name="Product_Name",length=50)
    private String productName;
    private int Quantity;
    private float Price;
    private String Picture;
    public Cart(int Id, int userId, String productName, int Quantity, float Price,String Picture) {
        this.Id = Id;
        this.userId = userId;
        this.productName = productName;
        this.Quantity = Quantity;
        this.Price = Price;
        this.Picture=Picture;
    }

    public Cart(int userId, String productName, int Quantity, float Price,String Picture) {
        this.userId = userId;
        this.productName = productName;
        this.Quantity = Quantity;
        this.Price = Price;
        this.Picture=Picture;
    }

    public Cart() {
    }

    public int getId() {
        return Id;
    }

    public void setId(int Id) {
        this.Id = Id;
    }

    public String getPicture() {
        return Picture;
    }

    public void setPicture(String Picture) {
        this.Picture = Picture;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public int getQuantity() {
        return Quantity;
    }

    public void setQuantity(int Quantity) {
        this.Quantity = Quantity;
    }

    public float getPrice() {
        return Price;
    }

    public void setPrice(float Price) {
        this.Price = Price;
    }
        
}
