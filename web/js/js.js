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
            
            
            
            
            
            
            
            
            
                    