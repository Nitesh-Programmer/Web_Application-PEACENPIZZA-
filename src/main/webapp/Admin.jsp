<%@page import="dataTransferObject.UserDetails"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>PEACENPIZZA</title>
 <link rel="stylesheet" href="./CSS/Admin.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Pacifico&display=swap" rel="stylesheet">

<style type="text/css">

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
#logout:hover{
background-color:#486893;
color:white;
transition:3s;

}

</style>

</head>
<body>

	<% UserDetails user=(UserDetails)request.getSession().getAttribute("admin"); %>
	<div id="header">
    	<nav id="admin">Admin:<%= user.getFirst_name()+" "+ user.getLast_name()%></nav>
    	<nav><a id="logout" href="logout">LogOut</a></nav>
   </div>

   <div id="details">
        <a class="innerdivision" href="AddProduct.jsp">AddProduct</a>
        <a class="innerdivision" href="ListOfProduct.jsp">List of Products</a>
        <a class="innerdivision" href="Admin_UsersInfo.jsp">User's Informations</a>
        <a class="innerdivision" href="#">Total Sales</a>
        <a class="innerdivision" href="#">Additional Informations</a>
        

   </div>


</body>
</html>