
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html lang="en">
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <meta http-equiv="X-UA-Compatible" content="ie=edge" />
        <title>Registration Form</title>
        <!--<title>Registration Form in HTML CSS</title>-->
        <!---Custom CSS File--->
        <link rel="stylesheet" href="CSS/registration_style.css" />
        <link rel="icon" type="Image/png" href="Image/url1.webp">
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <script type="module" src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.esm.js"></script>
        <style>
            ::-webkit-scrollbar{
                width: 0;
                scroll-behavior: smooth;
            }
            * {
                margin: 0;
                padding: 0;
                box-sizing: border-box;
                font-family: "Poppins", sans-serif;
            }
            body {
                min-height: 100vh;
                display: flex;
                align-items: center;
                justify-content: center;
                padding: 20px;
                background: #1abc9c;
            }
            .container {
                position: relative;
                max-width: 700px;
                width: 100%;
                background: #fff;
                padding: 25px;
                border-radius: 8px;
                box-shadow: 0 0 15px rgba(0, 0, 0, 0.1);
            }
            .container header {
                font-size: 1.5rem;
                color: #333;
                font-weight: 500;
                text-align: center;
            }
            .container .form {
                margin-top: 30px;
            }
            .form .input-box {
                width: 100%;
                margin-top: 20px;
            }
            .input-box label {
                color: #333;
            }
            .form :where(.input-box input, .select-box) {
                position: relative;
                height: 50px;
                width: 100%;
                outline: none;
                font-size: 1rem;
                color: #707070;
                margin-top: 8px;
                border: 1px solid #ddd;
                border-radius: 6px;
                padding: 0 15px;
            }
            .input-box input:focus {
                box-shadow: 0 1px 0 rgba(0, 0, 0, 0.1);
            }
            .form .column {
                display: flex;
                column-gap: 15px;
            }
            .address :where(input, .select-box) {
                margin-top: 15px;
            }
            .select-box select {
                height: 100%;
                width: 100%;
                outline: none;
                border: none;
                color: #707070;
                font-size: 1rem;
            }
            .form button {
                height: 55px;
                width: 100%;
                color: #fff;
                font-size: 1rem;
                font-weight: 400;
                margin-top: 30px;
                border: none;
                border-radius: .2rem;
                cursor: pointer;
                transition: all 0.2s ease;
                background: #1abc9c;
            }
            .form button:hover {
                background: #1abcac;
            }

            /*Responsive*/
            @media screen and (max-width: 500px) {
                .form .column {
                    flex-wrap: wrap;
                }
                .form :where(.gender-option, .gender) {
                    row-gap: 15px;
                }
            }
        </style>
        
    </head>
    <body>
        <section class="container">
            <%@include file="Component/message.jsp" %>
            <header>Registration Form</header>
            <form action="registerServlet" class="form" method="post" enctype="multipart/form-data">
                <div class="input-box">
                    <label>Full Name</label>
                    <input type="text" name="username" class="user" placeholder="Enter full name" pattern="{a-zA-Z}" required />
                </div>

                <div class="input-box">
                    <label>Email Address</label>
                    <input type="email" name="email" placeholder="Enter email address" pattern="{a-zA-Z0-9}{10}" required />
                </div>

                <div class="input-box">
                    <label>Password</label>
                    <input type="password" name="password" placeholder="*******************" required />
                </div>

                <div class="column">
                    <div class="input-box">
                        <label>Phone Number</label>
                        <input type="number" name="mobile" placeholder="Enter phone number" required />
                    </div>
                    <div class="input-box">
                        <label>Picture</label>
                        <input type="file" name="picture" required style="padding-top: 9px"/>
                    </div>
                </div>
                <div class="input-box address">
                    <label>Address</label>
                    <input type="text" name="address" placeholder="Enter street address" required />
                </div>
                <button>Submit</button>
            </form>
        </section>

    </body>
</html>