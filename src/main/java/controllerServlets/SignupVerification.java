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

@WebServlet("/signupVerification")
public class SignupVerification extends HttpServlet 
{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException 
	{
	
		String userOTP=req.getParameter("userOTP");
		String generatedOTP=(String)req.getAttribute("otp");
		System.out.println("signupVerification page");
		
		if(userOTP.equals(generatedOTP))
		{
			MethodClass method=new MethodClass();
			UserDetails user=(UserDetails) req.getSession().getAttribute("user");
			try 
			{
				method.newUser(user);
				
			} catch (Exception  e) 
			{
				req.setAttribute("emailError", "This e-mail is already presented. So try to login.");
				RequestDispatcher dispatcher=req.getRequestDispatcher("SignUp.jsp");
				dispatcher.forward(req, resp);
				
			}
		}
		
	
	}

}
