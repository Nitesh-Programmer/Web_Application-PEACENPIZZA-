<%@page import="dataTransferObject.ContactAdmin"%>
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
		
		List<ContactAdmin> list=method.contactAdmin();
	%>
	
	<div id="header">
        <nav id="admin">Admin</nav>
        <nav ><a id="logout" href="logout">LogOut</a></nav>
       </div>
	
	<%if(!(list.isEmpty())) {%>
	

    <div id="container">
        <fieldset id="set">
          <legend>Feedback List</legend>  
          <table >
           <tr>
			<th> S.no</th>
			<th>User Name</th>
			<th>UserMail Id</th>
			<th>Message</th>
			<th>User's Id</th>
			<th>Reply</th>
			
		</tr>
		
		
		<%  
			for(ContactAdmin contact:list){ 
		%>
		<tr>
			<td><%=contact.getContact_id() %></td>
			<td><%=contact.getUserName() %></td>
			<td><%=contact.getEmail() %></td>
			<td><%=contact.getMessage() %></td>
			<td><%=contact.getContact_userId() %></td>
			<%request.getSession().setAttribute("contact_mail", contact.getEmail()); %>
			<td><a href="Reply.jsp">click to Reply</a></td>
			
		</tr>
		<%} %>
		
		        </table>
    
        </fieldset>
    </div>
	
	<%} else{ %>
			<h2 id="else">Oops! Feedback is empty...  </h2>
	<%} %>
</body>
</html>