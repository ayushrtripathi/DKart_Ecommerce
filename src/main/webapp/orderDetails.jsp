<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Order Details</title>
<%@include file="components/common.jsp"%>
</head>

<script>
//onload function to remove cart
$(document).ready(function(){
	localStorage.removeItem("cart");
	$(".cart-items").html("(0)");
})


</script>

<style>
.mychangecolor{ color:green; /* it changes to yellow */ }

</style>
<body>
	<%@include file="components/navbar.jsp"%>
	<div class="container text-center">
		
		<div class="row mt-5">
			<div class="col-md-mt-3">
				<h1>YAY! ORDER PLACED SUCCESSFULLY!</h1>
			</div>
			
			<div class="text-center mt-3">
				<h3>ORDER NUMBER : <span class="mychangecolor"><%=session.getAttribute("orderNbr") %></span>, WILL BE SHIPPED WITHIN 3-4 BUSINESS DAYS.</h3>
			</div>
		
		</div>
	
	</div>
	
	<%@include file="components/common_modal.jsp" %>
</body>
</html>