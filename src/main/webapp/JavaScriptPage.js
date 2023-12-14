/**
 * 
 */

 function showpassword_Login()
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
        }