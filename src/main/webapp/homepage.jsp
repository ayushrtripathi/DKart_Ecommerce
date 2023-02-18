<%@page import= "com.deloitte.entities.User" %>
<%@page import= "com.deloitte.servlets.LoginServlet" %>
<%@page import= "com.deloitte.dao.CategoryDAO" %>
<%@page import= "com.deloitte.dao.ProductDAO" %>
<%@page import= "com.deloitte.entities.Product" %>
<%@page import= "com.deloitte.entities.Category" %>
<%@page import= "java.util.List" %>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%
	User u = (User) session.getAttribute("currentuser");
	if(u==null){
		session.setAttribute("warning","Please Login first!");
		response.sendRedirect("login.jsp");
		return;
	}

%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<%@ include file="components/common.jsp" %>
</head>
<body>

	<%@ include file="components/navbar.jsp" %>
	
	<%
	
		String catId = request.getParameter("category");
	
	ProductDAO pDao = new ProductDAO();
	List<Product> p1= null;
	
	//on page load :Scenario1
			if(""==catId || null == catId || catId.equals("All")){
				//Fetching all products
				p1=pDao.fetchProducts();
			}else{ //fetch only selectrd category
				p1=pDao.fetchProductsByCatId(Integer.parseInt(catId));
			}
	
	
		CategoryDAO cDao = new CategoryDAO();
		List<Category> cl = cDao.fetchCategories();
		
		
		
	
	
	%>
	
	<div class="container-fluid">
		<div class="row mt-3 mx-2">
			<!-- Display categories -->
			<div class="col-md-2">
				<div class= list-group>
				
				<% 
				
				String isAllProductsActive = ""; 
				
				if("All".equals(catId) || "".equals(catId) || null==catId){
					isAllProductsActive = "active";
				}
				
				%>
					<a href="homepage.jsp?category=All" class="list-group-item list-group-item-action <%=isAllProductsActive%>">
					All Products
					</a>
					<!-- Displaying all the categories dynamically -->
					<%
						//Scriptlet
						String categoryActive;
						
						for(Category c: cl){
							
							if(!isAllProductsActive.equals("active")&& 
									c.getCategoryId()==Integer.parseInt(catId)){
								categoryActive ="active";
								
							}else{
								categoryActive = "";
								
							}
					%>
					
					<a href="homepage.jsp?category=<%=c.getCategoryId() %>" 
					class="list-group-item list-group-item-action <%=categoryActive%>">
						<%=c.getTitle()%>
					</a>
					<%
					
						
						}
					%>
				</div>
			</div> <!-- End of display category -->
		
			<div class="col-md-10 text-center">
				
				<div class="row">
				 <div class="col-md-12">
					
							<div class="card-columns">
								
								<%
									//for loop for products
									//loop through products
								if(null != p1 && !p1.isEmpty()){
									
									for(Product p:p1){
								%>
								<div class="card"> <!-- this product-card is our custom class and not bootstrap's -->
									<div class="card-body text-center">
										<img src="images/products/<%=p.getProductImage()%>" alt="<%=p.getProductName()%>" >
											<div class="container">
												<h5>
												<%=p.getProductName() %>
												
												</h5>
												<p>
												<%=p.getProductDescription() %>
												</p>
												
											</div>
									</div>
								
									<div class="card-footer text-center">
										<button class="btn custom-bg text-white" onclick = "add_to_cart(<%=p.getProductId()%>,
																									 '<%=p.getProductName()%>', 
																									 <%=p.getDiscountedPrice()%>)";>
											Add to Cart
										</button>
										<button class="btn btn-outline-success">
										
										&#8377;<%=p.getDiscountedPrice()%>
												
												
												<span class="text-secondary original-price">&#8377;<%=p.getProductPrice()%>/-</span>
												<span class="text-secondary discount-label"><%=p.getProductDiscount()%>%</span>
										
										</button>
									
									</div>
									
								</div>
								
								
								<%
									}
								
								}else{
								%>
								<div class="card-body">
								<h5 class="card-title" style="max-height: 125px;">
								No Products to display for the category.
								</h5>
								</div>
								<%
									}
								
								%>
								
							</div>
				
				</div>
				</div>
			</div>	
				
			
			</div><!-- End of class=row -->
	
	
	</div> <!-- End of category -->
	
	<%@include file="components/common_modal.jsp" %>
	
	
	

</body>
</html>