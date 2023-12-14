package controllerServlets;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dataAccessObject.MethodClass;
import dataTransferObject.UserDetails;

@WebServlet("/orderfinish")
public class OrderPlaced extends HttpServlet 
{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException 
	{
	
		MethodClass method=(MethodClass)req.getSession().getAttribute("Method");
		
		UserDetails user=(UserDetails)req.getSession().getAttribute("user");
		
		try 
		{
		
			method.orderFinish(user.getId());
			method.deleteFromCart(user.getId());
			
			RequestDispatcher dispatcher=req.getRequestDispatcher("HomePage.jsp");
			dispatcher.include(req, resp);
		 
			
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
		
		
		
	
	}
	
}
