<%@page import="dataAccessObject.MethodClass"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="./CSS/ForgetPassword.css">
</head>
<body>

	
     <div id="container">
        <br>
        <form method="post" action="forgetpasswordMail">
        		
            <div id="email_division">
                <label for="uNmae">User Name</label>
            <input type="email" name="email" id="mail" placeholder="E-Mail"><br><br>
            <button type="submit" id="e_submit" class="submit" onclick="return sendOTP()">submit</button><br><br>

            </div>
        		
        </form>            
            
      
    </div>

    <script>
    var generatedOTP;
    
        function sendOTP()
        {
          
            let mail=document.getElementById("mail").value;
            
            if(mail!="")
            {
      

                return true;
            
            }
            else{
                alert(`Enter the mail ID`);
                return false;
            }
        }
        function verifyOTP()
        {
            let userOTP=document.getElementById("otp").value;
           
            if(userOTP === generatedOTP)
  			{
  				
  				alert(`Otp verification Done`);
  				return true;
  			}
  			else {
  				
  	         	alert(`Incorrect OTP! OTP mismatch`);
  	         	return false;
  	        }

        }
    </script>
</body>
</html>