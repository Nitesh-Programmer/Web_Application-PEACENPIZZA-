package controllerServlets;

import java.io.IOException;

import javax.mail.MessagingException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dataAccessObject.MethodClass;

@WebServlet("/replytoUser")
public class ReplyMessage extends HttpServlet 
{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException 
	{
			
	
			MethodClass method=(MethodClass)req.getSession().getAttribute("Method");
			
			try 
			{
				method.replyMail(req.getParameter("toMail"),req.getParameter("subject") ,req.getParameter("reply_message") );
				RequestDispatcher dispatcher=req.getRequestDispatcher("Admin.jsp");
				dispatcher.forward(req, resp);
				
			} catch (MessagingException | IOException e) {
				e.printStackTrace();
			}
			
	
	}
}
