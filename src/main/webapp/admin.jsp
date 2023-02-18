<!-- We are storingonly the image file name on Database, the file image we store in the tomcat, for this only we use part,paths, inputreaders etc in adminservlet.java -->

<%@page import="java.util.List"%>
<%@page import="com.deloitte.entities.User"%>
<%@page import="com.deloitte.servlets.AdminServlet"%>
<%@page import="com.deloitte.dao.CategoryDAO"%>
<%@page import="com.deloitte.dao.ProductDAO"%>
<%@page import="com.deloitte.entities.Category"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%
	User u = (User) session.getAttribute("currentuser");

	if(u == null){
		session.setAttribute("warning", "You are not Logged In !! Login First");
		
		response.sendRedirect("login.jsp");
		return;
	}else if("enduser".equals(u.getRole())){
		session.setAttribute("warning", "You are not an Admin !! No acess to admin page");
		response.sendRedirect("homepage.jsp");
		return;
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
	<%@include file="components/common.jsp" %>
</head>
<body>

	<!-- Includes -->                        
    
    <%@include file="components/navbar.jsp" %>


	
	<div class="container-fluid admin">
	<div class="mt-3">
	<%@ include file="components/response.jsp" %>
	</div>
		<div class="row mt-3">
			<div class="col-md-4">
				<div class="card border-dark">
					<div class="card-body text-center">
						<div class="container">
							<img class="img-fluid rounded-circle" alt="user_image" src="images/adminpage_group.png" width="150px">
							<h3>12345</h3>
							<h3 class="text-uppercase text-muted">Users</h3>
						</div>
					</div>
				</div>
			</div>
			<div class="col-md-4">
				<div class="card border-dark">
					<div class="card-body text-center">
						<div class="container">
							<img class="img-fluid rounded-circle" alt="user_image" src="images/adminpage_group.png" width="150px">
							<h3>12345</h3>
							<h3 class="text-uppercase text-muted">Products</h3>
						</div>
					</div>
				</div>
			</div>
			<div class="col-md-4">
				<div class="card border-dark">
					<div class="card-body text-center">
						<div class="container">
							<img class="img-fluid rounded-circle" alt="user_image" src="images/adminpage_group.png" width="150px">
							<h3>12345</h3>
							<h3 class="text-uppercase text-muted">Categories</h3>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="row mt-3 mb-3">
			<div class="col-md-4 offset-md-2">
				<div class="card border-dark" data-toggle="modal" data-target="#add-category-modal">
					<div class="card-body text-center">
						<div class="container">
							<img class="img-fluid rounded-circle" alt="user_image" src="images/adminpage_group.png" width="150px">
							<h3>Click here to add Category</h3>
							<h3 class="text-uppercase text-muted">Add a new Category</h3>
						</div>
					</div>
				</div>
			</div>
			<div class="col-md-4">
				<div class="card border-dark" data-toggle="modal" data-target="#add-product-modal">
					<div class="card-body text-center">
						<div class="container">
							<img class="img-fluid rounded-circle" alt="user_image" src="images/adminpage_group.png" width="150px">
							<h3>Click here to add Product</h3>
							<h3 class="text-uppercase text-muted">Add a new Product </h3>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- Add category modal -->
		<!-- Button trigger modal 
		<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal">
		  Launch demo modal
		</button> -->
		
		<!-- Category Modal -->
		<div class="modal fade" id="add-category-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
		  <div class="modal-dialog modal-dialog-centered" role="document">
		    <div class="modal-content">
		      <div class="modal-header custom-bg text-white">
		        <h5 class="modal-title" id="exampleModalLabel">Add Category</h5>
		        <button type="button" class="close text-white" data-dismiss="modal" aria-label="Close">
		          <span aria-hidden="true">&times;</span>
		        </button>
		      </div>
		      <div class="modal-body">
		        <form action="AdminServlet" method= "post">
		        	<input type=hidden name="operation" value="addCategory"> <!-- This works like a flag throug this we can use the same servelt for both add cateogry as well as products functionality, name -> variable value-> is the value to be given to the variable "name" whicwill futther be used to determine what operation is a user doing -->
		        	<div class="form-group">
		        		<label for="catTitle" class="font-weight-bold">Category Title</label>
						<input type="text" class="form-control" id="catTitle" placeholder="Enter your Category Title" name="catTitle" required>
		        	</div>
		        	<div class="form-group">
						 <label for="catDescription" class="font-weight-bold">Category Description</label>
						 <textarea class="form-control" id="catDescription" name="catDescription" placeholder="Enter your Category Description" required></textarea>
					</div>
					<div class="modal-footer">
					<button type="submit" class="btn btn-outline-success">Add</button>
		        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
		        
		      </div>
		      </form>
		        
		      </div>
		      
		    </div>
		  </div>
		</div>
		
		<!-- Product Modal -->
		<div class="modal fade" id="add-product-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
		  <div class="modal-dialog modal-dialog-centered" role="document">
		    <div class="modal-content">
		      <div class="modal-header custom-bg text-white">
		        <h5 class="modal-title" id="exampleModalLabel">Add Product</h5>
		        <button type="button" class="close text-white" data-dismiss="modal" aria-label="Close">
		          <span aria-hidden="true">&times;</span>
		        </button>
		      </div>
		      <div class="modal-body">
		        <form action="AdminServlet" method= "post" enctype="multipart/form-data"> <!-- enctypeThis helps in necoding whenever we deal with file -->
		        	<input type=hidden name="operation" value="addProduct" >
		        	<div class="form-group">
		        		<label for="productName" class="font-weight-bold">Product Name</label>
						<input type="text" class="form-control" id="productName" placeholder="Enter your Product Name" name="productName" required>
		        	</div>
		        	<div class="form-group">
						 <label for="productDescription" class="font-weight-bold">Product Description</label>
						 <textarea class="form-control" id="productDescription" name="productDescription" placeholder="Enter your Product Description" required></textarea>
					</div>
					<div class="form-group">
		        		<label for="productPrice" class="font-weight-bold">Product Price</label>
						<input type="number" class="form-control" id="productPrice" placeholder="Enter your Product Price" name="productPrice" required>
		        	</div>
		        	<div class="form-group">
		        		<label for="productDiscount" class="font-weight-bold">Product Discount</label>
						<input type="number" class="form-control" id="productDiscount" placeholder="Enter Product Discount" name="productDiscount" required>
		        	</div>
		        	<div class="form-group">
		        		<label for="productQty" class="font-weight-bold">Product Quantity</label>
						<input type="text" class="form-control" id="productQty" placeholder="Enter Product Quantity" name="productQty" required>
		        	</div>
		        	<div class="form-group">
		        		
						
		        	<%
		        		CategoryDAO cDao = new CategoryDAO();
		        				List<Category> l= cDao.fetchCategories();
		        				
		        	%>
		        	<div>
		        		<label for="catId" class="font-weight-bold">Select Category</label>
		        		<select  class="form-control" id="catId" name="catId">
		        		<%
		        			for(Category c:l){
		        				
		        				
		        		%>
		        		<option value="<%=c.getCategoryId() %>"><%= c.getTitle() %></option>
		        			
		        		<%
		        			}
		        		%>
		        		</select>
		        	</div>
		        	
		        	</div>
		        	
		        	
		        	
		        	<div class="form-group">
		        		<label for="productImage" class="font-weight-bold">Select Product Image</label>
						<input type="file" class="form-control" id="productImage" name="productImage">
		        	</div>
		        	<div class="modal-footer">
		        	<button type="submit" class="btn btn-outline-success">Add</button>
		        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
		        
		      </div>
		      </form>
		      </div>
		      
		    </div>
		  </div>
		</div>

	</div>
</body>
</html>