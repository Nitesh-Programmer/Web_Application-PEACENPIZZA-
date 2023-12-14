package controllerServlets;

import java.io.IOException;
import java.sql.SQLException;

import javax.mail.MessagingException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dataAccessObject.MethodClass;


@WebServlet("/forgetpasswordMail")
public class ForgetPassword extends HttpServlet 
{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException 
	{
		String email=req.getParameter("mail");
		
		
		MethodClass method=new MethodClass();
		
		req.getSession().setAttribute("PasswordMail", email);
		RequestDispatcher dispatcher;
		try 
		{
			if(method.emailExist(email)) 
			{
			
				String otp=method.send(email);
				req.getSession().setAttribute("generatedOTP",otp);
				dispatcher=req.getRequestDispatcher("PasswoedChange.jsp");
				dispatcher.forward(req, resp);
				
			}
			else {
				req.setAttribute("mailNotExist", "This mail id is not found");
				dispatcher=req.getRequestDispatcher("ForgetPassword.jsp");
				dispatcher.forward(req, resp);
			}
			
			
		} catch (ClassNotFoundException | SQLException | MessagingException e) {
			e.printStackTrace();
		}
	}

}
