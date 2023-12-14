<%@page import="dataTransferObject.UserDetails"%>
<%@page import="java.util.Base64"%>
<%@page import="dataAccessObject.MethodClass"%>
<%@page import="dataTransferObject.Products"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>

	<style>
	
		#no_element{
		position: absolute;
		top: 150px;
		left: 450px;
		width: 450px;
		height: 250px;
		border-radius: 10px;
		background-color: whitesmoke;
		color: black;
		font-family: Arial, Helvetica, sans-serif;
		font-size: xx-large;
		text-align: center;
		
	

	  }
	  #no_element >article{
		position: relative;
		background-color: whitesmoke;
			top: 15%;
				line-height: 55px;
	  }
	 #no_element span>i{
	  background-color:whitesmoke;
	  }
	  #back{
		padding: 5px;
		font-size: large;
		background-color: thistle;
		color: black;
		position:relative;
		bottom:-20px;
		width:150px;
	  }
	  #back:hover{
	  background-color:#486893;
	  color:white;
	  transition:2s;
	  
	  }
		        .cartIcon{
           display: flex;
           border: 2px solid black;
           width: max-content;
           gap: 3px;
           padding: 10px;
        }
      *{
    margin: 0%;
    width: 100%;
    padding: 0%;
}

#container{
    border: 1px solid black;
    display: flex;
    /* background-color: #6528f3; */
    background-color: #caa9ff;
    position: fixed;
    z-index: 2;
}
#leftside{
    height: 80px;
    display: flex;
   	width: 60%;
   	justify-content: space-between;
   	align-items: center;
}
.details{
    border: 1px ;
    padding-right: 12px;
    padding-left: 11px;
   font-size: large;
}

.details>a{
    color: white;
    text-decoration: none;
}
.details>a:hover{
	transition: 3s;
    background-color: #486893;
    border-radius: 5px;
    color: white;
    padding-left: 15px;
    padding-right: 15px;
    
}
#rightside{

    width: 40%;
    display: flex;
    align-items: center;
    justify-content: space-around;
}


#search{
    height: 20px;
    width: 180px;
    border-radius: 12px;
}
#search_Icon{
  
  position: relative;
  left: -80px;
  top: 2.5px;

  
}
#search:hover{
    background-color: tan;
    font-weight: 550;
}

#cart_Icon{
   border: 1px solid black;
   width: fit-content;
   display: inline-block;
   right: 0%;
   padding: 20px;
   position: fixed;
   border-radius: 50%;
   background-color: antiquewhite;
   bottom: 30px;
   right: 20px;
   z-index: 2;
}


#product_container {
	position:relative;
	top:100px;
    display: grid;
    grid-template-columns: repeat(3, minmax(300px, 1fr));
    gap: 15px;
    justify-content: space-evenly;
    left: 5px;
   
}
.product_image{
    width:400px;
    height: 150px;
    background-position: center;
   
}
.innercontainer{
    width: 410px;
	min-height:150px ;
    background-color: white;
    border-radius: 5px;
    border: 1px solid black;
    padding: 10px;
    line-height: 20px;
 
}

.innercontainer>h4, .innercontainer>p, .innercontainer>span
{
    padding:0px 20px;
}
.innercontainer p{
    color: gray;
}


.cartIcon{
    display: flex;
    border: 1px solid black;
    gap: 3px;
    padding: 5px;
    width: fit-content;
    margin-bottom: 10px;
    margin-top: 5px;
    justify-content: center; 
    border-radius: 10px;
 }
 #read{
    display: flex;
    justify-content: center;
 }

 
 .cartbtn{
    width: max-content;
    height: fit-content;
    
 }

 .price{
    display: flex;
    width: 15px;
    margin-left: 10px;
    padding: 10px;
 }

#profile{
            display: none;
            min-height: min-content;
            width: 450px;
            border: 1px solid black;
            background-color: whitesmoke;
            animation-name: showProfile;
            animation: infinite;
            position: absolute;
            top: 100px;
            left: 700px;
            border-radius:10px;
            padding:20px;
        }
        @keyframes showprofile {
            from{
                transform: translateX(250px);
            }
            to{
                transform: translateX(-200px);
            }
        }
	
	
	</style>


 <script src="https://kit.fontawesome.com/90123c5bb7.js" crossorigin="anonymous"></script>
