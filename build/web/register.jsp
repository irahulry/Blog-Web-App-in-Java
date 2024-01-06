<%@page import="com.blog.entities.User"%>
<%@page import="com.blog.helper.ConnectionProvider"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.blog.entities.Category"%>
<%@page import="com.blog.dao.PostDao"%>
<%@page import="java.sql.*"%>
<%@page import="com.blog.entities.User"%>
<%@page import="com.blog.entities.Message"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    User user = null;
    try{
        user = (User)session.getAttribute("currentUser");
    }
    catch(Exception e){
        
    }if(user!=null){
        response.sendRedirect("index.jsp");
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Signup Page</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
        <script src="https://code.jquery.com/jquery-3.7.0.min.js" integrity="sha256-2Pmvv0kuTBOenSvLm6bvfBSSHrUJ+3A7x6P5Ebd07/g=" crossorigin="anonymous"></script>
        <link href="css/style.css" rel="stylesheet" type="text/css"/>
        <style>
            .banner-background{
                clip-path: polygon(30% 0%, 70% 0%, 100% 0, 100% 95%, 69% 100%, 38% 89%, 0 98%, 0 0);
            }
            .align-center-item{
                display: flex;
                align-content: center;
                align-items:center;
                justify-content: center;
                
            }
        </style>
    </head>
    <body>
        <%@include file="navbar.jsp" %>
        <div style="padding-bottom:200px;" class="banner-background align-center-item primary-background">
            <div class="row" style="width:100%;" >
                <div class="col-md-4 mx-auto">
                    <div class="card">
                        <div class="card-header text-center primary-background text-white">
                            <h1><i class="bi bi-person-plus-fill"></i></h1>
                            <h5>Login Here</h5>
                        </div>
                        <div class="card-body">
                            <form method="post" id="reg-form" action="RegisterServlet">
                                 <div class="form-group">
                                  <label for="user_name">Username</label>
                                  <input type="text" class="form-control" id="user_name" name="user_name" placeholder="Enter Username">
                                </div>
                                <div class="form-group">
                                  <label for="email">Email address</label>
                                  <input type="email" class="form-control" id="email" name="email" aria-describedby="emailHelp" placeholder="Enter email">
                                  <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
                                </div>
                                <div class="form-group">
                                  <label for="password">Password</label>
                                  <input type="password" class="form-control" id="password" name="password" placeholder="Password">
                                </div>
                                <div class="form-group form-check">
                                  <label for="Gender">Gender</label>
                                  <br/>
                                  <input type="radio" id="male" name="gender" value="Male"> 
                                  <label class="form-check-label" for="male">Male</label>
                                  <input type="radio" id="female" name="gender" value="Female">  
                                  <label class="form-check-label" for="female">Female</label>
                                </div>
                                
                                <div class="form-group">
                                    <textarea class="form-control" name="about" Placeholder="Enter something about yourself!" id="about" name="about" rows="2" cols="10"></textarea>
                                </div>
                                
                                <div class="form-group form-check">
                                  <input type="checkbox" name="check" class="form-check-input" id="check">
                                  <label class="form-check-label" for="check">Agree Terms & Conditions!</label>
                                </div>
                                
                                <div class="container text-center" id="loader" style="display:none;">
                                    <div class="spinner-border text-primary" role="status">
                                        <span class="sr-only">Loading...</span>
                                    </div><br/>
                                    <span class="text-primary">Registering...</span>
                                </div>
                                
                                <button type="submit" id="submit-btn" class="btn btn-primary">Submit</button>
                            </form><br/>
                            <a href="login.jsp">Already have an account! </a>
                            
                        </div>
                    </div>
                </div>
            </div>
        </div>
        
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct" crossorigin="anonymous"></script>
        <script src="js/js.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js" integrity="sha512-AA1Bzp5Q0K1KanKKmvN/4d3IRKVlv9PYgwFPvm32nPO6QS8yH1HO7LbgB1pgiOxPtfeg5zEn2ba64MUcqJx6CA==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
        <script>
            $(document).ready(function(){
                console.log("LOADED");
                
                
                $('#reg-form').on('submit',function(event){
                    event.preventDefault();
                    let form = new FormData(this);
                    
                    console.log("SUB");
                    
                    $("#submit-btn").hide();
                    $("#loader").show();
                    
                    $.ajax({
                        url:"RegisterServlet",
                        type:'post',
                        data:form,
                        success: function(data,textStatus,jqXHR){
                            console.log(data)
                            
                            if(data.trim()=="submitted"){
                                
                                swal("Registered Successfully!", "Your account is registered Succussfully! We are redirecting you to Login Page.", "success")
                                    .then((value) => {
                                      window.location = "login.jsp"
                                    });
                            }
                            else{ 
                                swal("Error!", data, "error");
                            }
                            
                            
                            $("#submit-btn").show();
                            $("#loader").hide();
                        },
                        error: function (jqXHR, textStatus,errorThrown){
                            console.log(jqXHR);$("#submit-btn").show();
                            $("#loader").hide();
                            swal("Error!", "Something went wrong!", "error");
                        },
                        processData:false,
                        contentType:false
                        
                        
                    });
                    
                    
                    
                    
                });
                
            });
        </script>
        
    </body>
</html>
