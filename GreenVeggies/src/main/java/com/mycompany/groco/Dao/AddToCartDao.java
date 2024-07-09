package com.mycompany.groco.Dao;

import com.mycompany.groco.entities.Cart;
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
public class AddToCartDao {

    private SessionFactory factory;

    public AddToCartDao(SessionFactory factory) {
        this.factory = factory;
    }
    public void saveCart(Cart cart) {
        Session session = this.factory.openSession();
        Transaction tx = session.beginTransaction();
        session.save(cart);
        tx.commit();
        session.close();
    }
    public List<Cart> getAllCartItemById(int Id) {
        List<Cart> list = null;
        try {
            Session s = this.factory.openSession();
            Query query = s.createQuery("from Cart where userId=: x");
            query.setParameter("x", Id);
            list = query.list();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
    public int getCountCartProduct(int id) {
        int n = 0;
        List<Cart> list = null;
        try {
            Session s = this.factory.openSession();
            Query query = s.createQuery("from Cart where userId=:x");
            query.setParameter("x", id);
            list = query.list();
        } catch (Exception e) {
            e.printStackTrace();
        }
        n = list.size();
        return n;
    }
    public float getSumPriceOfCartProduct(int id) {
        float price = 0;
        try {
            Session s = this.factory.openSession();
            Query query = s.createQuery("select sum(price) from Cart where userId=: id");
            query.setParameter("id", id);
            price = (float) query.uniqueResult();
            s.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return price;
    }
    public int deleteCartProduct(int id) {
        int i = 0;
        try {
            Session s = this.factory.openSession();
            Transaction tx = s.beginTransaction();
            Query query = s.createQuery("delete from Cart where Id=: id");
            query.setParameter("id", id);
            i = query.executeUpdate();
            tx.commit();

            s.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return i;
    }
}
