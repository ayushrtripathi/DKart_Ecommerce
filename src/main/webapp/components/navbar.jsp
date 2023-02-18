<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@ page import="com.deloitte.entities.User" %>    

<%
	User u1 = (User) session.getAttribute("currentuser");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<nav class="navbar navbar-expand-lg navbar-dark bg-dark custom-bg text-white" style="background-color: #f4511e!important;">
  <a class="navbar-brand" href="index.jsp">De-Kart</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item active">
        <a class="nav-link" href="homepage.jsp">Home</a>
      </li>
      <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          Categories
        </a>
        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
          <a class="dropdown-item" href="#">Mobiles</a>
          <a class="dropdown-item" href="#">Laptops</a>
          <div class="dropdown-divider"></div>
          <a class="dropdown-item" href="#">Shoes</a>
        </div>
      </li>
    </ul>
    <div>
    <ul class="navbar-nav mr-auto">
    <!-- Icon -->
    	<li class="nav-item active">
    	        <a class="nav-link" href="" data-toggle="modal" data-target="#cart" onclick= "updateCart()">
    	        <i class="fas fa-shopping-cart" style="font-size: 30px"></i>
    	        <!-- adding numbers to cart icon -->
    	        <span class="cart-items">(0)</span>
    	        </a>    	
    	</li>
    	<!-- The below section is condition login or logout section -->
    	<%
    		if(u1==null){	
    	%>
    <!-- Login -->	
    	<li class="nav-item active">
    	        <a class="nav-link" href="login.jsp">Login</a>    	
    	</li>
    <!-- Register -->	
    	<li class="nav-item active">
    	        <a class="nav-link" href="registration.jsp">Register</a>    	
    	</li>	
    	
    	<% }else{ %>
    	
    	<li class="nav-item active">
    		<a class="nav-link font-weight-bold" href="<%=u1.getRole().equals("admin")? "admin.jsp":"homepage.jsp"%>">
    		Welcome: <%= u1.getName() %>
    		</a>
    	</li>
    			    <!-- Log out -->	
    	<li class="nav-item active">
    	        <a class="nav-link" href="LogoutServlet">Logout</a>    	
    	</li>
   		<%		
   		}
    	%>
    </ul>
    
   </div> 
    
  <!--   <form class="form-inline my-2 my-lg-0">
      <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
      <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
    </form>
   you can add this functionality if you want to, its a search bar  -->
  </div>
</nav>


</body>
</html>