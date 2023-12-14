<%@page import="dataAccessObject.MethodClass"%>
<%@page import="dataTransferObject.Products"%>
<%@page import="java.util.Base64"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<%
	Products product=(Products)request.getSession().getAttribute("product");
	%>
	
	<div id="header">
        <nav id="admin">Admin</nav>
        <nav id="logout">LogOut</nav>
    </div>

    <div id="outercontainer">
       <fieldset id="set">
        <legend >Update Product</legend>
		<form action="UpdateProduct" method="post" enctype="multipart/form-data">
		<div>
			<label class="label">Id</label>
			<input type="text" name="Id" class="input" value="<%=product.getId() %>" readonly>
		</div>	
		<div>
            <label class="label">Pizza Name</label>
            <input type="text" name="pizza" class="input" value="<%=product.getPizzaName() %>" required>
        </div>
        <div>
            
            <label class="label">Description: </label>
            <input type="text" name="Description" class="input" value="<%=product.getDescription() %>">
        </div>
        <div>
            <label class="label">Size</label>
            <input type="text" name="size" id="size" class="input" value="<%=product.getSize() %>">
        </div>
        <div>
            <label class="label">Price</label>
            <input type="text" name="price" class="input" value=<%=product.getPrice() %>>
        </div>
        <div>
            <label class="label">Category: </label>
            <input type="text" name="cat" class="input" value=<%=product.getCategory() %>></input>
        </div>
        <div>
        <%String base64image=Base64.getEncoder().encodeToString(product.getImage()); %>
        <img src="data:image/jpeg;base64,<%=base64image %>" width="150" height="100">
            <label class="label">Choose Image</label>
            <input type="file" name="image"  class="input">
        </div>
        <input type="submit" name="submit" id="submit">
		</form>
       </fieldset>
        
    </div>
	

</body>
</html>