<%@page import="com.mycompany.groco.entities.User"%>
<%@page import="com.mycompany.groco.entities.Cart"%>
<%@page import="com.mycompany.groco.Dao.AddToCartDao"%>
<%@page import="com.mycompany.groco.helper.FactoryProvider"%>
<%@page import="java.util.List"%>


<%
    User user1=(User)session.getAttribute("current_user");
    AddToCartDao cartData=new AddToCartDao(FactoryProvider.getFactory());
    List<Cart>cartItem=null;
    float price=0;
    int count=0;
    if(user1!=null){
        cartItem=cartData.getAllCartItemById(user1.getUserId()); 
        count=cartData.getCountCartProduct(user1.getUserId());
       // price=cartData.getSumPriceOfCartProduct(user1.getUserId());

    }
       
    
%>
<nav class="header">
    <div class="logo"><img src="Image/logo.png" alt="alt" /></div>
    <div class="right">
        <h4 class="details"></h4>
        <div class="searchBox nav-box">
            <i class='bx bx-search-alt'></i>
            <input type="name" name="name" class="search" placeholder="Search for Products and More">
        </div>
        <div class="loginBox nav-box">
            <% if(user1!=null){%>
            <a href="LogoutServlet"><i class='bx bx-user-circle'></i><span><%=user1.getUsername()%></span></a>
                    <%}else{%>
            <a href="Login.jsp"><i
                    class='bx bx-user-circle'></i><span>Login</span></a>
                    <%}%>
        </div>
        <div class="cartBox nav-box" id="cartBox" onclick="shoppingCart()"><i class='bx bx-cart-alt'></i><span id="hide">Cart<sup><%=count%></sup></span></div>
        <div class="cartBox nav-box"><a href="#"><i class='bx bxs-store'></i><span id="hide">Become a Seller</span></a></div>
    </div>
    <div class="cart-panel" id="cartPanel">
        <h2>My Cart</h2>
        <div class="cart">
            <%
                if(cartItem!=null){
                    for(Cart clist:cartItem){                   
            %>
            <div class="cart-item">
                <img src="Image/Product-image/<%=clist.getPicture()%>">
                <div class="item-details">
                    <div>
                        <span class="pname"><%=clist.getProductName()%></span>
                        <span class="quantity">(<%=clist.getQuantity()%>Kg)</span>
                    </div>
                    <h4 class="price">&#8377;<%=clist.getPrice()%></h4>
                </div>
                <a href="DeleteCart?productId=<%=clist.getId()%>"><i class='bx bxs-x-circle'></i></a>
            </div>  
            <%
                }
            }
            %>
        </div>
        <!--<div class="total"><h3>Total Price :</h3><span>&#8377;<%=price%></span></div>-->
    </div>

</nav>