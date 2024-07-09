<%@page import="com.mycompany.groco.helper.FactoryProvider"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Green Veggies</title>
        <!-- Component -->
        <%@include file="Component/Common_item.jsp" %>
    </head>
    <body onload="getLocation()">
        <div class="main">
            <%@include file="Component/navBar.jsp" %>                   
            <%@include file="Component/Content.jsp" %>                   
            <%@include file="Component/footer.jsp" %>                   
        </div> 
    </body>
</html>
