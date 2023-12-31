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
import dataTransferObject.ContactAdmin;
import dataTransferObject.UserDetails;

@WebServlet("/contactpage")

public class InsertContactPage extends HttpServlet 
{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException 
	{
	
		MethodClass method=new MethodClass();
		
		ContactAdmin contact=new ContactAdmin();
		UserDetails user=(UserDetails) req.getSession().getAttribute("user");
		
		contact.setUserName(req.getParameter("user_name"));
		contact.setEmail(req.getParameter("email"));
		contact.setMessage(req.getParameter("user_message"));
		contact.setContact_userId(user.getId());
		
		try 
		{
			method.insertContact(contact);
			RequestDispatcher dispatcher=req.getRequestDispatcher("HomePage.jsp");
			dispatcher.forward(req, resp);
		} 
		catch (ClassNotFoundException | SQLException e) 
		{
			e.printStackTrace();
		}
	}

}
