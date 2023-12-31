<%@page import="java.util.Base64"%>
<%@page import="dataTransferObject.Products"%>
<%@page import="java.util.List"%>
<%@page import="dataAccessObject.MethodClass"%>
<%@page import="dataTransferObject.UserDetails"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>PeaceNPizza</title>
<link rel="stylesheet" href="./CSS/ListOfProduct.css">
<style>

	#logout
{
    margin-right: 30px;
    float: right;
    border: 2px solid black;
    padding:0px 35px;
    color: black;
    text-decoration: none;
    background-color:white;
    border-radius:3px;
	width:70px;
	text-align:center;    
}
</style>
</head>
<body>

	<%UserDetails admin=(UserDetails)request.getSession().getAttribute("admin"); %>
	<%MethodClass method=(MethodClass)request.getSession().getAttribute("Method"); %>
	 <div id="header">
        <nav id="admin">Admin</nav>
        <nav ><a id="logout" href="logout">LogOut</a></nav>
       </div>

    <div id="container">
        <fieldset id="set">
          <legend>List Of Product</legend>  
          <table >
           <tr>
			<th>Id</th>
			<th>Pizza Name</th>
			<th>Description</th>
			<th>Size</th>
			<th>Price</th>
			<th>Category</th>
			<th>Image</th>
			<th>Edit</th>
			<th>Delete</th>
		</tr>
		
		<% List<Products>list=(List)method.findAll();%>
		<%  
			for(Products product:list){ 
		%>
		<tr>
			<td><%=product.getId() %></td>
			<td><%=product.getPizzaName() %></td>
			<td><%=product.getDescription() %></td>
			<td><%=product.getSize() %></td>
			<td><%=product.getPrice() %></td>
			<td><%=product.getCategory() %></td>
			<%String base64image=Base64.getEncoder().encodeToString(product.getImage()); %>
			<td><img src="data:image/jpeg;base64,<%=base64image %>" width="150" height="100"></td>
			<td><a href="edit?id=<%=product.getId() %>" >Edit</a></td>
			<td><a href="delete?id=<%=product.getId() %>">Delete</a></td>
		</tr>
		<%} %>
		
		        </table>
    
        </fieldset>
    </div>
</body>
</html>