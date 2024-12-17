<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Shopit Home</title>
<link rel="stylesheet" type="text/css" href="CSS/style.css" />

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
		<a href="profile.jsp">Profile</a>&nbsp;&nbsp;&nbsp;<a
			href="viewCart.jsp">View Cart</a>&nbsp;&nbsp;&nbsp;<a href="Logout">Logout</a>
	</h3>
	<br>

	<h1 align="center">Home</h1>
	
	

	<table align="center" border="1" class="home">
	${table}
	</table>
</body>
</html>