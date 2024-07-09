package com.mycompany.groco.Dao;

import com.mycompany.groco.entities.User;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

/**
 *
 * @author rishu
 */
public class UserDao {
    private SessionFactory factory;
    public UserDao(SessionFactory factory) {
        this.factory=factory;
    }

   public User getUserByEmailAndPassword(String email,String password)
   {
       User user=null;
       try{
           String query="from User where userEmail =:e and password =:p";
           Session session=this.factory.openSession();
           Query q=session.createQuery(query);
           q.setParameter("e", email);
           q.setParameter("p",password);
           user=(User)q.uniqueResult();
           session.close();
       }catch(Exception e){
           e.printStackTrace();
       }
       
       return user;
   }
   public boolean getUser(String email)
   {
       boolean b=false;
       try{
           String query="from User where userEmail =:e ";
           Session session=this.factory.openSession();
           Query q=session.createQuery(query);
           q.setParameter("e", email);
           q.uniqueResult();
           b=true; 
           session.close();
       }catch(Exception e){
           e.printStackTrace();
       }
       return b;
   }
    public void getForgotPassword(String password,String email)
   {
       try{
           String query="update User set password =:p where userEmail =:e";
           Session session=this.factory.openSession();
           Transaction tx=session.beginTransaction();
           Query q=session.createQuery(query);
           q.setParameter("p", password);
           q.setParameter("e", email);
           q.executeUpdate();
           tx.commit();
           session.close();
           
       }catch(Exception e){
           e.printStackTrace();
       }
      
   }
  

    
}
