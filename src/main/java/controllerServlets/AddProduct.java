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
@WebServlet("/AddProduct")
public class AddProduct extends HttpServlet
{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException 
	{
	
		Products product=new Products();
		
		product.setPizzaName(req.getParameter("pizza"));
		product.setDescription(req.getParameter("Description"));
		product.setSize(req.getParameter("size"));
		product.setPrice(Double.parseDouble(req.getParameter("price")));
		product.setCategory(req.getParameter("cat"));
		Part part=req.getPart("image");
		InputStream pic=part.getInputStream();
		byte[] image=pic.readAllBytes();
		product.setImage(image);
		
		MethodClass method=new MethodClass();
		
		try {
			int result=method.addProduct(product);
			RequestDispatcher response;
			if(result==1)
			{
				response=req.getRequestDispatcher("Admin.jsp");
				response.include(req, resp);
			}
			else
			{
				response=req.getRequestDispatcher("AddProduct.jsp");
				response.forward(req, resp);
				
			}
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
		
	}
	
}
