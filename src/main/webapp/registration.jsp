<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<%@include file= "../components/common.jsp"%>
	<div class="container-fluid">
		
		<div class="row mt-5">
			<div class="col-md-4 offset-md-4">
				<div class="card">
						<div class="card-header text-white" style="background-color: #f4511e!important;">
							Registration
						</div>
					
					
					<div class="card-body">
					<!-- Display the session message  -->
					
					
					<%@include file="components/response.jsp" %>
					
						
						<h3 class="text-center my-3">Sign Up Form</h3>
						<form action="RegistrationServlet" method="POST">
						  <div class="form-group">
						    <label for="name">User Name</label>
						    <input type="text" class="form-control" id="name" name="userName" aria-describedby="nameHelp" placeholder="Enter Username" required>
						    <small id="nameHelp" class="form-text text-muted">Username is mandatory.</small>
						  </div>
						  <div class="form-group">
						    <label for="emailId">Email address</label>
						    <input type="email" class="form-control" id="emailId" name="emailId"aria-describedby="emailHelp" placeholder="Enter Email address" required>
						   <small id="emailHelp" class="form-text text-muted">Enter a valid e-mail.</small>
						  </div>
						  
						  <div class="form-group">
						    <label for="password" class="form-label">User Password</label>
						    <input type="password" class="form-control" id="password" name="password" aria-describedby="passwordHelp" placeholder="Enter Password" required>
						  <small id="passwordHelp" class="form-text text-muted">Please remember your password.</small>
						  </div>
						  
						   <div class="form-group">
						    <label for="phone" class="form-label">Phone</label>
						    <input type="number" class="form-control" id="phone" name="phone" aria-describedby="phoneHelp" placeholder="Enter Phone number" required>
						  <small id="phoneHelp" class="form-text text-muted">You can login with phone number.</small>
						  </div>
						  
						  <div class="form-group">
						    <label for="address" class="form-label">Address</label>
						    <textarea class="form-control" id="address" aria-describedby="addressHelp" name="address" placeholder="Enter your Address" required></textarea>
						  <small id="addressHelp" class="form-text text-muted">Enter your current address.</small>
						  </div>
						  
						  <!-- the name attribute helps us the server know which variableis it mapped to in java side. -->
						  
						  <div class="container text-center">
						  <a href="login.jsp" class="text-center">Already registered? Login.</a>
						  </div>
						  <br>
						  
						  
						  <div class="container text-center mt-2" >
						  <button type="submit" class="btn btn-outline-success">Register</button>
						  <button type="reset" class="btn btn-outline-warning">Reset</button>
						  </div>
						</form>
						</div>
					</div>
				</div>
			</div>
			</div>



</body>
</html>