
package railwaysreservation;

import java.sql.*;
public class DatabaseConnection {
    private static Connection con;
    public static Connection getConnection() {
        String url="jdbc:oracle:thin:@localhost:1521:xe";
        try{
            Class.forName("oracle.jdbc.driver.OracleDriver");
            con=DriverManager.getConnection(url,"system","cimage");
        
        }catch(Exception e){
            System.out.println("Connection Fail....");
        }
        return con;
    }
}
