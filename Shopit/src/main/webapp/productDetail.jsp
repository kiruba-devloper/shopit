<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Shopit Home</title>
<link rel="stylesheet" type="text/css" href="CSS/style.css" />
<!-- <style type="text/css">
body {
   background-color: rgba(0, 100, 200, 0.3);
  align="centre";
  padding:0px;
margin:0px;
}
img{
height:250px;
width:250px;
}
#menu{
background: #004170;
  color: darkblue;
  padding:10px;
margin:0px
}
#menu a{
	text-decoration:none;
  color: white;
  padding:0px;
}
table{
background-color: aquamarine;
padding: 5px;
border-radius:10px;
}
table td{
margin-top: 10px;
background-color:lightgray;
border-radius:10px;
padding:10px;
width:100px;
height:150px;
}
table button{
margin-top: 10px;
background-color:blue;
border-radius:5px;
padding:5px;
}
table th{
margin-top: 10px;
background-color:#6F00FF;
border-radius:10px;
padding:10px;
}
#btn {
background-color:tomato;
border-radius:10px;
padding:8px;
width:150px;
}
</style> -->

</head>
<body align="center">
<%
		
		if (session.getAttribute("uname") == null)
			response.sendRedirect("userLogin.jsp");
			
	%>

	<h1 align="left">
		Shop<span style="color: white; background-color: red; size: 20px;">it</span>
	</h1>
	<h3 align="center" id="menu">
		<a href="home.jsp">Home</a>&nbsp;&nbsp;&nbsp;<a href="profile.jsp">Profile</a>&nbsp;&nbsp;&nbsp;<a
			href="viewCart.jsp">View Cart</a>&nbsp;&nbsp;&nbsp;<a href="Logout">Logout</a>
	</h3>
	<br>


	<h1 align="center">${productId}${productName}</h1>
	<form action="AddToCart" method="get">
		<input type="hidden" name="id" value="${productId}" /> <input
			type="hidden" name="pname" value="${productName}" /> <input
			type="hidden" name="uprice" value="${price}" /> 
			<input type="hidden" name="uname" value="${uname}" />
			<input type="hidden" name="category" value="${category}" />

		<table align="center" border="1" id="productdetails">
			<tr>
				<td colspan="2" align="center"><img src="${productimage}"></td>
			</tr>
			<tr>
				<th colspan="2">${productName}</th>
			</tr>
			<tr>
				<th colspan="2">Description:</th>
			</tr>
			<tr>
				<td colspan="2">${description}</td>
			</tr>
			<tr>
				<th>Category</th>
				<td>${category}</td>
			</tr>
			<tr>
				<th>Vendor Id</th>
				<td>${vendorId}</td>
			</tr>
			<tr>
				<th>Vendor Name</th>
				<td>${vendorName}</td>
			</tr>
			<tr>
				<th>Stock Quantity</th>
				<td>${stockQuantity}</td>
			</tr>
			<tr>
				<th>Price</th>
				<td><h3 style="color: blue; font-size: 30px">Rs. ${price}</h3></td>
			</tr>
			<tr>
				<th>Qty <input style="width: 50px" type="number"
					name="quantity" value='1' min="1" max="50" /></th>
				<td><input type="submit" value="Add to Cart" /></td>
			</tr>
			<tr>
			
				
				<!-- <th><a href="ViewCart"><button>Proceed Check out</button></a></th> -->
		</table>
	</form>