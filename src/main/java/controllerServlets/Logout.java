package controllerServlets;

import java.io.IOException;


import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/logout")
public class Logout extends HttpServlet
{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException 
	{
		
			HttpSession session=req.getSession(false);
			session.removeAttribute("admin");
			session.removeAttribute("method");
			session.removeAttribute("product");
		
			session.invalidate();
			
			
//			resp.sendRedirect("index.jsp");
		
			RequestDispatcher response=req.getRequestDispatcher("index.jsp");
			response.forward(req, resp);
			
	}
}
