
<nav class="navbar navbar-expand-lg navbar-dark bg-dark primary-background">
  <a class="navbar-brand" href="index.jsp"><i class="bi bi-stars"></i> BLOGS</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>
  
  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item active">
        <a class="nav-link" href="index.jsp"><i class="bi bi-house"></i> Home <span class="sr-only">(current)</span></a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="#"><i class="bi bi-telephone"></i> Contact us</a>
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
      
       <%
      if(user!=null){
        %>
                <ul class="navbar-nav mr-right">
                    
                    
                    <li class="nav-item">
                      <a class="nav-link" href="profile.jsp"><i class="bi bi-person-workspace"></i> Dashboard</a>
                    </li>
                    <li class="nav-item">
                      <a class="nav-link" href="#"  data-toggle="modal" data-target="#profileModal"><i class="bi bi-person-circle"></i> <%= user.getName() %></a>
                    </li>
                    
                    <li class="nav-item">
                      <a class="nav-link btn" id="logout-btn" onClick="logout()"><i class="bi bi-box-arrow-right"></i> Logout</a>
                    </li>
                    
                </ul>
        <%
        }else{

    %>
    
    
    <li class="nav-item">
        <a class="nav-link" href="login.jsp"><i class="bi bi-person-circle"></i> Login</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="register.jsp"><i class="bi bi-person-plus-fill"></i> Register</a>
      </li>
      <% }
      %>
<!--      <li class="nav-item">
        <a class="nav-link disabled">Disabled</a>
      </li>-->
    </ul>
   
    <form class="form-inline my-2 my-lg-0">
      <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
      <button class="btn btn-outline-light my-2 my-sm-0" type="submit">Search</button>
    </form>
  </div>
</nav>




<% if(user!=null){  %>

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
                                        <td><input type="file" name="file" id="file2" ></td>
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
        
<% } %>