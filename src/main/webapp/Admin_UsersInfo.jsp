<%@page import="dataTransferObject.UserDetails"%>
<%@page import="java.util.List"%>
<%@page import="dataAccessObject.MethodClass"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>PEACENPIZZA</title>
	
	<style>
		
		body{
			margin:0%;
			padding:0%;
			background-color:#486893;
		}
		
		   #view{
         position:absolute;
		top: 20%;
		left: 15%;
		border-collapse: collapse;
		border-spacing: 4px;
		padding:10px 55px;
		bottom:20%;
		background-color:white;
		
        }
		td,th{
			border: 1px solid black;
			padding:10px 25px;
			border-radius:15px;
		}	
		
		
		h2{
			font-size:60px;
			color:white;
			
		}
	
	
	</style>


</head>
<body>

	<%	
		MethodClass method=new MethodClass();
			
		List<UserDetails> list=method.userInfo();
	%>
	<h2 id="heading">User's Informations</h2>
	<div id=" outercontainer">
		
		
		<div class="innercontainer">
		
		
		<table id="view">
		
		<tr>
			
			<th>ID</th>
			<th>First Name</th>
			<th>Last Name</th>
			<th>E-mail ID</th>
			<th> Contact</th>
			<th>Age</th>
			<th>Order History</th>
		</tr>
		
		<% for(UserDetails user:list){ %>
		
			<tr>
			<td><%=user.getId() %></td>
			<td><%=user.getFirst_name() %></td>
			<td><%=user.getLast_name() %></td>
			<td><%=user.getEmail() %></td>
			<td><%=user.getPhno() %></td>
			<td><%=user.getAge() %></td>
			<td><a href="previous?id=<%=user.getId()%>&name=<%=user.getFirst_name()%>">previous orders</a></td>
			</tr>
		<%} %>
		
		</table>
		
		</div>
	</div>
		
</body>
</html>