</head>
<body>

		<%
		
		List<Products>list=(List<Products>)request.getAttribute("search_bar");
		UserDetails user=(UserDetails)request.getSession().getAttribute("user");
		
		%>
				
				
		
	<% 	MethodClass method=(MethodClass) request.getSession().getAttribute("Method");
		
		%>
		
		<!-- The below code will work for showing the navigation bar or heading   -->
          <div id="container">
      
        <div id="leftside">
           <article class="details"><a href="HomePage.jsp">Home</a></article>
           <article class="details"><a href="AboutUs.jsp">About Us</a></article>
           <article class="details"><a href="HomePage.jsp?#product_container">Menu</a></article>
           <article class="details"><a href="#">Contact_Us</a></article>
           <article class="details"><a href="#">FeedBack</a></article>
        </div>
 		 <div id="rightside">
            <input type="text" name="search_value" id="search"> <span id="search_Icon"><a  id="searchLink" href="search_product">
            <svg xmlns="http://www.w3.org/2000/svg" height="1em" viewBox="0 0 512 512"><path d="M416 208c0 45.9-14.9 88.3-40 122.7L502.6 457.4c12.5 12.5 12.5 32.8 0 45.3s-32.8 12.5-45.3 0L330.7 376c-34.4 25.2-76.8 40-122.7 40C93.1 416 0 322.9 0 208S93.1 0 208 0S416 93.1 416 208zM208 352a144 144 0 1 0 0-288 144 144 0 1 0 0 288z"/></svg></a></span>
            <article class="details">
            <a id="anchore_profile" href="#" onclick="display_userDetails()">Profile </a>
            
            <div id="profile">
                
                <h2>User Details: </h2>
               <span>   <h3><%=user.getFirst_name() %><%=user.getLast_name() %></h3></span>
                 
                <label><b>E-Mail: </b></label> <p><%=user.getEmail() %></p>
                <label><b>Mobile Number: </b></label><p><%=user.getPhno() %></p>
                <label><b>Age: </b></label><p><%=user.getAge() %></p>
                
               <h2>Order History: click the below link</h2>
               
               <a href="OrderHistory.jsp">Your Order History</a>
               
                
            </div>

            </article>
            <article class="details"><a href="logout">LogOut</a></article>
        </div>
    </div>			
	 <div id="cart">
        <span id="cart_Icon"><a href="com.addtocart.jsp"><i class="fa-solid fa-cart-shopping fa-3x"></i></a></span>
    </div>

		<% if(!list.isEmpty()){%>
						
		<div id="product_container"  onclick="hidden_profile()">
         
        <%for(Products product:list) {%> 
          <div id="item1" class="innercontainer">
          
               <%String base64image=Base64.getEncoder().encodeToString(product.getImage()); %> 
               <img src="data:image/jpeg;base64,<%=base64image %>" width="150" height="100" class="product_image"><br><br>
               <h4><%=product.getPizzaName() %></h4> 
              
             
               <p><%=product.getCategory() %></p><span><%= product.getSize() %></span><br> 
          
          <!-- Below code will show the price of the product with the rupees symbol -->
          		
          		
          		<div class="price">
                	<h2><i class="fa-solid fa-indian-rupee-sign"></i></h2>
                	<h2><%=product.getPrice() %></h2>
                </div>
              <P id="descrip"><%=product.getDescription() %></P>
       
             <!-- Read ->id refer a division and inside the division it has two <a> tags one is used to  increase 
             and another is used to decrease the product counts in the database as well has in the add to cart page  -->  
               
               <div id="read">
                <div class="cartIcon">
                    <button class="cartbtn"><a href="minusitem?id=<%=product.getId() %>" > <i class="fa-solid fa-minus"></i></a></button> 
                    
                     <span>Add to cart</span>
                     <button class="cartbtn" > <a href="Plusitem?id=<%=product.getId() %>" ><i class="fa-solid fa-plus"></i></a></button> 
                   
                 </div>
               </div>
  
          </div>
           <%} %> 
        
      </div>
						

		<%} else{%>
				
				<div id="no_element">
						
					<article> Oops! <span><i class="fa-regular fa-face-sad-tear 2x"></i></span> No such product found</article>	
					<input id="back" type="submit" onclick="history.back()" value="Go Back">
		
				</div>
				
				
		<%} %>
		
		
		  <script>
        document.getElementById('searchLink').addEventListener('click', function() {
            var searchValue = document.getElementById('search').value;
            var searchLink = 'search_product?search_value=' + encodeURIComponent(searchValue);
            this.setAttribute('href', searchLink);
        });
        
        function display_userDetails()
        {
        	let profile_div=document.getElementById("profile");
        	
        	profile_div.style.display="block";
        }
        
        function hidden_profile()
        {
            
            let user_div=document.getElementById("profile");

            user_div.style.display="none";

        }
        
    </script>
		
</body>
</html>