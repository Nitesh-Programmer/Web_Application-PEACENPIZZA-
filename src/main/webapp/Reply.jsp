<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>PeaceNPizza</title>
    <style>
        * {
            margin: 0%;
            padding: 0%;

        }
        body{
            background-color: thistle;
        }
        #header>nav {
            display: inline;
            color: aliceblue;
            font-size: large;
        }

        #header {

            padding: 10px;
            border-radius: 15px;
            border: 2px solid black;
            background-color: #0A346E;
            margin-top: 20px;
        }

        #logout {
            margin-right: 20px;
            float: right;
            text-decoration: none;
            color: white;
        }
    	#logout:hover{
            background-color: white;
            color: #0A346E;
            border: 1px solid white;
            border-radius: 5px;
            padding: 2px;
            font-size: larger;
        }
        #message{
            border: 1px solid black;
            padding: 40px;
            width: fit-content;
            position: relative;
            left: 40%;
            top: 50px;
            border-radius: 15px;
            line-height: 35px;
            background-color: #f7f7f7;
        }
        .input{
            border-top: none;
            border-left: none;
            border-right: none;
            border-bottom: 0.5px solid gray;
            padding:5px;
        }

        #toaddress{
            display: flex;
            gap: 20px;
            height: 20px;
        }
    </style>
</head>
<body>
		<%
			String toMail=(String)request.getSession().getAttribute("contact_mail");
		%>
		
	
    <div id="header">
        <nav id="admin">Admin</nav>
        <nav><a id="logout" href="logout">LogOut</a></nav>
    </div>

    <div id="message">
        <form action="replytoUser" method="post">
            <div id="from">
                <label for="email">From</label><input type="email" readonly value="peacenpizza30@gmail.com" class="input">
            </div>
            <div id="toaddress">
                <p>To</p>
                <input type="email" readonly value="<%=toMail %>" name="toMail" class="input">
                <p>Cc Bcc </p>
            </div>
            <div id="subject">
                <label for="subject" >Subject</label><input type="text" name="subject" class="input">
            </div>
            <div id="reply_message">
                <textarea name="reply_message" id="" cols="40" rows="10" placeholder="Enter Your message" class="input"></textarea>
            </div>
            <div id="bottom">
                <button type="submit">send</button>
                <input type="file" name="file" id="" >
            </div>
        </form>
    </div>
</body>
</html>