package controllerServlets;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dataAccessObject.MethodClass;
import dataTransferObject.Products;
@MultipartConfig(maxFileSize = 16177216)
@WebServlet("/edit")
public class EditProduct extends HttpServlet 
{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException 
	{
		MethodClass method=new MethodClass();
		
		try 
		{
			Products product=method.findById(Integer.parseInt(req.getParameter("id")));
			req.getSession().setAttribute("product", product);
			RequestDispatcher response=req.getRequestDispatcher("EditProduct.jsp");
			
		
			response.include(req, resp);
			
		} catch (NumberFormatException | ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
		
	}

}
