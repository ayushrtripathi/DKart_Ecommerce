//for every table we make a different DAO/ becuae of multiple retrieve uodate of data

package com.deloitte.servlets;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.nio.file.Path;
import java.nio.file.Paths;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.deloitte.dao.CategoryDAO;
import com.deloitte.dao.ProductDAO;
import com.deloitte.entities.Category;
import com.deloitte.entities.Product;

@WebServlet("/AdminServlet")
//multipat encofing annotaiton is to be added
@MultipartConfig
public class AdminServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
  
/*    public AdminServlet() {
        super();
        // TODO Auto-generated constructor stub
    }
*/
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		HttpSession hs = request.getSession();
		
		try(PrintWriter out = response.getWriter()){
			String operation = request.getParameter("operation"); //operation is the variablename we have put in name paramter in admin.jsp file
			//FLAG : "addCategory":"addProduct
			
			ProductDAO pDao = new ProductDAO();
			CategoryDAO cDao = new CategoryDAO();
			if(null!= operation && "addCategory".equals(operation)) {
				
				String catTitle = request.getParameter("catTitle");
				String catDescription = request.getParameter("catDescription");
				
				
				Category c = new Category(catTitle, catDescription);
				
				
				//Saving to database
		
				int catId = (int) cDao.saveCategory(c);
				
				hs.setAttribute("success","Category Added Successful :");
				response.sendRedirect("admin.jsp");
				
				
			}else if(null!= operation && "addProduct".equals(operation)) {
				
				String pn = request.getParameter("productName");
				String productImage	 = request.getParameter("productImage");
				String pd = request.getParameter("productDescription");
				Integer pp = Integer.parseInt(request.getParameter("productPrice"));
				
				Integer pdi = Integer.parseInt(request.getParameter("productDiscount"));
				Integer pq = Integer.parseInt(request.getParameter("productQty"));
				String cid = request.getParameter("catId"); //category id
				
				
				/*Product(String productName, 
				 * String productImage, 
				 * String productDesc, 
				 * Integer productPrice, 
				 * Integer productQty,
						Integer productDiscount, 
						Category category) 
						
						*/
				//A standard code which can be applied to any other project, using this for image in projects
				//file browsing logic 
				Part part = request.getPart("productImage");
				String partHeader = part.getHeader("content-disposition");
				System.out.println("partheader:" +partHeader); //entire text inside a header is a string sepearerted with ;
				String fileNameWithPath = null;
				for(String content: partHeader.split(";")) {
					if(content.trim().startsWith("filename")) {
						fileNameWithPath=content.substring(content.indexOf("=")+1).trim().replace("\"",""); //removing " " empty spaces
						}
					}
				Path pa = Paths.get(fileNameWithPath);
				Path fileName = pa.getFileName();
				
				String imgPath = request.getServletContext() 
						.getRealPath("images")
						+ File.separator 
						+ "products" 
						+ File.separator 
						+ fileName;
				
				// IO package : classes - that  read and write files
				//FileInputStream -> Read files as stream
				//FileOutputStream -> write data
				try(InputStream is = part.getInputStream();
						FileOutputStream fos = new FileOutputStream(imgPath)){
					
					//creating an empty byte array with <FileSize>
					byte[] data = new byte[is.available()];
					//Reading the data from "is" and putting it in Byte Array above 
					is.read(data);
					
					//Write the BYTE array to the output stream specified.
					fos.write(data);
					
				}
				catch(Exception e) {
					e.printStackTrace();
				}
			
			
			
					

				//fetch category record from db based on category id catId;
				Category c= cDao.fetchCategoryById(Integer.parseInt(cid));
				
		
				
		//SAVE Project
				
				
				//Build Product Object
				
				Product p = new Product(pn,fileNameWithPath,pd,pp,pq,pdi,c);
				int pId = (int) pDao.saveProduct(p);
				
				if(pId>0) {
					hs.setAttribute("success", "Product has been successfully added!");
				}else {
					hs.setAttribute("warning", "Error : Product couldn't be added!");
				}
					response.sendRedirect("admin.jsp");
				
			}
		}
		catch(Exception e) {
			e.printStackTrace();
		}

	}

}
