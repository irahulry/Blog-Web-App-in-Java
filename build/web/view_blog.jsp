
<%@page import="com.blog.dao.LikeDao"%>
<%@page import="java.text.DateFormat"%>
<%@page import="com.blog.dao.UserDao"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.blog.entities.Category"%>
<%@page import="com.blog.entities.Category"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.blog.entities.Post"%>
<%@page import="com.blog.dao.PostDao"%>
<%@page import="com.blog.helper.ConnectionProvider"%>
<%@page import="com.blog.entities.User"%>
<%@page errorPage="error.jsp" %>
<%
    User user = (User) session.getAttribute("currentUser");
    if(user==null){
        response.sendRedirect("login.jsp");
    }
    
  
//    
%>

<%      String btnclass = "";
        String operationtodo = "Like";
    int postId = Integer.parseInt(request.getParameter("post_id"));
    
    PostDao d = new PostDao(ConnectionProvider.getConnection());
    Post p = d.getPostById(postId);
    
    UserDao ud = new UserDao(ConnectionProvider.getConnection());
    User getPostedBy = ud.getUserById(p.getUserId());
    String postedBy = getPostedBy.getName();
    
    LikeDao likeDao = new LikeDao(ConnectionProvider.getConnection());
    
    int likes = likeDao.countLike(postId);
    
    boolean likedByMe = likeDao.isLikedByUser(postId, p.getUserId());
    if(likedByMe){
        btnclass = "-fill";
        operationtodo = "Dislike";
    }
    else{
        btnclass = "";
        operationtodo = "Like";
    }
