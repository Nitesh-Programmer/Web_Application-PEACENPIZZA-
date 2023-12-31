<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
 <link rel="stylesheet" href="./CSS/AddProduct.css">
 
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
 </style>
 
</head>
<body>

	<div id="header">
        <nav id="admin">Admin</nav>
        <nav ><a id="logout" href="logout">LogOut</a></nav>
    </div>

    <div id="outercontainer">
       <fieldset id="set">
        <legend >Add Product</legend>
		<form action="AddProduct" method="post" enctype="multipart/form-data">
			        <div>
            <label class="label">Pizza Name</label>
            <input type="text" name="pizza" class="input" required>
        </div>
        <div>
            
            <label class="label">Description: </label>
            <textarea name="Description" id="des" cols="41" rows="2" ></textarea>
        </div>
        <div>
            <label class="label">Size</label>
            <input type="text" name="size" id="size" class="input">
        </div>
        <div>
            <label class="label">Price</label>
            <input type="text" name="price" class="input">
        </div>
        <div>
            <label class="label">Category: </label>
            <input type="text" name="cat" class="input"></input>
        </div>
        <div>
        	
            <label class="label">Choose Image</label>
            <input type="file" name="image" class="input">
        </div>
        <input type="submit" name="submit" id="submit">
		</form>
       </fieldset>
        
    </div>
</body>
</html>