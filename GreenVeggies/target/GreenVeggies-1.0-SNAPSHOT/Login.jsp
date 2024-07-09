
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en" dir="ltr">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Login Form</title> 
        <link rel="stylesheet" href="CSS/login_style.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.2/css/all.min.css"/>
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

        <link rel="icon" type="Image/png" href="Image/url1.webp">
        <style>
            *{
                margin: 0;
                padding: 0;
                box-sizing: border-box;
                font-family: 'Poppins',sans-serif;
            }
            body{
                background: #1abc9c;
                overflow: hidden;
            }
            ::selection{
                background: rgba(26,188,156,0.3);
            }
            .container{
                max-width: 440px;
                padding: 0 20px;
                margin: 170px auto;
            }
            .wrapper{
                width: 100%;
                background: #fff;
                border-radius: 5px;
                box-shadow: 0px 4px 10px 1px rgba(0,0,0,0.1);
            }
            .wrapper .title{
                height: 90px;
                background: #16a085;
                border-radius: 5px 5px 0 0;
                color: #fff;
                font-size: 30px;
                font-weight: 600;
                display: flex;
                align-items: center;
                justify-content: center;
            }
            .wrapper form{
                padding: 30px 30px 25px 30px;
            }
            .wrapper form .row{
                height: 45px;
                margin-bottom: 15px;
                position: relative;
            }
            .wrapper form .row input{
                height: 100%;
                width: 100%;
                outline: none;
                padding-left: 60px;
                border-radius: 5px;
                border: 1px solid lightgrey;
                font-size: 16px;
                transition: all 0.3s ease;
            }
            form .row input:focus{
                border-color: #16a085;
                box-shadow: inset 0px 0px 2px 2px rgba(26,188,156,0.25);
            }
            form .row input::placeholder{
                color: #999;
            }
            .wrapper form .row i{
                position: absolute;
                width: 47px;
                height: 100%;
                color: #fff;
                font-size: 18px;
                background: #16a085;
                border: 1px solid #16a085;
                border-radius: 5px 0 0 5px;
                display: flex;
                align-items: center;
                justify-content: center;
            }
            .wrapper form .pass{
                margin: -8px 0 20px 0;
                color: #16a085;
                font-size: 17px;
                cursor: pointer;
            }

            .wrapper form .pass:hover{
                text-decoration: underline;
            }
            .wrapper form .button input{
                color: #fff;
                font-size: 20px;
                font-weight: 500;
                padding-left: 0px;
                background: #16a085;
                border: 1px solid #16a085;
                cursor: pointer;
            }
            form .button input:hover{
                background: #12876f;
            }
            .wrapper form .signup-link{
                text-align: center;
                margin-top: 20px;
                font-size: 17px;
            }
            .wrapper form .signup-link a{
                color: #16a085;
                text-decoration: none;
            }
            form .signup-link a:hover{
                text-decoration: underline;
            }


        </style>
    </head>
    <body>
        <div class="container">
            <div class="wrapper">
                <div class="title"><span>Login Form</span></div>
                <form action="loginServlet" method="post">
                    <%@include file="Component/message.jsp"%>
                    <div class="row">
                        <i class="fas fa-user"></i>
                        <input type="email" name="email" placeholder="Email or Phone" pattern="{a-zA-Z0-9}" required>
                    </div>
                    <div class="row">
                        <i class="fas fa-lock"></i>
                        <input type="password" name="password" placeholder="Password" pattern="{a-zA-Z0-9}{10}" required>
                    </div>
                    <div class="pass" id="forget-password" data-toggle="modal" data-target="#forget-password-modul">Forgot password?</div>


                    <div class="row button">
                        <input type="submit" value="Login">
                    </div>
                    <div class="signup-link">Not a member? <a href="Registration.jsp">Register</a></div>
                </form>
            </div>
        </div>

        <!--ForgetPassword modul-->           
        <div class="modal fade" id="forget-password-modul" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header" style="background-color: #1abc9c;">
                        <h5 class="modal-title" id="exampleModalLabel">Forgot Password</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <form action="ForgetPassword" method="post">
                            <div class="form-group">
                                <label>Enter Email:</label>
                                <input type="email" class="form-control" name="email" placeholder="Enter your Email "  pattarn="{a-z0-9}{10}" required>
                            </div>
                            <div class="form-group">
                                <label>Enter Password:</label>
                                <input type="password" class="form-control" name="password" placeholder="Enter new Password" required>
                            </div>
                            <div class="form-group">
                                <label>Confirm Password:</label>
                                <input type="password" class="form-control" name="confirmPassword" placeholder="Confirm Password" required>
                            </div>
                            <div class="modal-footer text-center">
                                
                                <button type="submit" class="btn" style="background-color: #1abc9c;">Forgot</button>
                            </div>
                        </form>
                    </div>

                </div>
            </div>
        </div>

    </body>
</html>



