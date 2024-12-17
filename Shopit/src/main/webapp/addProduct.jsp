<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Add New Product</title>
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

	<h1 align="center">Add New Product</h1>

	<form action="addProductToDb.jsp" method="post">
		<table align="center">
			<tr>
				<td>Product Name</td>
				<td><input type="text" name="name" value="" required /></td>
			</tr>
			<tr>
				<td>Description</td>
				<td><input type="text" name="description" value="" required /></td>
			</tr>
			<tr>
				<td>Price</td>
				<td><input type="text" name="price" value="" required /></td>
			</tr>
			<tr>
				<td>Category</td>
				<td><input type="text" name="category" value="" required /></td>
			</tr>
			<tr>
				<td>Stock Quantity</td>
				<td><input type="text" name="stock_quantity" value="" required /></td>
			</tr>
			<tr>
				<td>Price</td>
				<td><input type="text" name="price" value="" required /></td>
			</tr>
			<tr>
				<td>Image url</td>
				<td><input type="text" name="image_url" value="" required /></td>
			</tr>

			<tr>
				<td colspan="2" align="center"><input type="submit"
					value="Add Product" /></td>
			</tr>
		</table>
		<%
			 String vid = (String)session.getAttribute("vid");
			 String vname = (String)session.getAttribute("vname");
			%>
		<input type="hidden" name="vendor_id" value=<%=vid %> /> <input
			type="hidden" name="vendor_name" value=<%=vname %> />
	</form>

</body>
</html>