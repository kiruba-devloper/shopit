<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Vendor Home</title>
<link rel="stylesheet" type="text/css" href="CSS/style.css" />
</head>
<body align="center">
	<%
		
		if (session.getAttribute("vname") == null)
			response.sendRedirect("vendorLogin.jsp");
	%>
	<h1 align="left">
		Shop<span style="color: white; background-color: red; size: 20px;">it</span>
	</h1>
	<h3 align="center" id="menu">
		<a href="vendorProfile.jsp">Profile</a>&nbsp;&nbsp;&nbsp;<a
			href="Vlogout">Logout</a>
	</h3>
	<br>

	<h1 align="center">Vendor Home</h1>
	<table align="center" border="1">
		<tr>
			<th><h3>
					<a style="text-decoration: none" href="addProduct.jsp">Add
						Products</a>
				</h3></th>
		</tr>
		<tr>
			<th><h3>
					<a style="text-decoration: none" href="viewProduct.jsp">View
						Products</a>
				</h3></th>
		</tr>


	</table>
</body>
</html>