//    try {       
//           String _24HourTime = p.getDate().toInstant().atZone("Asia/Kolkata").toLocalDate();
//           SimpleDateFormat _24HourSDF = new SimpleDateFormat("HH:mm");
//           SimpleDateFormat _12HourSDF = new SimpleDateFormat("hh:mm a");
//           Date _24HourDt = _24HourSDF.parse(_24HourTime);
//           System.out.println(_24HourDt);
//           System.out.println(_12HourSDF.format(_24HourDt));
//       } catch (Exception e) {
//           e.printStackTrace();
//       }
%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title><%= p.getTitle() %></title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
        <link href="css/style.css" rel="stylesheet" type="text/css"/>
        <style>
            .banner-background{
                clip-path: polygon(50% 0%, 100% 0, 100% 35%, 100% 100%, 86% 93%, 40% 99%, 19% 93%, 0 100%, 0% 35%, 0 0);
            }
            body{
/*                background: url("images/bg.jpg");
                background-size: cover;
                background-attachment: fixed;*/
                
            }
        </style>
        
    </head>
    <body>
        
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
                    
                    
                     <!-- ########################## PROFILE Modal ###################################-->
        <!-- ########################## PROFILE Modal ###################################-->
        <!-- ########################## PROFILE Modal ###################################-->
        <div class="modal fade" id="profileModal" data-backdrop="static" data-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
          <div class="modal-dialog">
            <div class="modal-content">
              <div class="modal-header  primary-background text-white">
                <h5 class="modal-titletext-white" id="staticBackdropLabel"><%= user.getName() %></h5>
                <button type="button" class="close  text-white" data-dismiss="modal" aria-label="Close">
                  <span aria-hidden="true">&times;</span>
                </button>
              </div>
              <div class="modal-body">
                  <div class="container text-center">
                      <img class="img-fluid sqr_pic" src="images/<%= user.getProfile() %>" style="border-radius: 100%;max-width: 100px" alt="alt"/>
                      <h5 class="modal-title" id="profileModal" ><%= user.getName() %></h5><br/>
                      <table class="table table-bordered" id="profileDetails">
                      
                        <tbody>
                          <tr>
                            <th scope="col">ID</th>
                            <th scope="col"><%= user.getId() %></th>
                          </tr>
                          <tr>
                            <th scope="row">Email</th>
                            <td><%= user.getEmail() %></td>
                          </tr>
                          <tr>
                            <th scope="row">Gender</th>
                            <td><%= user.getGender() %></td>
                          </tr>
                          <tr>
                            <th scope="row">About</th>
                            <td><%= user.getAbout() %></td>
                          </tr>
                          <tr>
                            <th scope="row">Registered</th>
                            <td><%= user.getDateTime() %></td>
                          </tr>
                        </tbody>
                      </table>
                          
                          <div id="profileEdit" style="display:none;">
                              <form action="EditServlet" method="post" enctype="multipart/form-data">
                                  <table class="table table-borderless" id="profileDetails">
                                    <tbody>
                                      <tr>
                                        <th scope="col">ID</th>
                                        <th scope="col"><input type="text" class="form-control" id="id" name="id" value="<%= user.getId() %>" disabled/></th>
                                      </tr>
                                      <tr>
                                        <th scope="row">Name</th>
                                        <td><input type="text" class="form-control" id="name"  name="name" value="<%= user.getName() %>"/></td>
                                      </tr>
                                      <tr>
                                        <th scope="row">Email</th>
                                        <td><input type="text" class=" form-control" id="email"  name="email"  value="<%= user.getEmail() %>"/></td>
                                      </tr>
                                      <tr>
                                        <th scope="row">Password</th>
                                        <td><input type="password" class=" form-control" id="password"  name="password"  value="<%= user.getPassword() %>"/></td>
                                      </tr>
                                      <tr>
                                        <th scope="row">Gender</th>
                                        <td><input type="text"class="  form-control" id="gender"  name="gender"  value="<%= user.getGender() %>" disabled/></td>
                                      </tr>
                                      <tr>
                                        <th scope="row">About</th>
                                        <td><textarea type="text" class="form-control" id="about"  name="about" rows="3"><%= user.getAbout() %></textarea></td>
                                      </tr>
                                      <tr>
                                        <th scope="row">Profile Pic</th>
                                        <td><input type="file" name="file" id="filef" ></td>
                                      </tr>
                                  </table>
                                      
                                    <button type="submit" name="submit" class="btn btn-primary">Save</button>
                              </form>
                          </div>
                  </div>
              </div>
              <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                <button type="button" id="edit-profile-btn" class="btn btn-primary">Edit</button>
              </div>
            </div>
          </div>
        </div>
                    
                    
                    <%
                        String msg = (String) session.getAttribute("message");
                        if(msg!=null){
                            out.println(msg);
                            session.removeAttribute("message");
                        }
                    
                    %>
                    
                    
                    
                    
                    
        <!-- ########################## POST Modal ###################################-->
        <!-- ########################## POST Modal ###################################-->
        <!-- ########################## POST Modal ###################################-->
        <div class="modal fade" id="postModal" data-backdrop="static" data-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
          <div class="modal-dialog">
            <div class="modal-content">
              <div class="modal-header ">
                <h5 class="modal-title " id="staticBackdropLabel">New Post</h5>
                <button type="button" class="close  " data-dismiss="modal" aria-label="Close">
                  <span aria-hidden="true">&times;</span>
                </button>
              </div>
              <div class="modal-body">
                  <div class="container text-center">
                      
                     
                          <div id="post">
                                <div class="alert " id="msg" style="display:none;" role="alert">
                                    <!--MESSAGE-->
                                </div>
                             
                              <form action="#" id="AddPost" method="post" enctype="multipart/form-data">
                                    <div class="form-group">
                                        
                                        <input type="hidden" value="0" name="LatestId" id="LatestId"/>
                                        <select class="form-control" name="catId" id="catId">
                                            
                                            <option disabled selected>-- SELECT CATEGORY --</option>
                                            <%
