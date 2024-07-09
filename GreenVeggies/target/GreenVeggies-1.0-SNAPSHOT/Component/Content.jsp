<%@page import="com.mycompany.groco.helper.FactoryProvider"%>
<%@page import="com.mycompany.groco.entities.Category"%>
<%@page import="com.mycompany.groco.entities.Product"%>

<%@page import="com.mycompany.groco.Dao.ProductDao"%>
<%@page import="com.mycompany.groco.Dao.CategoryDao"%>

<%@page import="java.util.List"%>
<%
    String cat=request.getParameter("category");
    
    
    CategoryDao cdao=new CategoryDao(FactoryProvider.getFactory());
    List<Category> clist=cdao.getCategories();
    
    ProductDao pdao=new ProductDao(FactoryProvider.getFactory());
    List<Product>plist=null;
    
    
    if(cat==null){
        plist=pdao.getAllProducts();
    }else if(cat.trim().equals("All")){
        plist=pdao.getAllProducts();
    }else{
        int cid=Integer.parseInt(cat.trim());
        plist=pdao.getAllProductById(cid);
    }
    
%>
<div class="container">
    <div class="title-banner">
        <img src="Image/Green.jpg" alt="alt" />
    </div>

    <!-- ---------------------------------------------------------------------------------------------- -->

    <div class="poster">
        <div class="poster-bg two">
            <div class="box">
                <a href="#">Order Now</a>
            </div>
        </div>
        <div class="poster-bg one">
            <div class="box">
                <a href="#">Order Now</a>
            </div>
        </div>
        <div class="poster-bg three">
            <div class="box">
                <a href="#">Order Now</a>
            </div>
        </div>
    </div>


    <!-- ------------------------------------------Item frames----------------------------------------- -->
    <div class="item-container">
        <h3>Popular Products</h3>
        <div class="item-frame">
            <div class="frame">
                <img src="Image/Product-image/carrot.webp" alt="alt" />
                <span>Carrot</span>
            </div>
            <div class="frame">
                <img src="Image/Product-image/apple.webp" alt="alt" />
                <span>Red Apple</span>
            </div>
            <div class="frame">
                <img src="Image/Product-image/sapota.webp" alt="alt" />
                <span>Sapota</span>
            </div>
            <div class="frame">
                <img src="Image/Product-image/pineapple.webp" alt="alt" />
                <span>Pineapple</span>
            </div>
            <div class="frame">
                <img src="Image/Product-image/red-banana.webp" alt="alt" />
                <span>Red Banana</span>
            </div>
            <div class="frame">
                <img src="Image/Product-image/guava.webp" alt="alt" />
                <span>Guava</span>
            </div>
            <div class="frame">
                <img src="Image/Product-image/black-grapes.webp" alt="alt" />
                <span>Grapes</span>
            </div>
            <div class="frame">
                <img src="Image/Product-image/papaya.webp" alt="alt" />
                <span>Papaya</span>
            </div>
            <div class="frame">
                <img src="Image/Product-image/anar.webp" alt="alt" />
                <span>Pomigranate</span>
            </div>
            <div class="frame">
                <img src="Image/Product-image/muskmelon.webp" alt="alt" />
                <span>Muskmelon</span>
            </div>
            <div class="frame">
                <img src="Image/Product-image/shimla-chili.webp" alt="alt" />
                <span>Shimla Chili</span>
            </div>
            <div class="frame">
                <img src="Image/Product-image/mango-raw.webp" alt="alt" />
                <span>Mango Raw</span>
            </div>
            <div class="frame">
                <img src="Image/Product-image/musrom.webp" alt="alt" />
                <span>Musrom</span>
            </div>
            <div class="frame">
                <img src="Image/Product-image/green-grapes.webp" alt="alt" />
                <span>Grapes</span>
            </div>
            <div class="frame">
                <img src="Image/Product-image/carrot.webp" alt="alt" />
                <span>Carrot</span>
            </div>
        </div>
    </div>
    <!-- --------------------------------------------------------------------------------------------- -->

    <div class="menu-product">
        <div class="category-choose">
            <div class="choose" style="background-color:#12876f;">
                <a href="index.jsp?category=All" style="color: var(--white); font-weight: bold">All Category</a>
            </div>
            <%
                 for(Category c:clist){
            %>
            <div class="choose">
                <a href="index.jsp?category=<%=c.getId()%>" ><%=c.getCategory_Title()%></a>
            </div>
            <%}%>
        </div>
        <div class="item-card">
            <h3>Buy fresh Fruits and Vegetables Online</h3>
            <div class="card-board">
                <%
                    Float dprice;
                    for(Product p:plist){
                        dprice=(p.getPrice()-(p.getPrice()*p.getDiscount()/100));
                 
                %>
                <div class="card">
                    <div class="discount-box"><%=p.getDiscount()%>%</div>
                    <img src="Image/Product-image/<%=p.getProductPic()%>" name="image" alt="alt" />
                    <div class="pro-details" >
                        <span id="p-name" name="productName"><%=p.getProductName()%></span>
                        <div id="seller">Vendor:- <span name="vendorName"><%=p.getVendorName()%></span></div>
                        <div class="pri-crt">
                            <div class="price-box">
                                <span class="price" name="price">&#8377;<%=p.getPrice()%></span>
                                <span class="discount">&#8377;<%=dprice%></span>  
                            </div>
                                <button class="add-cart"><a href="CartServlet?pName=<%= p.getProductName() %>&price=<%= p.getPrice()%>&pic=<%=p.getProductPic()%>"><i class='bx bxl-shopify'></i><span>Add</span></a></button>
                        </div>
                    </div>
                </div>
                <%
                    }if(plist.size()==0){ %>
                        <h4>This category have no Products</h4>
                        <%
                    }
                %>
            </div>

        </div>

    </div>
</div>