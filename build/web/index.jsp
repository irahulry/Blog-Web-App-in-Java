<%@page import="com.blog.entities.User"%>
<%@page import="com.blog.helper.ConnectionProvider"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.blog.entities.Category"%>
<%@page import="com.blog.dao.PostDao"%>
<%@page import="java.sql.*"%>
<%
    User user = null;
    try{
        user = (User)session.getAttribute("currentUser");
    }
    catch(Exception e){
        
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
        <link href="css/style.css" rel="stylesheet" type="text/css"/>
        <style>
            .banner-background{
                clip-path: polygon(20% 0%, 100% 0, 100% 100%, 85% 95%, 56% 99%, 22% 91%, 0 100%, 0 0);
            }
        </style>
        
    </head>
    <body>
        <%
            Connection con = ConnectionProvider.getConnection();
        %>
        
        <!--NAVBAR-->
        <%@include  file="navbar.jsp" %>
        
        <div class="container-fluid p-0 m-0 banner-background" style="margin-top:-5px !important;">
            <div class="jumbotron primary-background text-white">
                <div class="container">
                    <h1 class="display-3">Welcome, to our BLOG!</h1>
                    <p>A programming language is a system of notation for writing computer programs.
                        Most programming languages are text-based formal languages, but they may also
                        be graphical. They are a kind of computer language.The description of a programming language 
                        is usually split into the two components of syntax (form) and semantics 
                        (meaning), which are usually defined by a formal language.
                         </p>
                         <a href="register.jsp" class="btn btn-outline-light btn-sm"><i class="bi bi-box-arrow-up-right"></i> Start ! its Free</a>
                        <a href="login.jsp" class="btn btn-outline-light btn-sm"><i class="bi bi-person-circle"></i> Login</a>
                </div>
            </div>
        </div>
        
        <!--CARDS-->
        <div class="container">
            <div class="row mb-2">
                <div class="col-md-4">
                    <div class="card">
                        <div class="card-body">
                          <h5 class="card-title">JAVA PROGRAMMING!</h5>
                          <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                          <a href="#" class="btn btn-primary">Go somewhere</a>
                        </div>
                    </div>
                </div>
                
                
                
                <div class="col-md-4">
                    <div class="card">
                        <div class="card-body">
                          <h5 class="card-title">JAVA PROGRAMMING!</h5>
                          <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                          <a href="#" class="btn btn-primary">Go somewhere</a>
                        </div>
                    </div>
                </div>
                
                
                <div class="col-md-4">
                    <div class="card">
                        <div class="card-body">
                          <h5 class="card-title">JAVA PROGRAMMING!</h5>
                          <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                          <a href="#" class="btn btn-primary">Go somewhere</a>
                        </div>
                    </div>
                </div>
                
            </div>
            <div class="row mb-2">
                <div class="col-md-4">
                    <div class="card">
                        <div class="card-body">
                          <h5 class="card-title">JAVA PROGRAMMING!</h5>
                          <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                          <a href="#" class="btn btn-primary">Go somewhere</a>
                        </div>
                    </div>
                </div>
                
                
                
                <div class="col-md-4">
                    <div class="card">
                        <div class="card-body">
                          <h5 class="card-title">JAVA PROGRAMMING!</h5>
                          <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                          <a href="#" class="btn btn-primary">Go somewhere</a>
                        </div>
                    </div>
                </div>
                
                
                <div class="col-md-4">
                    <div class="card">
                        <div class="card-body">
                          <h5 class="card-title">JAVA PROGRAMMING!</h5>
                          <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                          <a href="#" class="btn btn-primary">Go somewhere</a>
                        </div>
                    </div>
                </div>
                
            </div>
            
        </div>
        
        <script src="https://code.jquery.com/jquery-3.7.0.min.js" integrity="sha256-2Pmvv0kuTBOenSvLm6bvfBSSHrUJ+3A7x6P5Ebd07/g=" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct" crossorigin="anonymous"></script>
          <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js" integrity="sha512-AA1Bzp5Q0K1KanKKmvN/4d3IRKVlv9PYgwFPvm32nPO6QS8yH1HO7LbgB1pgiOxPtfeg5zEn2ba64MUcqJx6CA==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
       <script src="js/js.js"></script>
        
    </body>
</html>
