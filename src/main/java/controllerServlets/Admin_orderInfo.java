package controllerServlets;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/previous")
public class Admin_orderInfo extends HttpServlet 
{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException 
	{
	
	
		long userId=(Long.parseLong(req.getParameter("id")));
		String name=req.getParameter("name");
		
		req.setAttribute("userId", userId);
		req.setAttribute("username", name);
		RequestDispatcher dispatcher=req.getRequestDispatcher("Admin_orderInfo.jsp");
		
		dispatcher.forward(req, resp);
		
			
	}
}
