<%@page import="dataTransferObject.Feedback"%>
<%@page import="java.util.List"%>
<%@page import="dataAccessObject.MethodClass"%>
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

#else{
	color:#486893;
	text-align:center;
	margin-top:50px;
	margin-left:150px;
}


</style>

</head>
<body>

	<%
		MethodClass method= (MethodClass)request.getSession().getAttribute("Method"); 
		
		List<Feedback> list=method.listofFeedBack();
	%>
	
	<div id="header">
        <nav id="admin">Admin</nav>
        <nav ><a id="logout" href="logout">LogOut</a></nav>
       </div>

    <% if(!(list.isEmpty())) {%>
    
    <div id="container">
        <fieldset id="set">
          <legend>Feedback List</legend>  
          <table >
           <tr>
			<th>Feedback Id</th>
			<th>User Name</th>
			<th>UserMail Id</th>
			<th>Feedback</th>
			<th>User's Id</th>
			
		</tr>
		
		
		<%  
			for(Feedback feedback:list){ 
		%>
		<tr>
			<td><%=feedback.getFeedBack_Id() %></td>
			<td><%=feedback.getUserName() %></td>
			<td><%=feedback.getUserMail() %></td>
			<td><%=feedback.getFeedback() %></td>
			<td><%=feedback.getFeed_id() %></td>
			
		</tr>
		<%} %>
		
		        </table>
    
        </fieldset>
    </div>
    <%} else{%>
    		
    		<h2 id="else">Oops! Feedback is empty...  </h2>
    <%} %>
    
    
    
	
	
	

</body>
</html>