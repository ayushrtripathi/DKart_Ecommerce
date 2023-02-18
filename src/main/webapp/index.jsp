<html>
<head>
<title>De-Kart</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- Includes -->
<!-- include is a JSP Directive, it helps us to add other jsp files in our current file-->
<%@include file= "components/common.jsp"%>




</head>

<!-- Internal Styling -->
<style>


	.jumbotron{ /*We use "." here as jumbotron is a class*/
	background-color: f4511E!important; /*important means use only this color in any case.This is highest priority now.*/
	color: #ffffff;
	border-top: solid;
	}
	
	.logo-small {
		color: #f4511E;
		font-size:50px;
	}
	footer, footer a{
		background-color: #f4511E;
		color:white;
	}
	footer a:hover, footer a:focus{
			color: #aaa;
			text-decoration: none;
			border-bottom: 1px solid;
	}
	
	footer .form-control{
	background-color: white;
	box-shadow: 0 1px 0 0 rgba(255,255,255,0.9);
	border: none;
	resize: none;
	color: #d1d2d2;
	padding: 0.7em 1em;
	}
</style>
<body>
	<%@include file= "components/navbar.jsp"%>  <!-- We have a seperate file for navbar -->
	<div class="jumbotron text-center"> <!-- Will put everything in center-->
		<h1>DE-KART</h1>
		<p>Online Merchandise for Everyone!</p>
		
		<div class= "container" style="width:40%; align:center;"> <!-- This will adjust the search bar as needed -->
			<div>
				<div class="input-group">
				<input type="email" class="form-control" placeholder="Enter your Email"> <!-- Using form ontrol here just for alignment -->
				
				<button class="btn btn-danger" value="Subscribe">Subscribe</button>
				</div>
			</div>	
		</div>
	</div>
	<div class="text-center">
		<h1>Services</h1>
		<p>What we offer</p>
		<div class="row">
			<div class="col-md-4">
				<span class="logo-small"><i class="fas fa-laptop"></i></span>
				<h3>LAPTOP</h3>
				<p>Laptops Section<p>
			</div>	
			<div class="col-md-4">
				<span class="logo-small"><i class="fas fa-phone"></i></span>
				<h3>MOBILE</h3>
				<p>Mobile Section<p>
			</div>	
			<div class="col-md-4">
				<span class="logo-small"><i class="fas fa-keyboard"></i></span>
				<h3>KEY BOARD</h3>
				<p>Keyboard Section</p>
			</div>	
			
		</div>
		<div class="row">
				<div class="col-md-4">
					<span class="logo-small"><i class="fas fa-gift"></i></span>
					<h3>GIFTS</h3>
					<p>Gifts Section</p>
				</div>	
				<div class="col-md-4">
					<span class="logo-small"><i class="fas fa-clock"></i></span>
					<h3>WATCHES</h3>
					<p>Watch Section</p>
				</div>	
				<div class="col-md-4">
					<span class="logo-small"><i class="fas fa-headphones"></i></span>
					<h3>HEADPHONES</h3>
					<p>Headphones Section</p>
				</div>	
				
		</div>
		
		
<!-- CAROUSELS CODE HTML HERE -->


		<div>
			<div id="carouselExampleControls" class="carousel slide" data-ride="carousel">
  <div class="carousel-inner">
    <div class="carousel-item active">
      <img class="d-block w-100" src="images/ai.jpg" alt="First slide">
    </div>
    <div class="carousel-item">
      <img class="d-block w-100" src="images/ai.jpg" alt="First slide">
    </div>
    <div class="carousel-item">
     <img class="d-block w-100" src="images/ai.jpg" alt="First slide">
    </div>
  </div>
  <a class="carousel-control-prev" href="#carouselExampleControls" role="button" data-slide="prev">
    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
    <span class="sr-only">Previous</span>
  </a>
  <a class="carousel-control-next" href="#carouselExampleControls" role="button" data-slide="next">
    <span class="carousel-control-next-icon" aria-hidden="true"></span>
    <span class="sr-only">Next</span>
  </a>
</div>
		</div>
		
<!-- FOOTER SECTION -->
<!-- Semantic tags are those tags which convey a meaning but dont actually have their own functionality built in eg header,footer,main -->


		<footer>
				<div>
					<div class="row">
						<div class="col-md-5">
							<h5><i class="fas fa-road"></i>De-Kart</h5>
								<div class="row">
									<div class ="col-md-6">
									<!-- Unordered list -->
									<ul class="list-unstyled"> <!-- No bullets or numbers will be added -->
										<li><a href="">Products</a></li>
										<li><a href="">Benefits</a></li>
										<li><a href="">Partners</a></li>
										<li><a href="">Team</a></li>
									</ul>
									</div>
									<div class ="col-md-6">
									<!-- Unordered list -->
									<ul class="list-unstyled"> <!-- No bullets or numbers will be added -->
										<li><a href="">Documents</a></li>
										<li><a href="">Support</a></li>
										<li><a href="">Legal Terms</a></li>
										<li><a href="">News</a></li>
									</ul>
									</div>
									
								</div>
								<!-- Navigation tabs -->
							<ul class="nav nav-pills nav-fill">
							  <li class="nav-item">
							    <a><i class="fab fa-facebook-f"></i></a>
							  </li>
							  <li class="nav-item">
							    <a><i class="fab fa-twitter"></i></a>
							  </li>
							  <li class="nav-item">
							    <a><i class="fab fa-instagram"></i></a>
							  </li>
							  <li class="nav-item">
							    <a><i class="fab fa-github"></i></a>
							  </li>
							</ul>
						</div>	
						
						<div class="col-md-2">
								<h5>Contact Us</h5>
						</div>
						<div class="col-md-5 mt-5">
								<form class="form-control">
									<fieldset>
										<input type="email" placeholder="Enter Email" class="form-control" id="example" required>
									</fieldset>
									<fieldset>
										<textarea placeholder="Enter Comments" class="form-control" id="message"></textarea>
									</fieldset>
									<fieldset>
										<input type="button" class="btn" id="button" value="Send" required>
									</fieldset>
								</form>
						</div>
					</div>
				</div>
				
		</footer>
		
	<%@include file="components/common_modal.jsp" %>
</body>
</html>
