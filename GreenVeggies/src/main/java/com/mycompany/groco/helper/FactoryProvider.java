package com.mycompany.groco.helper;

import com.mycompany.groco.entities.User;
import java.io.IOException;
import java.io.Serializable;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;


public class FactoryProvider {
    private static SessionFactory factory;
    public static SessionFactory getFactory(){
        
        try{
            factory =new Configuration().configure("hibernate.cfg.xml").buildSessionFactory();
        }catch(Exception e){
            e.printStackTrace();
        }
        return factory;    
    }
    
}
