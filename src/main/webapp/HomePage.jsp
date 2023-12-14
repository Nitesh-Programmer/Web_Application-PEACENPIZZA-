<%@page import="dataTransferObject.UserDetails"%>
<%@page import="java.util.Base64"%>
<%@page import="dataTransferObject.Products"%>
<%@page import="java.util.List"%>
<%@page import="dataAccessObject.MethodClass"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>PEACENPIZZA</title>

  <link rel="stylesheet" href="./CSS/HomePage.css"> 	
	<style>

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

        /* #anchore_profile:focus~#profile{
            display: block;
        } */
        
        #image>img{
        	opacity:0.7;
        }
        #image>article{
        	position:absolute;
        	top:200px;
        	text-align:center;
        	font-size:64px;
        	color:white;
        	opacity:1;
        	font-family:sans-serif; 
        }
        #inner_container:hover{
	transform: scale(1);
}
      
       
    </style>

    <script src="https://kit.fontawesome.com/90123c5bb7.js" crossorigin="anonymous"></script>
    
    
</head>
<body >

		<%
		MethodClass method=(MethodClass) request.getSession().getAttribute("Method");
		
		UserDetails user=(UserDetails)request.getSession().getAttribute("user");
		
		%>
		
		<!-- The below code will work for showing the navigation bar or heading   -->
     <div id="container" >
      
        <div id="leftside">
           <article class="details"><a href="#">Home</a></article>
           <article class="details"><a href="AboutUs.jsp">About Us</a></article>
           <article class="details"><a href="#product_container">Menu</a></article>
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
    
    
    <!-- This is just show an image -->
    <div id="image" onclick="hidden_profile()">
        <img src="./BGImage.jpg" alt="">
        <article>Welcome to<br>PEACENPIZZA </article>
       
    </div>
    
    <!-- This will redirect the page to Add to Cart page -->
    <div id="cart">
        <span id="cart_Icon"><a href="com.addtocart.jsp"><i class="fa-solid fa-cart-shopping fa-3x"></i></a></span>
    </div>
    
    
    <!-- This contain's all the products details. Here I used List(java.util) which will store list of 
    objects(products type).-->
    
    
    <div id="product_container"   onclick="hidden_profile()">
         <%List<Products>list=(List)method.findAll(); %>
        <%for(Products product:list) {%> 
          <div id="item1" class="innercontainer"  onclick="hidden_profile()">
          
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
                    <button class="cartbtn"><a href="minusCart?id=<%=product.getId() %>" > <i class="fa-solid fa-minus"></i></a></button> 
                    
                     <span>Add to cart</span>
                     <button class="cartbtn" > <a href="PlusCart?id=<%=product.getId() %>" ><i class="fa-solid fa-plus"></i></a></button> 
                   
                 </div>
               </div>
  
          </div>
           <%} %> 
        
      </div>
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