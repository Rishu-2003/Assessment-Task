
package com.mycompany.groco.Dao;


import com.mycompany.groco.helper.FactoryProvider;
import java.util.HashMap;
import java.util.Map;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

public class GetCountDao {
    public static Map<String,Long> getCounts(SessionFactory factory){
        Session session = factory.openSession();
        
        String q1="select count(*) from User";
        String q2="select count(*) from Product";
        
        Query query1=session.createQuery(q1);
        Query query2=session.createQuery(q2);
        Long userCount=(Long)query1.list().get(0);
        Long productCount=(Long)query2.list().get(0);
        
        Map<String,Long>mp=new HashMap<>();
        mp.put("userCount", userCount);
        mp.put("productCount", productCount);
        session.close();
        
        return mp;
    }
//    public static void main(String []args){
//        SessionFactory factory=FactoryProvider.getFactory();
//        
//        System.out.println("Total user is "+GetCountDao.getCounts(factory).get("userCount"));
//    }
}
