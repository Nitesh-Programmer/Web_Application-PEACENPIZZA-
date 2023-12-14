<%@page import="com.mysql.cj.protocol.x.SyncFlushDeflaterOutputStream"%>
<%@page import="java.sql.SQLException"%>
<%@page import="dataAccessObject.MethodClass"%>
<%@page import="dataTransferObject.UserDetails"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>PEACENPIZZA</title>
<style>
* {
	margin: 0%;
	padding: 0%;
}

body {
	background-color: #496D89;
}

#container {
	border: 1px solid black;
	background-color: #b3cadb;
	min-height: 200px;
	width: 350px;
	position: absolute;
	top: 50px;
	left: 35%;
	border-radius: 20px;
}

.input_tag {
	background-color: white;
	display: block;
	text-align: center;
	position: relative;
	top: 20px;
	left: 70px;
	line-height: 20px;
	width: 180px;
}

#submit-btn {
	margin-top: 40px;
	left: 120px;
	width: 80px;
	font-size: larger;
	padding: 5px;
	border-radius: 5px;
}
</style>



</head>

<body>

	<%
	UserDetails user = (UserDetails) request.getSession().getAttribute("user");

	MethodClass method = new MethodClass();
	String otp = null;
	%>
	<%
	try {
		otp = method.send(user.getEmail());
		

	} catch (Exception e) {
		e.printStackTrace();
	}
	%>

	


	<div id="container">
		
	<form action="userInsert" method="post">
		
	<article>
	<br>
			<h3>Verify Your E-Mail </h3>
	
			<input type="text" id="userOTP" class="input_tag"
				placeholder="Enter OTP">
		</article>
		<input id="submit-btn" onclick="return checkOTP()" type="submit" class="input_tag" name="submit">
	
	</form>	
		
		
	

	</div>


	<script>
  		function checkOTP()
  	
  		{
  			let userOTP=document.getElementById("userOTP").value;
  			let generatedOTP=String(<%=otp%>); 
  			console.log(userOTP);
  			console.log(generatedOTP);
  			if(userOTP === generatedOTP)
  			{
  				console.log(userOTP === generatedOTP)
  				
  				alert(`Otp verification Done`);
  				return true;
  			}
  			else {
  				
  	         	alert(`Incorrect OTP! OTP mismatch`);
  	         	return false;
  	        }
  			return false;
  		}
  	
  	</script>

</body>
</html>
