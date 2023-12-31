package controllerServlets;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dataAccessObject.MethodClass;
import dataTransferObject.Feedback;
import dataTransferObject.UserDetails;

//@WebServlet("feedback")
public class InsertFeedBack extends HttpServlet 
{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException 
	{
		MethodClass method=new MethodClass();
		
		Feedback feed=new Feedback();
		UserDetails user=(UserDetails) req.getSession().getAttribute("user");
		
		feed.setUserName(req.getParameter("user_name"));
		feed.setUserMail(req.getParameter("email"));
		feed.setFeedback("user_feedback");
		feed.setFeed_id(user.getId());
		
		try 
		{
			method.inertFeedBack(feed);
			RequestDispatcher dispatcher=req.getRequestDispatcher("HomePage.jsp");
			dispatcher.forward(req, resp);
			
		} 
		catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
		
	}

}
