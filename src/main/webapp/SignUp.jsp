<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>PEACENPIZZA</title>
<!--  <link rel="stylesheet" href="./CSS/SignUp.css">-->
<style type="text/css">

body
{
    background-image: linear-gradient(to right,rgb(105,245, 230),rgb(255,255, 255));
    
}
#container{

 
    min-height: 350px;
    width: 350px;
    border-radius: 30px;
    padding: 15px;
    top: 90px;
    left: 430px;
    position: absolute;
    background-color: rgb(245, 245, 225);
}

#valueset{
    border-radius: 20px;
    text-align: center;
    line-height: 38px;
    border-spacing: 92px;
   
}
#submit{
    border-radius: 10px;
    display: block;
    margin-left: 125px;
}
#details>input{
    border-radius: 8px;
    line-height: 25px;
  
}
#details>input:hover{
    background-color: thistle;
}
#submit:hover{
    background-color: teal;
    width: 70px;
}
#eye{
    margin-left: -25px;
    margin-top: 3px;
    position: absolute;
}
#eyeslash{
    margin-left: -25px;
    margin-top: 3px;
    position: absolute;
    visibility: hidden;
}
#eye1{
    margin-left: -25px;
    margin-top: 3px;
    position: absolute;
}
#eyeslash1{
    margin-left: -25px;
    margin-top: 3px;
    position: absolute;
    visibility: hidden;
}


</style>

