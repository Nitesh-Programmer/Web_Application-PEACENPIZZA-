<%@page import="java.util.Base64"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Blob"%>
<%@page import="dataTransferObject.PlacedOrders"%>
<%@page import="dataTransferObject.AddToCart"%>
<%@page import="dataAccessObject.MethodClass"%>
<%@page import="java.util.List"%>
<%@page import="dataTransferObject.UserDetails"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>PEACENPIZZA</title>

<link rel="stylesheet" href="./CSS/com.addtocart.css">
<style>
        .cartIcon{
           display: flex;
           border: 2px solid black;
           width: max-content;
           gap: 3px;
           padding: 2px 15px;
          
        }
		
		#innercontainer{
			min-width: fit-content;
			min-height: fit-content;
			display: flex;
			background-color: white;
			margin-left: 10000px;
		}
       
        #view{
         position:absolute;
		top: 20%;
		left: 10%;
		border-collapse: collapse;
		border-spacing: 4px;
		padding:10px 45px;
		bottom:20%;
        }
		td,th{
			border: 1px solid black;
			padding:10px 25px;
			border-radius:15px;
		}		
       #submit {

		text-align: center;
		text-decoration: none;
		font-size: larger;
		color: black;
		font-weight: 700;
		background-color:yellow;
		border: 1px solid black;
		border-radius:5px;
		padding:10px 15px;
		position: relative;
	

	   }
	   
	   #submit:hover{
		transition: 1s;
		background-color: black;
		color: white;
	   }
	   #successful{
		display: none;
		position: relative;
		bottom: 340px;
		border: 1px solid #3c763d;
		padding: 40px;
		color: #3c763d;
		border-radius: 15px;
		width: 370px;
		float: right;
		right: 100px;
		z-index: 2;
		background-color: white;
		opacity: 1;
	   }
	   #successful>article{
		background-color: white;
		font-size: x-large;
	   }
	  #empty{

		position: absolute;
		top: 150px;
		left: 430px;
		min-width: 550px;
		height: 200px;
		border-radius: 10px;
		background-color: whitesmoke;
		color: black;
		font-family: Arial, Helvetica, sans-serif;
		font-size: xx-large;
		text-align: center;
		
	

	  }
	  #empty >article{
		position: relative;
		background-color: whitesmoke;
			top: 15%;
				line-height: 55px;
	  }
	  #empty span>i{
	  background-color:whitesmoke;
	  }
	  #back{
		padding: 5px;
		font-size: large;
		background-color: thistle;
		color: black;
		position:relative;
		bottom:-20px;
	  }
	 
</style>
 <script src="https://kit.fontawesome.com/90123c5bb7.js" crossorigin="anonymous"></script>

</head>
<body>
	
	<%
		UserDetails user=(UserDetails)request.getSession().getAttribute("user");
		
		MethodClass method=(MethodClass)request.getSession().getAttribute("Method");

	%>
	
		<h2 id="heading">Your Orders</h2>

		
	<%
	
		Connection conn=MethodClass.getConnection();
		
		PreparedStatement  pstmt=conn.prepareStatement("select P.PizzaName,P.size,P.Price,P.Category,P.Image,C.Quantity, C.Quantity*P.Price as product_price,P.Id,U.Id\r\n"
				+ "from addtocart C\r\n"
				+ "join product P on C.prdId=P.Id\r\n"
				+ "join userdetails U on C.userId=U.Id\r\n"
			+ "where U.Id=?");
		
		pstmt.setLong(1,user.getId());
		ResultSet rst=pstmt.executeQuery();
		List<PlacedOrders> list=new ArrayList<>();  %>
		
		
		<%boolean result=rst.next(); %>
		
		<%if(result) { %>
		<div id=" outercontainer">
		
		
		<div class="innercontainer">
		
		
		<table id="view">
		
		<tr>
			
			<th>Image</th>
			<th>Pizza Name</th>
			<th>Size</th>
			<th>Price</th>
			<th>Category</th>
			<th>Quantity</th>
			<th>Pizza price</th>
		</tr>
		
		
			
		<% 
		while(result)
		{ %>
		
		
		<tr>	
		
		
			<%if (rst.getInt(6)>0)
			{ 
			 
				Blob img=rst.getBlob("Image");
				byte[]image=img.getBytes(1,(int)img.length());
			
		
			
			 String base64image=Base64.getEncoder().encodeToString(image); %>
		<td><img id=" image" src="data:image/jpeg;base64,<%=base64image %>" width="150" height="100"></td>
			
			
		<td>	<h3>  <%=rst.getString(1) %> </h3> </td>
		<td>	<p><%=rst.getString(2) %> </p>     </td> 
		<td>	<h3><%=rst.getDouble(3) %></h3>		</td>
		<td>	<p><%=rst.getString(4) %></p>		</td>
		<td>	  <div id="read">
                <div class="cartIcon">
                    <button class="cartbtn"><a href="minusfromCart?id=<%=rst.getLong(8)%>" > <i class="fa-solid fa-minus"></i></a></button> 
                    
                     <span><%=rst.getInt(6) %></span>
                     <button class="cartbtn" > <a href="PlusfromCart?id=<%=rst.getLong(8)%>" ><i class="fa-solid fa-plus"></i></a></button> 
                   
                 </div>
                 
                 </div>
                 </td>
			<td>	<p><%=rst.getInt(7) %></p> 	</td>
		
		</tr>	
		
			
		<%} %>	
			
			<% result=rst.next(); %>
		
		<% 	} %>
		<tr>
		
		<td colspan=6 style="text-align: center; font-size: larger;"><b>Total Price</b></td>
		<%	PreparedStatement  pstmt1=conn.prepareStatement("select  sum(C.Quantity*P.Price) from addtocart C join product P on C.prdId=P.Id join userdetails U on C.userId=U.Id where U.Id=? "); 
		pstmt1.setLong(1, user.getId());
		ResultSet rst1=pstmt1.executeQuery();
		rst1.next();
		%>	
		
		
		<td><b><%= rst1.getDouble(1) %></b></td>
		</tr>
		
	<tr >
		<td colspan=7 style="text-align: right;"><div >
		
			<a href="#" id="submit" onclick="orderDone()">Place Order</a>
			<div id="successful"> 
				<article>Your order is successfully placed!</article>	
			</div>
		</div></td>
		</tr>
		
		</table>
		
			</div>
		
	
		</div>
					
			
		<%}else { %>
	
		<div id="empty">
			<article> Oops! <span><i class="fa-regular fa-face-sad-tear 2x"></i></span>  Your cart is empty</article>	
			<article>Please check the Orders</article>
			<input id="back" type="submit" onclick="history.back()" value="Go Back">
		</div>
		
		<%} %>	
			
			
				
						
			
	
		
					
		<script>
			function orderDone()
			{
				let message=document.getElementById('successful');

				message.style.display='block';

				setTimeout(function()  {
					window.location.href='orderfinish';			
				}, 2000);

			}


		</script>

</body>
</html>