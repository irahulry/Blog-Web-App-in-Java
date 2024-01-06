package com.blog.helper;
import java.sql.*;


public class ConnectionProvider {
    private static Connection con;
    public static Connection getConnection(){
        
        try{
            
            if(con == null){
                //Loading Driver Class
                Class.forName("com.mysql.cj.jdbc.Driver");

                //Create Connection
                con = DriverManager.getConnection("jdbc:mysql://localhost:3306/blog","root","");
            
            }
            
        }
        catch (Exception e){
            e.printStackTrace();
        }
        
        
        
        return con;
        
        
        
    }
}
