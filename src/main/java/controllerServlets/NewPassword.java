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

@WebServlet("/newPassword")
public class NewPassword extends HttpServlet 
{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException 
	{
		String password=req.getParameter("confrimpassword");
		String email=(String) req.getSession().getAttribute("PasswordMail");
		
		MethodClass method=new MethodClass();
		
		try 
		{

			method.forgetPassword(email, password);
			RequestDispatcher dispatcher=req.getRequestDispatcher("index.jsp");
			dispatcher.forward(req, resp);
			
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
		
	}

}
