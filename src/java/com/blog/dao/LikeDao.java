package com.blog.dao;

import java.sql.PreparedStatement;
import java.sql.*;
import java.sql.*;

public class LikeDao {
    
    Connection con;

    public LikeDao(Connection con) {
        this.con = con;
    }
    
    
    
    
    public boolean insertLike(int pid, int uid){
        boolean f = false;
        try{
            String q= "insert into likes (pid,uid) values (?,?)";
            PreparedStatement p = this.con.prepareStatement(q);
            //
            p.setInt(1, pid);
            p.setInt(2, uid);
            
            p.executeUpdate();
            f=true;
        }
        
        catch(Exception e){
            e.printStackTrace();
        }
        
        return f;
    }
    
    public int countLike(int pid){
        int likes = 0;
        try{
            String q= "select count(id) from likes where pid=?";
            PreparedStatement p = this.con.prepareStatement(q);
            //
            p.setInt(1, pid);
            
            ResultSet rs = p.executeQuery();
            if(rs.next()){
                likes=rs.getInt("count(id)");
            }
        }
        
        catch(Exception e){
            e.printStackTrace();
        }
        
        return likes;
    }
    public boolean isLikedByUser(int pid,int userId){
        boolean f = false;
        
        try{
            String q= "select * from likes where pid=? and uid=?";
            PreparedStatement p = this.con.prepareStatement(q);
            //
            p.setInt(1, pid);
            p.setInt(2, userId);
            
            ResultSet rs = p.executeQuery();
            if(rs.next()){
                f=true;
            }
        }
        
        catch(Exception e){
            e.printStackTrace();
        }
        
        
        return f;
    }
    
    
    public boolean deleteLike(int pid,int uid){
        boolean f = false;
        
        try{
            PreparedStatement ps = this.con.prepareStatement("delete from likes where pid=? and uid=?");
            ps.setInt(1, pid);
            ps.setInt(2, uid);
            ps.executeUpdate();
            f=true;
            
        }
        catch(Exception e){
            e.printStackTrace();
        }
        
        return f;
    }
}
