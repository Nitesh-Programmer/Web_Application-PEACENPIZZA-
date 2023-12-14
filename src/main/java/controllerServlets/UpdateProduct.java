package controllerServlets;


import java.io.IOException;
import java.io.InputStream;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import dataAccessObject.MethodClass;
import dataTransferObject.Products;

@MultipartConfig(maxFileSize = 16177216)
@WebServlet("/UpdateProduct")
public class UpdateProduct extends HttpServlet
{

	
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException 
	{
		
		
		Products product=(Products)req.getSession().getAttribute("product");
	
		
		System.out.println(product);
		MethodClass method= new MethodClass();
		
		System.out.println(req.getParameter("Id"));
		product.setId(Integer.parseInt(req.getParameter("Id")));
		product.setPizzaName(req.getParameter("pizza"));
		product.setDescription(req.getParameter("Description"));
		product.setSize(req.getParameter("size"));
		product.setPrice(Double.parseDouble(req.getParameter("price")));
		product.setCategory(req.getParameter("cat"));
		
		Part pic=req.getPart("image");
		
		if(pic.getSize()>1)
		{
			InputStream img=pic.getInputStream();
			byte[] image=img.readAllBytes();
			product.setImage(image);
			System.out.println("hello");
		}
		
		
	
		try {
			method.updateProduct(product);
			RequestDispatcher response=req.getRequestDispatcher("Admin.jsp");
			response.forward(req, resp);
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
