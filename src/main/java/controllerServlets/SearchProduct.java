package controllerServlets;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dataAccessObject.MethodClass;
import dataTransferObject.Products;

@WebServlet("/search_product")
public class SearchProduct extends HttpServlet 
{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException 
	{
	
			String result=req.getParameter("search_value");
	
			
			MethodClass method=(MethodClass)req.getSession().getAttribute("Method");
			
			try 
			{
			List<Products>list=	method.searchProduct(result);
			
			req.setAttribute("search_bar", list);
			RequestDispatcher dispatcher=req.getRequestDispatcher("SearchItems.jsp");
			dispatcher.include(req, resp);
				
				
			} catch (ClassNotFoundException | SQLException e) {
				e.printStackTrace();
			}
			
	
	}
	
	
}
