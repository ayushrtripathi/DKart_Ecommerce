function add_to_cart(pid, pname, pprice){
	//1. create product object - with Input parameters
	//2. ADD products object to an Array
	//3. Create a cart - in local storage
	//4. Add array to the cart
	//**In the cart we are storing array of product objects***
	
	let cart = localStorage.getItem("cart");
	
	//for the very first time cart will not be present so this condition is used
	
	if(cart==null){
	let products=[];
	//create cart if not present
		let product = {productId: pid, productName: pname, productQty:1, productPrice: pprice }
		
		//adding it to array
		products.push(product);
		
		//create the cart
		localStorage.setItem("cart",JSON.stringify(products)); //Always it stores strings
		
		console.log('Cart is created and Product id : '+pid+" got added");
	}
	else{
		//update product selected in already existing cart. in LS
		
		let pcart = JSON.parse(cart); //if we have the cart already in LocalStorage we bring it here again.
		
		//to check if incomuing product already exists in local storage or not
		let oldProduct = pcart.find((item) => item.productId == pid);
		
		
		if(oldProduct){
			//updating the quantity of the existing product (taken into a variable - oldproduct])
			oldProduct.productQty = oldProduct.productQty + 1;
			
			//pcart :Array of product objects
			//for each object in the pcart array -- apply the mentioned logic
			//map applies a logic to everyone onebyone
			pcart.map(item =>{
				if(item.productId ==oldProduct.productId){
					item.productQty = oldProduct.productQty;
				}
			})
			localStorage.setItem("cart", JSON.stringify(pcart));
			console.log("Product: "+pid+" exists in cart Quantity Increased to: "+oldProduct.productQty);
		}else{
		//create an object for the new product getting added	
		let product = {productId: pid, productName: pname, productQty:1, productPrice: pprice }
		
		//adding the new product to the existing array
		pcart.push(product);
		
		//create the cart
		localStorage.setItem("cart",JSON.stringify(pcart)); //Always it stores strings
		
		console.log("New Product with id : "+pid+" added to cart : ");
			
			
		} //end of "Adding new product" - else section
	} //end of update cart else condition
	updateCart();
}// end of add-to-cart

//updateCart();
//use this for adding in table (cart modal table)from local storage
function updateCart(){
	
	//to update the table to be displayed
	let cartString = localStorage.getItem("cart");
	//local variables
	let cart = JSON.parse(cartString);
	
	//prints th enumber of product
	if(null!= cart){
		console.log("Number of Products in cart" +cart.length)}
	
	//if cart is null the checkout button should be disabled
	if(cart == null || cart.length == 0){
		
			
		//cart item numebr in icon //cart is empty
		console.log("No products in cart!");
		$(".cart-items").html("0")
		
		//disable the checkout button
		
		$(".cart-body").html("<h3>No Products in the class.</h3>")
		$(".chkout-btn").attr("disabled","disabled")
		$(".chkout-btn").addClass("btn btn-secondary")
		
	}else{
		//enable the button
		$(".chkout-btn").removeAttr("disabled").removeClass("btn-secondary");
		$(".chkout-btn").addClass("btn btn-primary")
		$(".cart-items").html(`${cart.length}`)
		
		
	
		// ``backticks help us not write the escape seqwuwndws we can use "" anytime we want iwthout /
		let table =
		`
		<table class="text-center table">
			<thead>
				<tr>
				 	<th>Product Name</th>
					<th>Price</th>
					<th>Quantity</th>
					<th>Total</th>
					<th>Action</th>
					<th></th>
				<tr>
			</thead>
			
		`
			//create a table and add it to cart body (in common-modal.jsp) 	$(".cart-body").html("<h3>No products in cart</h3>")
		let totalPrice=0;
		
		cart.map(item =>
					{table +=
						`
						<tr>
						
							<td value = ${item.productName} name="pName">${item.productName}</td>
							<td value = ${item.productPrice} name="pPrice">${item.productPrice}</td>
							<td value = ${item.productQty} name="pQty">${item.productQty}</td>
							<td value = $${item.productQty * item.productPrice} name="pTotal">${item.productPrice * item.productQty}</td>
							<td>
								<button onclick="deleteProductFromCart(${item.productId})" 
																		class="btn btn-danger">
									Remove
								</button>
							</td>	
							<input type="hidden" name="productDetails"
															 value ="${item.productId}@${item.productName}@${item.productPrice}@${item.productQty * item.productPrice}">
						</tr>
						
						`;
						totalPrice += (item.productPrice * item.productQty)	;
						})
						table+=`
							<tr>
							<td></td>
							<td colspan="2"><b>Total Price</b></td>
							<td><b>${totalPrice}<b></td>
							</tr>`
						
						
						table+=`</table>`;
								$(".cart-body").html(table);
	}
}

$(document).ready(function(){
		updateCart();
		
		
});

function deleteProductFromCart(pid){
	//deleting product from cart by Remove Button
	let cart = JSON.parse(localStorage.getItem("cart"));
	let newcart = cart.filter(item=> item.productId != pid);
	localStorage.setItem("cart",JSON.stringify(newcart));
	updateCart();
}

function goToCheckout(){
	window.location.href = "checkout.jsp"; /*Helps us to navigate*/

}