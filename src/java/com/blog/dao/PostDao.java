package com.blog.dao;

import com.blog.entities.Category;
import com.blog.entities.Post;
import java.util.ArrayList;
import java.sql.*;
import java.sql.Timestamp;
import java.util.List;


public class PostDao {
    
    Connection con;
    
    public PostDao(Connection con){
        this.con = con;
    }
    
    public ArrayList<Category> getAllCategories(){
        
        ArrayList<Category> list = new ArrayList<Category>();
        
        
        try{
            String q = "select * from categories ";
            Statement statement = this.con.createStatement();
            
            ResultSet rs = statement.executeQuery(q);
            
            Category c=null;
             while(rs.next()){
                 int cid = rs.getInt("id");
                 String name= rs.getString("name");
                 String description= rs.getString("description");
                 
                 c= new Category(cid,name,description);
                 
                 list.add(c);
             }
            
            
            
        }
        catch(Exception e){
            
        }
        
        return list;
    }
    
    public boolean savePost(Post post){
        boolean f = false;
        
        try{
            String q = "INSERT INTO `posts`(`id`, `title`, `content`, `code`, `image`, `catId`, `userId`) VALUES (null,?,?,?,?,?,?)";
            PreparedStatement ps = con.prepareStatement(q);
            
            ps.setString(1, post.getTitle());
            ps.setString(2, post.getContent());
            ps.setString(3, post.getCode());
            ps.setString(4, post.getPic());
            ps.setInt(5, post.getCatId());
            ps.setInt(6, post.getUserId());
            
            ps.executeUpdate();
            
            f=true;
            
            
        }
        catch(Exception e){
            e.printStackTrace();
        }
        return f;
    }
    
    public boolean updatePost(Post post){
        boolean f = false;
        
        try{
            System.out.println("\n\n\n\n\nUPDATE POST\n\n\n#############################\n##################################|n\n##############################|n\n#############################|n\n##########################");
            String q = "UPDATE posts SET title = ?, content=?,code=?,image=?,catId=?  WHERE `posts`.`id` = ?";
            PreparedStatement ps = con.prepareStatement(q);
            
            ps.setString(1, post.getTitle());
//            ps.setString(2, post.getContent());
//            ps.setString(3, post.getCode());
//            ps.setString(4, post.getPic());
//            ps.setInt(5, post.getCatId());
            ps.setString(2, post.getContent());
            ps.setString(3, post.getCode());
            ps.setString(4, post.getPic());
            ps.setInt(5, post.getCatId());
            ps.setInt(6, post.getId());
            
            
            
            System.out.println(ps);
            ps.executeUpdate();
            
            f=true;
            
            
        }
        catch(Exception e){
            e.printStackTrace();
        }
        return f;
    }
    
    public int getLatestPostId(int userId){
        int id = 0;
        
        try{
            String q = "select id from posts where userId =20 ORDER BY id DESC Limit 0,1";
            PreparedStatement ps = con.prepareStatement(q);
//            ps.setInt(1, userId);
            
            
            ResultSet rs = ps.executeQuery(q);
             while(rs.next()){
                 id= rs.getInt("id");
                 
             }
            
            
            
        }
        catch(Exception e){
            e.printStackTrace();
        }
        return id;
    }
    
    
    //    GET ALL POST
    public List <Post> getAllPosts(){
        List<Post> list = new ArrayList<>();
        //        FETCH ALL POSTS
        try{
            PreparedStatement ps = con.prepareStatement("select * from posts order by id desc");
            
            ResultSet set = ps.executeQuery();
            
            while(set.next()){
                int pid = set.getInt("id");
                String title = set.getString("title");
                String content = set.getString("content");
                String code = set.getString("code");
                String image = set.getString("image");
                Timestamp date =(Timestamp) set.getTimestamp("date");
                int catId = set.getInt("catId");
                int userId = set.getInt("userId");
                
                Post p = new Post(pid, title, content, code, image, date, catId, userId);
                
                list.add(p);
            }
            
                    
        }
        catch(Exception e){
            
        }
        
        
        return list;
    }
    
    public List <Post> getPostByCatId(int catId){
        List<Post> list = new ArrayList<>();
        //        GET POSTS BY ID
        try{
            PreparedStatement ps = con.prepareStatement("select * from posts where catId=?  order by id desc");
            ps.setInt(1, catId);
            ResultSet set = ps.executeQuery();
            
            while(set.next()){
                int pid = set.getInt("id");
                String title = set.getString("title");
                String content = set.getString("content");
                String code = set.getString("code");
                String image = set.getString("image");
                Timestamp date =(Timestamp) set.getTimestamp("date");
                int userId = set.getInt("userId");
                
                Post p = new Post(pid, title, content, code, image, date, catId, userId);
                list.add(p);
            }
            
                    
        }
        catch(Exception e){
            
        }
        return list;
    }
    
    
    
    
    public Post getPostById(int postId){
        Post post=null;
        try{
            String q = "select * from posts where id=?";
            PreparedStatement ps = this.con.prepareStatement(q);
            ps.setInt(1, postId);
            post = new Post();
            ResultSet set = ps.executeQuery();
            
            if(set.next()){
                int pid = set.getInt("id");
                String title = set.getString("title");
                String content = set.getString("content");
                String code = set.getString("code");
                String image = set.getString("image");
                Timestamp date =(Timestamp) set.getTimestamp("date");
                int catId = set.getInt("catId");
                int userId = set.getInt("userId");
                
                Post post2 = new Post(pid, title, content, code, image, date, catId, userId);
                post = new Post(pid, title, content, code, image, date, catId, userId);
                return post2;
                
            }
            
        }
        catch(Exception e){
            e.printStackTrace();
            System.out.println("ERRROr\n####################################################\n############################################################\n#########################################################################\n##################################################################################\n###################################################");
        }
        
        return post;
        
    }
    
    
    
}
