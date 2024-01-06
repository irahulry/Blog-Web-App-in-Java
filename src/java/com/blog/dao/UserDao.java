
package com.blog.dao;

import com.blog.entities.User;
import java.sql.*;

public class UserDao {
    private Connection con;
    
    public UserDao(Connection con){
        this.con = con;
    }
    
    public boolean saveUser(User user)
    {
        boolean f = false;
        try{
            //USER--> DataBase
            String query = "insert into user(name,email,password,gender,about) values (?,?,?,?,?)";
            PreparedStatement ps = this.con.prepareStatement(query);
            ps.setString(1, user.getName());
            ps.setString(2, user.getEmail());
            ps.setString(3, user.getPassword());
            ps.setString(4, user.getGender());
            ps.setString(5, user.getAbout());
            
            ps.executeUpdate();
            f=true;
        }
        catch(Exception e){
            e.printStackTrace();
        }
        return f;
    }
    
//    GET USER BY USER EMAIL AND PASSWORD
    public User getUserByEmailAndPassword(String email, String password) {
    
    
        User user = null;
        
        try{
            String query = "select * from user where email=? and password=?";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, email);
            ps.setString(2, password);
            
            ResultSet set = (ResultSet)ps.executeQuery();
           
            if(set.next()){
                user = new User();
//                String name = set.getString("name");
                user.setName(set.getString("name"));
                user.setId(set.getInt("id"));
                user.setEmail(set.getString("email"));
                user.setPassword(set.getString("password"));
                user.setGender(set.getString("gender"));
                user.setAbout(set.getString("about"));
                user.setProfile(set.getString("profile"));
                user.setDateTime(set.getTimestamp("r_date"));
                
                
            }
        }
        catch(Exception e){
            e.printStackTrace();
        }
        return user;
        
    }
    
    public boolean updateUser(User user){
        boolean f = false;
        System.out.println("USER DAO RUNNING");
        try{
        
            String query = "update user set name=? , email=?, password=?, about=?, profile=? where id=?";
            
             PreparedStatement ps = con.prepareStatement(query);
             ps.setString(1, user.getName());
             ps.setString(2, user.getEmail());
             ps.setString(3, user.getPassword());
             ps.setString(4, user.getAbout());
             ps.setString(5, user.getProfile());
             ps.setInt(6, user.getId());
             
             ps.executeUpdate();
             f=true;
             
             
        }
        catch(Exception e){
            
        }
        return f;
    }
    
    
    public User getUserById(int userId){
        User user=null;
        
        try{
            String q = "select * from user where id=?";
             PreparedStatement ps = this.con.prepareStatement(q);
            ps.setInt(1, userId);
            
            ResultSet set = (ResultSet)ps.executeQuery();
           
            if(set.next()){
                user=new User();
//                String name = set.getString("name");
                user.setName(set.getString("name"));
                user.setId(set.getInt("id"));
                user.setEmail(set.getString("email"));
                user.setPassword(set.getString("password"));
                user.setGender(set.getString("gender"));
                user.setAbout(set.getString("about"));
                user.setProfile(set.getString("profile"));
                user.setDateTime(set.getTimestamp("r_date"));
                
                
            }
        }
        catch(Exception e){
            user = new User();
            user.setName("DEFAULT USER");
            
        }
     
        return user;
    }
}

