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

@WebServlet("/userInsert")
public class UserInsert extends HttpServlet 
{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException 
	{

		UserDetails user=(UserDetails)req.getSession().getAttribute("user");

		MethodClass method =new MethodClass();

		try {
			method.newUser(user);
			RequestDispatcher dispatcher=req.getRequestDispatcher("index.jsp");
			dispatcher.forward(req, resp);
		} catch (Exception  e) {
			e.printStackTrace();
		}

	}

}
