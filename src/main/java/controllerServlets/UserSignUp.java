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

@WebServlet("/Signup")
public class UserSignUp extends HttpServlet 
{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException 
	{
	
		UserDetails user=new UserDetails();
		MethodClass method=new MethodClass();
		
		user.setFirst_name(req.getParameter("firstName"));
		user.setLast_name(req.getParameter("lastName"));
		user.setAge(Integer.parseInt(req.getParameter("age")));
		user.setEmail(req.getParameter("email"));
		user.setPhno(Long.parseLong( req.getParameter("phno")));
		user.setPassword(req.getParameter("confrimpassword"));
		
		RequestDispatcher dispatcher;
		
		try {
			if(method.emailExist(user.getEmail()))
			{
				req.getSession().setAttribute("emailError", "This email id is already presented");
				dispatcher = req.getRequestDispatcher("SignUp.jsp");	
				dispatcher.forward(req, resp);
			}
			else {
				req.getSession().setAttribute("user", user);
				dispatcher=req.getRequestDispatcher("OTPverification.jsp");
				dispatcher.forward(req, resp);
			}
		} catch (ClassNotFoundException | SQLException e) 
		{
			e.printStackTrace();
			 req.getSession().setAttribute("emailError", "Error checking email existence");
	           dispatcher = req.getRequestDispatcher("SignUp.jsp");
	            dispatcher.forward(req, resp);
		}
		
		
		
	}
	
}