//                                                int i = 0;
                                        
                                                PostDao cat = new PostDao(ConnectionProvider.getConnection());
                                                ArrayList<Category> list = cat.getAllCategories();
                                                
                                                for(Category c : list){
//                                               
                                            %>                                            
                                            
                                            <option value="<%= c.getCid()%>"><%= c.getName() %></option>
                                            <%
                                            
                                                }
                                            %>
                                            
                                        </select>
                                        
                                    </div>
                                  
                                    <div class="form-group">
                                        <input type="text" class="form-control" name="title" id="title" placeholder="Enter Title Here...."/>
                                    </div>
                                  
                                  
                                    <div class="form-group">
                                        <textarea class="form-control" placeholder="Enter Content here..." name="content" id="content" rows="5"></textarea>
                                    </div>
                                  
                                  
                                    <div class="form-group">
                                        <textarea class="form-control" placeholder="Enter Code here..." name="code" id="code" rows="5"></textarea>
                                    </div>
                                  
                                    <div class="form-group">
                                        <input type="file" class="form-control" name="file" id="file" />
                                    </div>
                                  
                                          <div class="modal-footer">
                                            <button type="button" id="closeBtn" class="btn btn-secondary" onClick="ResetForm()" data-dismiss="modal">Close</button>
                                            <button type="submit" id="addPostBtn"  class="btn btn-primary">Post Now</button>
                                            <div class="spinner-border text-primary" style="display:none;" id="loader" role="status">
                                                <span class="sr-only">Loading...</span>
                                            </div>
                                          </div>  
                              </form>
                          </div>
                  </div>
              </div>
              
            </div>
          </div>
        </div>
      
                                            
        <div class="container-fluid mt-4">
            <div class="row">
                
            
                <div class="col-md-12 col-lg-8">


                    <div class=" p-2">


                        <h3 class="font-weight-normal"><%= p.getTitle() %></h3>

                        <div class="row my-3">
                            <div class="col-md-8">
                                <p style="opacity: 0.8" class="font-weight-bolder"><i class="bi bi-calendar"></i> <%= DateFormat.getDateTimeInstance().format(p.getDate()) %></p>
                            </div>
                             <div class="col-md-4">
                                 <p style="opacity: 0.8" class="font-weight-bold">Posted By: <a href="#"><%= postedBy.toUpperCase() %></a></p>
                            </div>
                        </div>

                            <center>
                        <img class="blog_img text-center" src="blog_images/<%= p.getPic() %>" class="img-fluid rounded" alt="alt"/>
                            </center>
                        <p class="col-md-12 mt-4 " id="post-content"><%= p.getContent() %></p>

                        <br/><!-- comment -->


                        <button type="button" class="btn btn-primary" onClick="doLike(<%= p.getId() %>,<%= user.getId() %>,'<%= operationtodo %>')" id="likeBTN"><i id="likeDislikeBtn" class="bi bi-hand-thumbs-up<%= btnclass %>"></i> <span id="totalLikes"><%= likes %></span></button>

                        <button type="button" class="btn btn-primary"><i class="bi bi-chat-dots"></i> 79</button>



                    </div>
                </div> 
                    
                <div class="col-lg-4 ">
                   <ul class="list-unstyled">
                        <li class="media">
                          <img src="blog_images/<%= p.getPic() %>" height="100px" class="myimg mr-3" alt="...">
                          <div class="media-body">
                            <h5 class="mt-0 mb-1">List-based media object</h5>
                            <p>All my girls vintage Chanel baby. So you can have your cake. Tonight, tonight, tonight, I'm walking on air. Slowly swallowing down my fear, yeah yeah. Growing fast into a bolt of lightning. So hot and heavy, 'Til dawn. That fairy tale ending with a knight in shining armor. Heavy is the head that wears the crown.</p>
                          </div>
                        </li>
                        <li class="media my-4">
                          <img src="blog_images/<%= p.getPic() %>"  width="60px"  class="myimg mr-3" alt="...">
                          <div class="media-body">
                            <h5 class="mt-0 mb-1">List-based media object</h5>
                            <p>Maybe a reason why all the doors are closed. Cause once you’re mine, once you’re mine. Be your teenage dream tonight. Heavy is the head that wears the crown. It's not even a holiday, nothing to celebrate. A perfect storm, perfect storm.</p>
                          </div>
                        </li>
                        <li class="media">
                          <img src="blog_images/<%= p.getPic() %>" width="60px"  class="myimg mr-3" alt="...">
                          <div class="media-body">
                            <h5 class="mt-0 mb-1">List-based media object</h5>
                            <p>Are you brave enough to let me see your peacock? There’s no going back. This is the last time you say, after the last line you break. At the eh-end of it all.</p>
                          </div>
                        </li>
                    </ul>
                    
                </div>
            </div>
        </div>
        
                                            
                                            
                                            
                                            
                                            
                                            
                                            
                                            
                                            
                                            
                                            
                                            
                                            
                                            
                                            
                                            
                                            
                                            
                                            
                                            
                                            
                                            
                                            
                                            
                                            
                                            
                                            
                                            
                                            
                                            
                                            
                                            
                                            
                                            
                                            
                                            
                                            
                                            
                                            
                                            
                                            
                                            
                                            
            
                    
        <script src="https://code.jquery.com/jquery-3.7.0.min.js" integrity="sha256-2Pmvv0kuTBOenSvLm6bvfBSSHrUJ+3A7x6P5Ebd07/g=" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct" crossorigin="anonymous"></script>
          <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js" integrity="sha512-AA1Bzp5Q0K1KanKKmvN/4d3IRKVlv9PYgwFPvm32nPO6QS8yH1HO7LbgB1pgiOxPtfeg5zEn2ba64MUcqJx6CA==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
       <script src="js/js.js"></script>
        <script>
            function doLike(pid,uid,operation){
              
                let funcToDo = "";
                let btn = "";
                let btnRemove = "";
                if(operation=="Like"){
                    funcToDo = "doLike("+pid+","+uid+",'Dislike')";
                    btn = "bi-hand-thumbs-up-fill";
                    btnRemove = "bi-hand-thumbs-up";
                    let totalLikes = $("#totalLikes").text(parseInt($("#totalLikes").text())+1);
                }
                if(operation=="Dislike"){
                    funcToDo = "doLike("+pid+","+uid+",'Like')";
                    btn = "bi-hand-thumbs-up";
                    btnRemove = "bi-hand-thumbs-up-fill";
                    let totalLikes = $("#totalLikes").text(parseInt($("#totalLikes").text())-1);
                }
                
                        $("#likeDislikeBtn").removeClass(btnRemove);
                        $("#likeDislikeBtn").addClass(btn);
                        $("#likeBTN").attr("onClick",funcToDo);
                $.ajax({
                    
                    url:"LikeServlet",
                    data:{pid:pid,uid:uid,operation:operation},
                    success: function (data){
                        console.log(data)
                    }
                })
            }
            function logout(){
                $.ajax({
                        url:"LogoutServlet",
                        type:'post',
                        success: function(data,textStatus,jqXHR){
                            console.log(data)
                            
                            if(data.trim()=="logout"){
                                
                                swal("Logout Successful!", "Your account is logout Succussfully! We are redirecting you to Login Page.", "success")
                                    .then((value) => {
                                      window.location = "login.jsp"
                                    });
                            }
                            else{ 
                                swal("Error!", data, "error");
                            }
                            
                            
                            $("#loader").hide();
                            
                        },
                        error: function (jqXHR, textStatus,errorThrown){
                            console.log(jqXHR);
                            $("#loader").hide();
                            swal("Error!", "Something went wrong!", "error");
                        },
                        processData:false,
                        contentType:false
                        
                        
                    });
            }
        
            
                let editStatus = false;
            $(document).ready(function(){
                $('#edit-profile-btn').click(function(){
                    if(editStatus==false){
                        $('#profileDetails').hide();
                        $('#profileEdit').show();
                        $("#edit-profile-btn").text("Back");
                        editStatus=true;
                    }
                    else{
                        $('#profileDetails').show();
                        $('#profileEdit').hide();
                    
                        editStatus=false;
                    }
                    
                })
            })
            
            
            
            
