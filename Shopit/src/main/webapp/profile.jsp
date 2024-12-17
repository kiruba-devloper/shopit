<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>My Profile</title>
<link rel="stylesheet" type="text/css" href="CSS/style.css" />
<!-- <style type="text/css">
body {
   background-color: rgba(0, 100, 200, 0.3);
  align="centre";
  padding:0px;
margin:0px;
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
width:250px;
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
		<a href="home.jsp">Home</a>&nbsp;&nbsp;&nbsp;<a
			href="viewCart.jsp">View Cart</a>&nbsp;&nbsp;&nbsp;<a href="Logout">Logout</a>
	</h3>
	<br>

	<h1 align="center">Profile</h1>

	<table align="center" border="1">
		<tr>
			<th><a href="userUpdate.jsp">Update Details</a></th>
		</tr>
		<tr>
			<th><a href="myorders.jsp">My Orders</a></th>
		</tr>
		<tr>
			<th><a href="userDelete.jsp">Delete Account</a></th>
		</tr>

	</table>
</body>
</html>