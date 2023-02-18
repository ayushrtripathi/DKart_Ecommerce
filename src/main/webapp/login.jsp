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
		<div class="container">
			<div class="row">
				<div class="col-md-6 offset-md-3">
				
					<div class="card mt-3">
						<div class="card-header custom-bg text-white" style="background-color: #f4511e!important;">
							Login Here	
						</div>
						<%@include file="components/response.jsp" %>
					
					
					<div class="card-body">
						<form action="LoginServlet" method="post">
						  <div class="form-group">
						    <label for="exampleInputEmail1" class="form-label" >Email address</label>
						    <input type="email" class="form-control" name="email" id="exampleInputEmail1" aria-describedby="emailHelp">
						    <div id="emailHelp" class="form-text">We'll never share your email with anyone else.</div>
						  </div>
						  <div class="form-group">
						    <label for="exampleInputPassword1" class="form-label">Password</label>
						    <input type="password" name="password" class="form-control" id="exampleInputPassword1">
						  </div>
						  <div class="container text-center">
						  <a href="registration.jsp" class="text-center">Not yet registered?</a>
						  </div>
						  <br>
						  <div class="container text-center" >
						  <button type="submit" class="btn btn-primary">Submit</button>
						  <button type="reset" class="btn btn-danger">Reset</button>
						  </div>
						</form>
						</div>
					</div>
				</div>
			</div>
		</div>
</body>
</html>