<script src="https://kit.fontawesome.com/90123c5bb7.js" crossorigin="anonymous"></script>
</head>
<body>
	    <div id="container">
        <fieldset id="valueset">
            <legend>SignUp</legend>
            <form action="Signup" id="details" method="post">
                <input type="text" name="firstName" id="firstName" placeholder="Enter First Name" required>
                <input type="text" name="lastName" id="lastName"placeholder="Enter Last Name">
                <input type="email" name="email" id="email" placeholder="Enter E-Mail id" required>
                 <input type="text" name="age" id="age" placeholder="Enter your age" required>
                <input type="tel" name="phno" id="phno" placeholder="Enter Mobile Number" maxlength="10" required>
                <input type="password" name="password" id="pswd" placeholder="Enter Password" required>
                
                <span id="eye" onclick="showPassword()">
                <svg xmlns="http://www.w3.org/2000/svg" height="1em" viewBox="0 0 576 512">svg{fill:#000000}<path d="M288 32c-80.8 0-145.5 36.8-192.6 80.6C48.6 156 17.3 208 2.5 243.7c-3.3 7.9-3.3 16.7 0 24.6C17.3 304 48.6 356 95.4 399.4C142.5 443.2 207.2 480 288 480s145.5-36.8 192.6-80.6c46.8-43.5 78.1-95.4 93-131.1c3.3-7.9 3.3-16.7 0-24.6c-14.9-35.7-46.2-87.7-93-131.1C433.5 68.8 368.8 32 288 32zM144 256a144 144 0 1 1 288 0 144 144 0 1 1 -288 0zm144-64c0 35.3-28.7 64-64 64c-7.1 0-13.9-1.2-20.3-3.3c-5.5-1.8-11.9 1.6-11.7 7.4c.3 6.9 1.3 13.8 3.2 20.7c13.7 51.2 66.4 81.6 117.6 67.9s81.6-66.4 67.9-117.6c-11.1-41.5-47.8-69.4-88.6-71.1c-5.8-.2-9.2 6.1-7.4 11.7c2.1 6.4 3.3 13.2 3.3 20.3z"/></svg> </span>
                <span id="eyeslash" onclick="showPassword()" >
                <svg  xmlns="http://www.w3.org/2000/svg" height="1em" viewBox="0 0 640 512"><path d="M38.8 5.1C28.4-3.1 13.3-1.2 5.1 9.2S-1.2 34.7 9.2 42.9l592 464c10.4 8.2 25.5 6.3 33.7-4.1s6.3-25.5-4.1-33.7L525.6 386.7c39.6-40.6 66.4-86.1 79.9-118.4c3.3-7.9 3.3-16.7 0-24.6c-14.9-35.7-46.2-87.7-93-131.1C465.5 68.8 400.8 32 320 32c-68.2 0-125 26.3-169.3 60.8L38.8 5.1zM223.1 149.5C248.6 126.2 282.7 112 320 112c79.5 0 144 64.5 144 144c0 24.9-6.3 48.3-17.4 68.7L408 294.5c8.4-19.3 10.6-41.4 4.8-63.3c-11.1-41.5-47.8-69.4-88.6-71.1c-5.8-.2-9.2 6.1-7.4 11.7c2.1 6.4 3.3 13.2 3.3 20.3c0 10.2-2.4 19.8-6.6 28.3l-90.3-70.8zM373 389.9c-16.4 6.5-34.3 10.1-53 10.1c-79.5 0-144-64.5-144-144c0-6.9 .5-13.6 1.4-20.2L83.1 161.5C60.3 191.2 44 220.8 34.5 243.7c-3.3 7.9-3.3 16.7 0 24.6c14.9 35.7 46.2 87.7 93 131.1C174.5 443.2 239.2 480 320 480c47.8 0 89.9-12.9 126.2-32.5L373 389.9z"/></svg></span>
                
                <input type="password" name="confrimpassword" id="cfmpswd" placeholder="Enter confirm Password" required>
                <span id="eye1" onclick="showConfirmPassword()">
                <svg  xmlns="http://www.w3.org/2000/svg" height="1em" viewBox="0 0 576 512">svg{fill:#000000}<path d="M288 32c-80.8 0-145.5 36.8-192.6 80.6C48.6 156 17.3 208 2.5 243.7c-3.3 7.9-3.3 16.7 0 24.6C17.3 304 48.6 356 95.4 399.4C142.5 443.2 207.2 480 288 480s145.5-36.8 192.6-80.6c46.8-43.5 78.1-95.4 93-131.1c3.3-7.9 3.3-16.7 0-24.6c-14.9-35.7-46.2-87.7-93-131.1C433.5 68.8 368.8 32 288 32zM144 256a144 144 0 1 1 288 0 144 144 0 1 1 -288 0zm144-64c0 35.3-28.7 64-64 64c-7.1 0-13.9-1.2-20.3-3.3c-5.5-1.8-11.9 1.6-11.7 7.4c.3 6.9 1.3 13.8 3.2 20.7c13.7 51.2 66.4 81.6 117.6 67.9s81.6-66.4 67.9-117.6c-11.1-41.5-47.8-69.4-88.6-71.1c-5.8-.2-9.2 6.1-7.4 11.7c2.1 6.4 3.3 13.2 3.3 20.3z"/></svg> </span>
                <span id="eyeslash1"  onclick="showConfirmPassword()" >
                <svg xmlns="http://www.w3.org/2000/svg" height="1em" viewBox="0 0 640 512"><path d="M38.8 5.1C28.4-3.1 13.3-1.2 5.1 9.2S-1.2 34.7 9.2 42.9l592 464c10.4 8.2 25.5 6.3 33.7-4.1s6.3-25.5-4.1-33.7L525.6 386.7c39.6-40.6 66.4-86.1 79.9-118.4c3.3-7.9 3.3-16.7 0-24.6c-14.9-35.7-46.2-87.7-93-131.1C465.5 68.8 400.8 32 320 32c-68.2 0-125 26.3-169.3 60.8L38.8 5.1zM223.1 149.5C248.6 126.2 282.7 112 320 112c79.5 0 144 64.5 144 144c0 24.9-6.3 48.3-17.4 68.7L408 294.5c8.4-19.3 10.6-41.4 4.8-63.3c-11.1-41.5-47.8-69.4-88.6-71.1c-5.8-.2-9.2 6.1-7.4 11.7c2.1 6.4 3.3 13.2 3.3 20.3c0 10.2-2.4 19.8-6.6 28.3l-90.3-70.8zM373 389.9c-16.4 6.5-34.3 10.1-53 10.1c-79.5 0-144-64.5-144-144c0-6.9 .5-13.6 1.4-20.2L83.1 161.5C60.3 191.2 44 220.8 34.5 243.7c-3.3 7.9-3.3 16.7 0 24.6c14.9 35.7 46.2 87.7 93 131.1C174.5 443.2 239.2 480 320 480c47.8 0 89.9-12.9 126.2-32.5L373 389.9z"/></svg></span>
                
                <input type="submit" name="submit" id="submit" onclick="return passwordCheck()">
                
                <%String error=(String)request.getSession().getAttribute("emailError"); %>
            	<%if(error!=null){ %>
            		<p style="color:red;"><%=error %></p>
            		<%request.getSession().removeAttribute("emailError"); %>
            	<%} %>

            </form>
        </fieldset>
    </div>

    <script src="./JavaScriptPage.js"></script>
    <script> function showpassword_Login()
    {
        let pass=document.getElementById("pswd");
        
        let eye=document.getElementById("eye");
        
        let eyeslash= document.getElementById("eyeslash");

        if(pass.type==="password")
        {
            pass.type="text";
           eye.style.visibility="hidden";
           eyeslash.style.visibility="visible";

        }
        else{
            pass.type="password";
            eye.style.visibility="visible";
           eyeslash.style.visibility="hidden";
        }
    }
    
    
     function showPassword()
    {
        let pass=document.getElementById("pswd");
        
        let eye=document.getElementById("eye");
        
        let eyeslash= document.getElementById("eyeslash");

        if(pass.type == "password")
        {
        	console.log("am pass")
            pass.type ="text";
           eye.style.visibility="hidden";
           eyeslash.style.visibility="visible";

        }
        else{
            pass.type="password";
            eye.style.visibility="visible";
           eyeslash.style.visibility="hidden";
        }
    }
     function showConfirmPassword()
    {
        let pass=document.getElementById("cfmpswd");
        
        let eye=document.getElementById("eye1");
        
        let eyeslash= document.getElementById("eyeslash1");

        if(pass.type==="password")
        {
            pass.type="text";
           eye.style.visibility="hidden";
           eyeslash.style.visibility="visible";

        }
        else{
            pass.type="password";
            eye.style.visibility="visible";
           eyeslash.style.visibility="hidden";
        }
    }
      function passwordCheck()
    {
        let password=document.getElementById("pswd").value;
      
        let  confirm=document.getElementById("cfmpswd").value;
       

        if(password===(confirm))
        {
            return true;
        }
        else{
            alert("password mismatch");
            return false;
        }
        return false;
    }</script>
</body>
</html>