package controllerServlets;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dataAccessObject.MethodClass;
import dataTransferObject.AddToCart;
import dataTransferObject.Products;
import dataTransferObject.UserDetails;

@MultipartConfig(maxFileSize = 16177216)
@WebServlet("/PlusCart")
public class AddItemFromHP extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException 
	{
	
		
		
		MethodClass method=(MethodClass)req.getSession().getAttribute("Method");
		
		UserDetails user=(UserDetails)req.getSession().getAttribute("user");
		
		AddToCart cart=new AddToCart();
		
		try {
			Products product=method.findById(Integer.parseInt(req.getParameter("id")));
				
			cart.setProductId(product.getId());
			cart.setUserId(user.getId());
			cart.setQuantity(1);
			
			method.addtoCart(cart);
			
			RequestDispatcher dispatcher=req.getRequestDispatcher("HomePage.jsp");
			dispatcher.include(req, resp);
				
		} catch (NumberFormatException | ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
		
		
		
	}

	

}
