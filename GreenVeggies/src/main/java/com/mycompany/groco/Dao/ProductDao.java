/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.groco.Dao;

import com.mycompany.groco.entities.Product;
import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

/**
 *
 * @author rishu
 */
public class ProductDao {

    private SessionFactory factory;

    public ProductDao(SessionFactory factory) {
        this.factory = factory;
    }

    public boolean saveProduct(Product product) {
        boolean f = false;
        try {
            Session session = this.factory.openSession();
            Transaction tx = session.beginTransaction();
            session.save(product);
            tx.commit();
            session.close();
            f = true;
        } catch (Exception e) {
            e.printStackTrace();
            f = false;
        }
        return f;
    }

    public List<Product> getAllProducts() {
        List<Product> list = null;
        try {
            Session s = this.factory.openSession();
            Query query = s.createQuery("from Product");
            list = query.list();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public List<Product> getAllProductById(int cid) {
        List<Product> list = null;
        try {
            Session s = this.factory.openSession();
            Query query = s.createQuery("from Product as p where p.category.Id=: id");
            query.setParameter("id", cid);
            list = query.list();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
}
