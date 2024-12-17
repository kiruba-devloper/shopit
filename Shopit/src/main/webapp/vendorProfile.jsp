<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Vendor Profile</title>
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
		<a href="vendorHome.jsp">Home</a>&nbsp;&nbsp;&nbsp;<a
			href="vendorProfile.jsp">Profile</a>&nbsp;&nbsp;&nbsp;<a
			href="Vlogout">Logout</a>
	</h3>
	<br>

	<h1 align="center">Profile</h1>

	<table align="center" border="1">
		<tr>
			<th><a style="text-decoration: none" href="vendorUpdate.jsp">Update
					Details</a></th>
		</tr>
		<tr>
			<th><a style="text-decoration: none" href="vendorDelete.jsp">Delete
					Account</a></th>
		</tr>

	</table>
</body>
</html>