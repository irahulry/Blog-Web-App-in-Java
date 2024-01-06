<%@page import="java.util.ArrayList"%>
<%@page import="com.blog.entities.Category"%>
<%@page import="com.blog.dao.PostDao"%>
<%@page import="com.blog.helper.ConnectionProvider"%>
<%@page import="com.blog.entities.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page errorPage="error.jsp" %>
<%
    User user = (User)session.getAttribute("currentUser");
    
    if(user==null){
        response.sendRedirect("login.jsp");
    }
    
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Profile</title><link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
        <link href="css/style.css" rel="stylesheet" type="text/css"/>
        <style>
            .banner-background{
                clip-path: polygon(50% 0%, 100% 0, 100% 35%, 100% 100%, 86% 93%, 40% 99%, 19% 93%, 0 100%, 0% 35%, 0 0);
            }
            
        </style>
        
    </head>
    <body>
        <!--NAVBAR-->
        
        <nav class="navbar navbar-expand-lg navbar-dark bg-dark primary-background">
            <a class="navbar-brand" href="index.jsp"><i class="bi bi-stars"></i> BLOGS</a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
              <span class="navbar-toggler-icon"></span>
            </button>

            <div class="collapse navbar-collapse" id="navbarSupportedContent">
              <ul class="navbar-nav mr-auto">
                <li class="nav-item active">
                  <a class="nav-link" href="#"><i class="bi bi-house"></i> Home <span class="sr-only">(current)</span></a>
                </li>
                <li class="nav-item">
                  <a class="nav-link" href="#"><i class="bi bi-telephone"></i> Contact us</a>
                </li>
                <li class="nav-item">
                  <a class="nav-link" href="#"   data-toggle="modal" data-target="#postModal"><i class="bi bi-patch-plus-fill"></i>  New Post</a>
                </li>
                <li class="nav-item dropdown">
                  <a class="nav-link dropdown-toggle" href="#" role="button" data-toggle="dropdown" aria-expanded="false">
                    <i class="bi bi-list-check"></i> Category
                  </a>
                    
                  <div class="dropdown-menu">
                    <a class="dropdown-item" href="#">Technology</a>
                    <a class="dropdown-item" href="#">Money Making</a>
                    <div class="dropdown-divider"></div>
                    <a class="dropdown-item" href="#">YouTube</a>
                  </div>
                </li>
              </ul>
             
                <ul class="navbar-nav mr-right">
                    
                    
                    <li class="nav-item">
                      <a class="nav-link" href="#"  data-toggle="modal" data-target="#profileModal"><i class="bi bi-person-circle"></i> <%= user.getName() %></a>
                    </li>
                    
                    <li class="nav-item">
                      <a class="nav-link btn" id="logout-btn" onClick="logout()"><i class="bi bi-box-arrow-right"></i> Logout</a>
                    </li>
                    
                </ul>
            </div>
          </nav>
        
        
        <!-- Button trigger modal -->
<!--        <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#staticBackdrop">
          Launch static backdrop modal
        </button>-->

      
        <main>                                  
            <div class="container-fluid">

                <div class="row mt-4">
                    <div class="col-md-3">
                        <!--Categories-->
                        
                        <div class="list-group">
                            <button type="button" onClick="getPost(0,this)"class="c-link list-group-item list-group-item-action primary-background " aria-current="true">
                              All Posts
                            </button>
                            
                        
                            <%
                                PostDao d = new PostDao(ConnectionProvider.getConnection());
                                ArrayList<Category> list1 = d.getAllCategories();
                                for(Category cc: list1){
                                
                                
                            %>
                                
                            <button type="button" onClick="getPost(<%= cc.getCid() %>,this)" class="c-link list-group-item list-group-item-action"><%= cc.getName() %></button>
                            <%
                                }
                            %>
                        </div>
                    </div>
                    
                    <!--SECOND COL-->
                    <div class="col-md-9" >
                        <!--POST-->
                        <div class="container text-center" id="loader1">
                            <div class="spinner-border text-secondary" role="status">
                                <span class="sr-only">Loading...</span>
                            </div><br/>
                            <span class="font-weight-bold">Loading...</span>
                        </div>
                        <div class="" id="post-container">
                        
                        </div>
                    </div>
                    
                    
                </div>



            </div>
        </main>
                                            

                                            
                                                                                
                    
                    
                    
        <script src="https://code.jquery.com/jquery-3.7.0.min.js" integrity="sha256-2Pmvv0kuTBOenSvLm6bvfBSSHrUJ+3A7x6P5Ebd07/g=" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct" crossorigin="anonymous"></script>
          <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js" integrity="sha512-AA1Bzp5Q0K1KanKKmvN/4d3IRKVlv9PYgwFPvm32nPO6QS8yH1HO7LbgB1pgiOxPtfeg5zEn2ba64MUcqJx6CA==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
       <script src="js/js.js"></script>
        <script>
           
        </script>
    </body>
</html>
