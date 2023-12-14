package controllerServlets;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dataAccessObject.MethodClass;
import dataTransferObject.UserDetails;

@WebServlet("/UserLogin")
public class UserLogin extends HttpServlet
{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException 
	{
		String email=req.getParameter("email");
		String password=req.getParameter("password");
	
		MethodClass method=new MethodClass();

		try 
		{
		
			UserDetails user=method.userLogin(email, password);
			

			if(user!=null)
			{
				if(user.getRole().equalsIgnoreCase("admin"))
				{
					
					RequestDispatcher response=req.getRequestDispatcher("Admin.jsp");
					req.getSession().setAttribute("Method", method);
					req.getSession().setAttribute("admin",user);
					response.include(req, resp);
					
				}
				else
				{
					
					RequestDispatcher response1=req.getRequestDispatcher("HomePage.jsp");
					req.getSession().setAttribute("Method", method);
					req.getSession().setAttribute("user",user);
					response1.forward(req, resp);
				}
			}
			else
			{
				req.setAttribute("loginError", " * Incorrect email or password");	
				RequestDispatcher response2=req.getRequestDispatcher("index.jsp");
				response2.forward(req, resp);
			}



		} catch (Exception e) {
			e.printStackTrace();
		}

	}

}
