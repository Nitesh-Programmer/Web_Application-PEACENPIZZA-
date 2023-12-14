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
import dataTransferObject.AddToCart;
import dataTransferObject.Products;
import dataTransferObject.UserDetails;

@WebServlet("/PlusfromCart")
public class AddItemFromCart extends HttpServlet
{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException 
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

			RequestDispatcher dispatcher=req.getRequestDispatcher("com.addtocart.jsp");
			dispatcher.include(req, resp);

		} catch (NumberFormatException | ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}

	}

}
