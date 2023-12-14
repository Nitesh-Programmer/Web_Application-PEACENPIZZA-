package controllerServlets;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dataAccessObject.MethodClass;

@WebServlet("/delete")
public class DeleteProduct extends HttpServlet 
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
			method.deleteProduct(Integer.parseInt(req.getParameter("id")));
			
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
	}
	
}