//            ADD POST FORM

             $(document).ready(function(){
                console.log("LOADED");
                
                
                $('#AddPost').on('submit',function(event){
                    event.preventDefault();
                    if($("#LatestId").val()!=0){
//                        IF WE HAVE TO UPDATE POST
//                            alert($("#LatestId").val());
//                            
//                            let form = new FormData(this);
//
//                            console.log("SUBMITTED");
//
//
//                            $("#loader").show();
//                            $.ajax({
//                                url:"updatePost",
//                                type:'post',
//                                data:form,
//                                success: function(data,textStatus,jqXHR){
//                                    console.log(data);
//                                    alert(data);
//                                    if(data.trim()=="posted"){
//
//                                        $("#msg").show();                                
//                                        $("#msg").addClass("alert-success");                                
//                                        $("#msg").text("Updated Succesfully!");                                
//                                        $("#addPostBtn").text("Update Post");  
//
//        //                                IF POSTED GET LATEST ID
//        // ##################################         IF POSTED GET LATEST ID     ############################################
//        // ##################################         IF POSTED GET LATEST ID     ############################################
//                                            
//                                    }
//                                    else{ 
//                                        $("#msg").show();                                
//                                        $("#msg").addClass("alert-danger");                                
//                                        $("#msg").text(data);   
//                                    }
//
//
//                                    $("#loader").hide();
//                                },
//                                error: function (jqXHR, textStatus,errorThrown){
//                                    console.log(jqXHR);
//                                    $("#loader").hide();
//        //                          
//                                        $("#msg").show();                                
//                                        $("#msg").addClass("alert-warning");                                
//                                        $("#msg").text("Post Request not sent!");   
//                                },
//                                processData:false,
//                                contentType:false
//                            });
                    }
                    else{
                        
                    
                        let form = new FormData(this);

                        console.log("SUBMITTED");


                        $("#loader").show();

                        $.ajax({
                            url:"AddPostServlet",
                            type:'post',
                            data:form,
                            success: function(data,textStatus,jqXHR){
                                console.log(data);
                                if(data.trim()=="posted"){

                                    $("#msg").show();                                
                                    $("#msg").addClass("alert-success");                                
                                    $("#msg").text("Posted Succesfully!");                                
                                    $("#addPostBtn").text("Update Post"); 
                                    $("#addPostBtn").text("Update Post"); 
                                    $("#closeBtn").click(); 
                                    swal("Posted Successful!", "Your post is now live on your Blog!", "success")
                                    
                                    
    //                                IF POSTED GET LATEST ID
    //                                
    // ##################################         IF POSTED GET LATEST ID     ############################################
    // ##################################         IF POSTED GET LATEST ID     ############################################
    
    
    
    
    
    
//                                        $.ajax({
//                                            url:"GetLatestPost",
//                                            type:'post',
//                                            success: function(data,textStatus,jqXHR){
//                                                $("#LatestId").val(data); 
//                                            },
//                                            error: function (jqXHR, textStatus,errorThrown){
//
//                                            },
//                                            processData:false,
//                                            contentType:false
//                                        });
                                }
                                else{ 
                                    swal("Error!", "Something went wrong!", "error")
                                    
                                }


                                $("#loader").hide();
                            },
                            error: function (jqXHR, textStatus,errorThrown){
                                console.log(jqXHR);
                                $("#loader").hide();
    //                          
                                    $("#msg").show();                                
                                    $("#msg").addClass("alert-warning");                                
                                    $("#msg").text("Post Request not sent!");   
                            },
                            processData:false,
                            contentType:false
                        });
                    
                    }
                    
                    
                    
                    
                    
                    
                    
                });
                
            });
            
            function ResetForm(){
                $('#latestPostId').remove();
                $('#AddPost')[0].reset();                               
                $("#addPostBtn").text("Post Now!");  
            }
            
            
            
            
            
           
            
            
            function getPost(catId,temp){
                
                $("#loader1").show();
                $(".c-link").removeClass("active");
                $(".c-link").removeClass("primary-background");
                
                
                $.ajax({
                    url:"load_posts.jsp",
                    data:{cid:catId},
                    success: function (data){
                        $("#loader1").hide();
                        $("#post-container").html(data);
                        $(temp).addClass("active");
                        $(temp).addClass("primary-background");
                    }
                })
            }
            
             $(document).ready(function(e){
                let allPost = $(".c-link")[0];
                getPost(0,allPost);
            })
            
            
            
            
            
            
            
            
            
                    
        </script>
    </body>
</html>
