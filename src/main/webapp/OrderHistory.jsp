<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.Base64"%>
<%@page import="dataTransferObject.UserDetails"%>
<%@page import="dataTransferObject.PlacedOrders"%>
<%@page import="java.util.List"%>
<%@page import="dataAccessObject.MethodClass"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>PEACENPIZZA</title>
<link rel="stylesheet" href="./CSS/com.addtocart.css">
 <script src="https://kit.fontawesome.com/90123c5bb7.js" crossorigin="anonymous"></script>
 <style>
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
		
		 #empty{
		position: absolute;
		top: 150px;
		left: 350px;
		min-width: 550px;
		height: 200px;
		border-radius: 10px;
		background-color: whitesmoke;
		color: black;
		font-family: Arial, Helvetica, sans-serif;
		font-size: xx-large;
		text-align: center;
		padding:20px;
	

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
</head>
<body>

	<%
		MethodClass method=(MethodClass) request.getSession().getAttribute("Method");
		
		UserDetails user=(UserDetails) request.getSession().getAttribute("user");
		List<PlacedOrders> list=method.orderHistory(1);
	%>
	<h2 id="heading">Your Orders</h2>
	<%if(!(list.isEmpty())){ %>
	
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
		
		<%for(PlacedOrders order:list) {%>
		
		<tr>
			<% String base64image=Base64.getEncoder().encodeToString(order.getImage()); %>
		<td>	<img id=" image" src="data:image/jpeg;base64,<%=base64image %>" width="150" height="100"></td>
		
		<td><%=order.getPizza_Name() %></td>
		<td><%=order.getSize() %></td>
		<td><%=order.getPrice() %></td>
		<td><%=order.getCategory() %></td>
		<td><%=order.getQuantity() %></td>
		<td><%=order.getProduct_price() %></td>
		</tr>
		<%} %>
			<tr>
		
		<td colspan=6 style="text-align: center; font-size: larger;"><b>Total Price</b></td>
		
		<%
			Connection conn=MethodClass.getConnection();
		PreparedStatement  pstmt1=conn.prepareStatement("select  sum(Quantity*product_price) from placedorders where U.Id=? "); 
		pstmt1.setLong(1, user.getId());
		ResultSet rst1=pstmt1.executeQuery();
		rst1.next();
		%>	
		
		
		<td><b><%= rst1.getDouble(1) %></b></td>
		</tr>
		</table>
		</div>
		</div>
	
	<%}else{ %>
	
		<div id="empty">
			<article> Oops! <span><i class="fa-regular fa-face-sad-tear 2x"></i></span>  Your didn't  ordered anything...</article>	
			<article>Please order something and check your histroy later.</article>
			<input id="back" type="submit" onclick="history.back()" value="Go Back">
		</div>
	
	<%} %>
</body>
</html>
