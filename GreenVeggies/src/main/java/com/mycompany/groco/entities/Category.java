package com.mycompany.groco.entities;

import java.util.ArrayList;
import java.util.List;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
/**
 *
 * @author rishu
 */
@Entity
public class Category {
    @Id
    @GeneratedValue(strategy=GenerationType.IDENTITY)
    private int Id;
    @Column(name="C_Title",length=500)
    private String category_Title;
    @Column(name="C_Description",length=2000)
    private String category_desc;
    @OneToMany(mappedBy="category")
    private List<Product>product=new ArrayList<>();

    public Category() {
    }

    public Category(String category_Title, String category_desc,List<Product>product) {
        this.category_Title = category_Title;
        this.category_desc = category_desc;
        this.product=product;
    }

    
    public Category(int Id, String category_Title, String category_desc,List<Product>product) {
        this.Id = Id;
        this.category_Title = category_Title;
        this.category_desc = category_desc;
        this.product=product;
    }

    public int getId() {
        return Id;
    }

    public void setId(int Id) {
        this.Id = Id;
    }

    public String getCategory_Title() {
        return category_Title;
    }

    public void setCategory_Title(String category_Title) {
        this.category_Title = category_Title;
    }

    public String getCategory_desc() {
        return category_desc;
    }

    public void setCategory_desc(String category_desc) {
        this.category_desc = category_desc;
    }

    public List<Product> getProduct() {
        return product;
    }

    public void setProduct(List<Product> product) {
        this.product = product;
    }

    public void setParameter(String catTitle) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }
    
    
}
