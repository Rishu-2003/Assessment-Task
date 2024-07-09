<%@page import="com.mycompany.groco.entities.User"%>
<%@page import="com.mycompany.groco.helper.FactoryProvider"%>
<%@page import="com.mycompany.groco.entities.Category"%>
<%@page import="com.mycompany.groco.Dao.CategoryDao"%>
<%@page import="com.mycompany.groco.Dao.GetCountDao"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Map"%>

<% 
    User user=(User)session.getAttribute("current_user");
    if(user==null){
        session.setAttribute("message","You are't login??");
        response.sendRedirect("Login.jsp");
        return;
    }else{
        if(user.getUserType().equals("Normal")){
            session.setAttribute("message","You are't Admin??");
            response.sendRedirect("Login.jsp");
            return;
        }
    }
%>
<%
    CategoryDao cdao=new CategoryDao(FactoryProvider.getFactory());
    List<Category>list=cdao.getCategories();
    
    Map<String,Long>m=GetCountDao.getCounts(FactoryProvider.getFactory());
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en" dir="ltr">
    <head>
        <meta charset="UTF-8">
        <title>Admin Panel | GreenVeggies</title>

        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

        <link rel="stylesheet" href="CSS/style_admin.css">
         <link rel="icon" type="Image/png" href="Image/url1.webp">
        <!--         Boxicons CDN Link -->
        <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
        <link href='https://unpkg.com/boxicons@2.0.7/css/boxicons.min.css' rel='stylesheet'>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
    </head>
    <body>
        <div class="sidebar">
            <div class="logo-details">
                <i class='bx bxl-shopify bx-burst' ></i>
                <span class="logo_name">GreenVeggies</span>
            </div>
            <ul class="nav-links">
                <li>
                    <a href="#" class="active">
                        <i class='bx bx-grid-alt' ></i>
                        <span class="links_name">Dashboard</span>
                    </a>
                </li>
                <li>
                    <a href="#">
                        <i class='bx bx-box' ></i>
                        <span class="links_name">Product</span>
                    </a>
                </li>
                <li>
                    <a href="#">
                        <i class='bx bx-list-ul' ></i>
                        <span class="links_name">Category</span>
                    </a>
                </li>
                <li>
                    <a href="#">
                        <i class='bx bxs-user'></i>
                        <span class="links_name">Users</span>
                    </a>
                </li>
                <li>
                    <a href="#">
                        <i class='bx bx-user-pin'></i>
                        <span class="links_name">Vendors</span>
                    </a>
                </li>
                <li>
                    <a href="#">
                        <i class='bx bxs-cart-alt'></i>
                        <span class="links_name">Order List</span>
                    </a>
                </li>
                <li>
                    <a href="#">
                        <i class='bx bx-message' ></i>
                        <span class="links_name">Messages</span>
                    </a>
                </li>
                <li>
                    <a href="#">
                        <i class='bx bx-cog' ></i>
                        <span class="links_name">Setting</span>
                    </a>
                </li>
                <li class="log_out">
                    <% 
                         if(user!=null){
                    %>
                    <a href="LogoutServlet">
                        <i class='bx bx-log-out'></i>
                        <span class="links_name">Log out</span>
                    </a>
                    <%
                        }
                    %>
                </li>
            </ul>
        </div>
        <section class="home-section">
            <nav>
                <div class="sidebar-button">
                    <i class='bx bx-menu sidebarBtn'></i>
                    <span class="dashboard">Dashboard</span>
                </div>
                <div class="search-box">
                    <input type="text" placeholder="Search...">
                    <i class='bx bx-search' ></i>
                </div>
                <div class="profile-details">
                    <%
                            if(user!=null){
                    %>
                    <img src="Image\UserImage\<%=user.getUserPic()%>" alt="...">
                    <span class="admin_name"><%=user.getUsername()%></span>
                    <%
                        }
                    %>
                    <i class='bx bx-chevron-down' ></i>
                </div>
            </nav>

            <div class="home-content">
                <%@include file="Component/message.jsp" %>
                <div class="overview-boxes">
                    <div class="box" style="background-color: #cce5ff;">
                        <div class="right-side">
                            <div class="box-topic">Users</div>
                            <div class="number"><%=m.get("userCount")%></div>
                        </div>
                        <i class='bx bxs-user cart'></i>
                    </div>
                    <div class="box" style="background-color: #bbffaa;">
                        <div class="right-side">
                            <div class="box-topic">Vendors</div>
                            <div class="number">5</div>

                        </div>
                        <i class='bx bxs-user-pin cart two'></i>
                    </div>
                    <div class="box" style="background-color: #ffe8b3;">
                        <div class="right-side">
                            <div class="box-topic">Products</div>
                            <div class="number"><%=m.get("productCount")%></div>
                        </div>
                        <i class='bx bx-box cart three' ></i>
                    </div>
                    <div class="box" style="background-color: #f7d4d7;">
                        <div class="right-side">
                            <div class="box-topic">Category</div>
                            <div class="number"><%=list.size()%></div>
                        </div>
                        <i class='bx bx-list-ul cart four' ></i>
                    </div>
                </div>
                <!-- ----------------------------------Add category and products-------------------------- -->
                <div class="overview-boxes">
                    <div class="box" style="background-color: #ffccff;">
                        <div class="right-side">
                            <div class="box-topic">Total Order</div>
                            <div class="number">40,876</div>
                        </div>
                        <i class='bx bxs-cart-alt cart five'></i>
                    </div>
                    <div class="box" style="background-color: #ffff99;">
                        <div class="right-side">
                            <div class="box-topic">Sales</div>
                            <div class="number">38,876</div>

                        </div>
                        <i class='bx bx-money cart six'></i>
                    </div>
                    <div class="box" style="background-color: #ccbbff; cursor: pointer;" data-toggle="modal" data-target="#add-category-modul">
                        <div class="right-side">
                            <div class="box-topic">Add Category</div>
                            <div class="number">click here</div>
                        </div>
                        <i class='bx bxs-add-to-queue cart seven'></i>
                    </div>
                    <div class="box" style="background-color: #bbffff; cursor: pointer;" data-toggle="modal" data-target="#add-product-modul">
                        <div class="right-side">
                            <div class="box-topic">Add Product</div>
                            <div class="number">click here</div>
                        </div>
                        <i class='bx bxs-cart-add cart eight'></i>
                    </div>

                    <!-- --------------------------------add category Modal-------------------------------------- -->
                    <div class="modal fade" id="add-category-modul" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                        <div class="modal-dialog" role="document">
                            <div class="modal-content">
                                <div class="modal-header" style="background-color: #1abc9c;color: #fff;">
                                    <h5 class="modal-title" id="exampleModalLabel">Add category</h5>
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                        <span aria-hidden="true">&times;</span>
                                    </button>
                                </div>

                                <div class="modal-body">
                                    <form action="ProductOperationServlet" method="post">
                                        <input type="hidden" name="operation" value="addcategory">
                                        <div class="form-group">
                                            <input type="text" class="form-control" name="catTitle" placeholder="Enter category title " required>
                                        </div>
                                        <div class="form-group">
                                            <textarea class="form-control" style="height: 12rem;" placeholder="Category description" name="catDesc" required></textarea>
                                        </div>
                                        <div class="container text-center">
                                            <button class="btn btn-outline-success" style="background-color: #1abc9c; color: #fff;">Add Category</button>
                                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- -------------------------------add Product Modal--------------------------- -->
                    <div class="modal fade" id="add-product-modul" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                        <div class="modal-dialog" role="document">
                            <div class="modal-content">
                                <div class="modal-header" style="background-color: #1abc9c;color: #fff;">
                                    <h5 class="modal-title" id="exampleModalLabel">Add Product</h5>
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                        <span aria-hidden="true">&times;</span>
                                    </button>
                                </div>                          
                                <div class="modal-body">
                                    <form action="ProductOperationServlet" method="post" enctype="multipart/form-data">
                                        <input type="hidden" name="operation" value="addproduct">
                                        <div class="form-group">
                                            <input type="text" class="form-control" name="pName" placeholder="Enter product Name" required>
                                        </div>
                                        <div class="form-group">
                                            <input type="text" class="form-control" name="vName" placeholder="Enter Vendor Name" required>
                                        </div>

                                        <div class="form-group">
                                            <label>Product Picture:</label>
                                            <input type="file" class="form-control" name="pPic" required>
                                        </div>
                                        <div class="form-group">
                                            <input type="number" class="form-control" name="pPrice" placeholder="Enter Product price" required>
                                        </div>
                                        <div class="form-group">
                                            <input type="number" class="form-control" name="pDiscount" placeholder="Enter Product discount" required>
                                        </div>
                                        <div class="form-group">
                                            <input type="number" class="form-control" name="pQuantity" placeholder="Enter Product Quantity" required>
                                        </div>

                                        <div class="form-group" style="display: flex;align-items: center;">
                                            <label>Select Category of Product :</label>
                                            <select name="catId" style="margin-left: 10px;padding: 5px;border-radius: 4px; outline: none; border: 2px solid #1abc9c;">
                                                <%
                                                    for(Category c:list){
                                                %>
                                                <option value="<%=c.getId()%>"><%=c.getCategory_Title()%></option>
                                                <%
                                                    }
                                                %>
                                            </select>
                                        </div>
                                        <div class="form-group">
                                            <input type="text" class="form-control" name="vAddress" placeholder="Enter Vendor Address" required>
                                        </div>

                                        <div class="form-group">
                                            <textarea class="form-control" style="height: 8rem;" placeholder="Product description" name="pDesc" required></textarea>
                                        </div>
                                        <div class="container text-center">
                                            <button class="btn btn-outline-success"  style="background-color: #1abc9c; color: #fff;">Add Product</button>
                                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>
                <!-- ------------------------------sales of product------------------------ -->
                <div class="sales-boxes">
                    <div class="recent-sales box">
                        <div class="title" style="color: #12876f;">Recent Orders</div>
                        <div class="sales-details">
                            <ul class="details">
                                <li class="topic">Date</li>
                                <li><a href="#">02 Jan 2024</a></li>
                                <li><a href="#">02 Jan 2024</a></li>
                                <li><a href="#">02 Jan 2024</a></li>
                                <li><a href="#">02 Jan 2024</a></li>
                                <li><a href="#">02 Jan 2024</a></li>
                                <li><a href="#">02 Jan 2024</a></li>
                                <li><a href="#">02 Jan 2024</a></li>
                                <li><a href="#">02 Jan 2024</a></li>
                                <li><a href="#">02 Jan 2024</a></li>
                            </ul>
                            <ul class="details">
                                <li class="topic">Customer</li>
                                <li><a href="#">Pawan Kumar</a></li>
                                <li><a href="#">Harsh Kumar</a></li>
                                <li><a href="#">Chandra Bhushan</a></li>
                                <li><a href="#">Ravi Kumar</a></li>
                                <li><a href="#">Kanhiya Kumar</a></li>
                                <li><a href="#">Ayush Kumar</a></li>
                                <li><a href="#">Saurav Kumar</a></li>
                                <li><a href="#">Vikky Kumar</a></li>
                                <li><a href="#">Gaurav Kumar</a></li>
                            </ul>
                            <ul class="details">
                                <li class="topic">Order</li>
                                <li><a href="#">Delivered</a></li>
                                <li><a href="#">Pending</a></li>
                                <li><a href="#">Delivered</a></li>
                                <li><a href="#">Delivered</a></li>
                                <li><a href="#">Pending</a></li>
                                <li><a href="#">Pending</a></li>
                                <li><a href="#">Delivered</a></li>
                                <li><a href="#">Pending</a></li>
                                <li><a href="#">Delivered</a></li>
                            </ul>
                            <ul class="details">
                                <li class="topic">Price</li>
                                <li><a href="#"><span>&#8377;</span>204.98</a></li>
                                <li><a href="#"><span>&#8377;</span>24.55</a></li>
                                <li><a href="#"><span>&#8377;</span>25.88</a></li>
                                <li><a href="#"><span>&#8377;</span>170.66</a></li>
                                <li><a href="#"><span>&#8377;</span>56.56</a></li>
                                <li><a href="#"><span>&#8377;</span>44.95</a></li>
                                <li><a href="#"><span>&#8377;</span>67.33</a></li>
                                <li><a href="#"><span>&#8377;</span>23.53</a></li>
                                <li><a href="#"><span>&#8377;</span>46.52</a></li>
                            </ul>
                        </div>
                    </div>
 
                </div>
            </div>
        </section>

        <script>
            let sidebar = document.querySelector(".sidebar");
            let sidebarBtn = document.querySelector(".sidebarBtn");
            sidebarBtn.onclick = function () {
                sidebar.classList.toggle("active");
                if (sidebar.classList.contains("active")) {
                    sidebarBtn.classList.replace("bx-menu", "bx-menu-alt-right");
                } else
                    sidebarBtn.classList.replace("bx-menu-alt-right", "bx-menu");
            }
        </script>

    </body>
</html>






