<%@ page import="com.deloitte.entities.User"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%
User u = (User) session.getAttribute("currentuser");
if (u == null) {
	session.setAttribute("warning", "Please Login first!");
	response.sendRedirect("login.jsp");
	return;
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Checkout Page</title>
<%@include file="components/common.jsp"%>
</head>
<body>
	<%@include file="components/navbar.jsp"%>

	<div class="container-fluid">
		<form action="CheckoutServlet" method="post">

			<div class="row mt-5">
				<div class="col-md-6">

					<div class="card">
						<div class="card-title custom-bg text-white">
							<h3>Your Selected Items</h3>
						</div>
						<div class="card-body">
							<div class="cart-body"></div>
						</div>
					</div>

				</div>

				<div class="col-md-6">
					<div class="card-title custom-bg text-white">
						<h3>Checkout Details</h3>
					</div>

					<div class="card">
						<div class="card-body">

							<div class="form-group">
								<label for="name">User Name</label> <input type="text"
									class="form-control" value=<%=u.getName()%> id="name"
									name="userName" aria-describedby="nameHelp"
									placeholder="Enter Username" required>

							</div>
							<div class="form-group">
								<label for="emailId">Email address</label> <input type="email"
									class="form-control" id="emailId" value=<%=u.getEmail()%>
									name="emailId" aria-describedby="emailHelp"
									placeholder="Enter Email address" required>
							</div>


							<div class="form-group">
								<label for="phone" class="form-label">Phone</label> <input
									type="number" class="form-control" id="phone"
									value=<%=u.getPhone()%> name="phone"
									aria-describedby="phoneHelp" placeholder="Enter Phone number"
									required>
							</div>

							<div class="form-group">
								<label for="address" class="form-label">Address</label>
								<textarea class="form-control" id="address"
									value=<%=u.getAddress()%> aria-describedby="addressHelp"
									name="address" placeholder="Enter your Address" required></textarea>
							</div>

							<!-- the name attribute helps us the server know which variableis it mapped to in java side. -->

							<div class="container text-center mt-2">
								<button class="btn btn-outline-success">Continue
									Shopping</button>
								<button type="submit" class="btn btn-outline-warning">Order
									Now</button>
							</div>




						</div>
					</div>
				</div>

			</div>

		</form>
	</div>
</body>
</html>