<%@page import="com.blog.dao.LikeDao"%>
<%@page import="java.util.List"%>
<%@page import="com.blog.entities.Post"%>
<%@page import="com.blog.dao.PostDao"%>
<%@page import="com.blog.helper.ConnectionProvider"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div class="row text-center">
        
<%
    Thread.sleep(400);
    PostDao d = new PostDao(ConnectionProvider.getConnection());
    
    int cid = Integer.parseInt(request.getParameter("cid"));
    
    List<Post> posts = d.getAllPosts();
    if(cid==0){
        posts = d.getAllPosts();
    }
    if(cid!=0){
        posts = d.getPostByCatId(cid);
    }
    
    
    if(posts.size()==0){
        out.println("<h3 class='display-4 text-center' style='font-size:23px;'>No Posts in this category...</h3>");
        return;
    }
    for(Post p : posts){
//    LikeDao likeDao = new LikeDao(ConnectionProvider.getConnection());
    
    int likes = 0;
    String str = p.getContent();
    String content = str.substring(0,90);
%>


<div class="card mb-4 ml-4" style="width: 18rem;">
  <img src="blog_images/<%= p.getPic() %>" class="card-img-top" alt="...">
  <div class="card-body">
    <h6 class="card-title"><%= p.getTitle() %></h6>
    <p class="card-text"><%= content %>...</p>
    
    <a href="view_blog.jsp?post_id=<%= p.getId() %>" class="btn btn-secondary primary-background btn-sm">Read More</a>
    
    
    <span class="badge badge-pill badge-secondary p-2"> <i class="bi bi-hand-thumbs-up"></i> <%= likes %></span>
    <span class="badge badge-pill badge-secondary p-2"> <i class="bi bi-chat-dots"></i> 56</span>
  </div>
</div>
        
<%
    }
%>
</div>