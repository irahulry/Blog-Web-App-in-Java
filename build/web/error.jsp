
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page isErrorPage="true" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Sorry Something Went Wrong!</title>
         <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css"><script src="https://code.jquery.com/jquery-3.7.0.min.js" integrity="sha256-2Pmvv0kuTBOenSvLm6bvfBSSHrUJ+3A7x6P5Ebd07/g=" crossorigin="anonymous"></script>
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
    <body><br/><br/>
        <div class="container text-center">
            <img src="images/error.png" class="img-fluid" alt="Error"/>
            <h3 class="display-4 mt-2">Sorry, Something went wrong!</h3>
            
            <a href="index.jsp" class="btn primary-background btn-lg text-white mt-3">HOME</a>
        </div>
        
    </body>
</html>
