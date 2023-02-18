package com.deloitte.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.util.Arrays;
import java.util.Random;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.deloitte.dao.OrderDAO;
import com.deloitte.dao.ProductDAO;
import com.deloitte.entities.Order;
import com.deloitte.entities.OrderProducts;
import com.deloitte.entities.Product;
import com.deloitte.entities.User;

/**
 * Servlet implementation class CheckoutServlet
 */
@WebServlet("/CheckoutServlet")
public class CheckoutServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public CheckoutServlet() {
		super();

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html");
		HttpSession s = request.getSession();
		try (PrintWriter out = response.getWriter()) {

			// *******************PERSISTING ORDER**********************//

			// Step1 randomly generate order numebr
			// 1a Generate a random number using random class
			Random r = new Random();
			int upperbound = 123456;
			int randomnbr = r.nextInt(upperbound); // generated random nmber betweeen 0 -123456

			// Step2: Prepare an order object
			// 2a prepare an order object with values - ordernbr uid date
			// order - ordernbr, uid, date

			String orderNbr = "ORD-" + randomnbr;
			User u = (User) s.getAttribute("currentuser");
			int uId = u.getId();
			Date ordDate = Date.valueOf("2021-11-08");
			// 2b generate order object
			Order o = new Order(orderNbr, uId, ordDate);

			// Step3 - Save it in database
			// persisting means saving in db
			// Create a DAO - OrderDAO to save; saveOrder()
			OrderDAO oDao = new OrderDAO();
			int isSaved = oDao.saveOrder(o);

			System.out.println("ordernbr : " + orderNbr + " orderId : " + isSaved + "Created & Saved Successfully");

			// outcome - order nbr that could be displayed for user

			// Step 4: Keeping the generated OrderNbr in session
			s.setAttribute("orderNbr", orderNbr);

			// outcome - ordernumber that could be displayed for user.

			// ****************************PERSISTING PRODUCT
			// DETAILS**********************************//

			// (pricepu, qty, id ) against a created order

			// Step1 Need to get the ALL orderd product details from checkout page
			// using request.getparameter()

			// 1a getting using hidden parameter
			String[] valuesFromJSP = request.getParameterValues("productDetails");
			System.out.println(" ################ " + Arrays.toString(valuesFromJSP));
			// returns ths - [1@DELL Inspiron Core i3 10th Gen - (8 GB/1 TB HDD/Windows 10
			// Home) Inspiron 3501 Laptop (15.6 inch, Softmint, 1.83 kg, With MS
			// Office)@22500@1@22500, 4@SAMSUNG Galaxy A12 (White, 64 GB) (4 GB
			// RAM)@15520@3@46560, 8@PlayStation 5@57000@1@57000,
			// 3@Lenovo-ideapad-flex-5-core-i3-10th-gen-4-gb-256-gb-ssd-windows-10-home-14iil05-2-1-laptop@42750@1@42750]

			// STEP2 Loop through
			for (String str : valuesFromJSP) {

				String[] productSplitValues = str.split("@");
				// productSplitValues[0] -> will have id
				// productSplitValues[1] -> will have pName
				// productSplitValues[2] -> will have DiscountedPrice
				// productSplitValues[3] -> will have Quantity
				// productSplitValues[4] -> will have Product to price

				// 2a Create an object of OrderProducts.java entity
				OrderProducts op = new OrderProducts();

				// 2b Set the values(of each ordered product)
				// Product
				// a) Goto db based on an ID and get product object
				// (b) Prepare a product object using the order/checkout details

				// object [already created above, use the same]
				op.setOrder(o);

				// a) Product - Go to DB based on ID and get product object
				// b) Prepare a product object using th order/checkout details

				// a)

				Product p = new ProductDAO().fetchProductById(Integer.parseInt(productSplitValues[0]));
				op.setProduct(p);
				// b)

				op.setPricePerUnit(Integer.parseInt(productSplitValues[2]));

				op.setQuantity(Integer.parseInt(productSplitValues[3]));
				
				// Step 3 Use a DAO of product / order
				OrderDAO od = new OrderDAO();
				int opId=od.saveOrderProducts(op);

			}

			response.sendRedirect("orderDetails.jsp");

		} catch (Exception e) {
			e.printStackTrace();
		}

	}

}