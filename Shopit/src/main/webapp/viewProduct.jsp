<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="Model.Products"%>
<%@ page import="DaoModule.ProductsDao"%>
<%@ page import="java.util.List"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>View Products</title>
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

	<h1 align="center">View Products</h1>

	<%String vid = (String)session.getAttribute("vid");
String vname = (String)session.getAttribute("vname");%>

	<div class="vendor_tag">
		<h3>
			Vendor Id: <span style="color: brown"><%=vid %></span>
		</h3>
		<h3>
			Vendor Name: <span style="color: dark-blue"><%=vname %></span>
		</h3>
	</div>
	<table align="center" border="5">
		<thead>
			<tr>
				<th><h2>Product Id</h2></th>
				<th><h2>Product Image</h2></th>
				<th><h2>Name</h2></th>
				<th><h2>Description</h2></th>
				<th><h2>category</h2></th>
				<th><h2>stock_quantity</h2></th>
				<th><h2>Price</h2></th>
				<th><h2>Modify</h2></th>
				<th><h2>Delete</h2></th>
			</tr>
		</thead>
		<tbody>
			<% 
			List<Products> li =ProductsDao.getProductByVendor(vid);
			for(Products p:li){
				String pname = p.getName();
				String pid = p.getProduct_id();
				String description =p.getDescription();
				String price =p.getPrice();
				String category =p.getCategory();
				String stock_quantity =p.getStock_quantity();
				String image_url =p.getImage_url();
				String vendor_id =p.getVendor_id();
				String vendor_name =p.getVendor_name();
				%>
			<tr>
				<td><%= pid%></td>
				<td><img src="<%=image_url %>"></td>
				<td><%=pname %></td>
				<td><%=description %></td>
				<td><%=category %></td>
				<td><%=stock_quantity %></td>
				<td><%=price %></td>
				<td><a href="updateProduct.jsp?prdid=<%= pid%>">Edit</a></td>
				<td><a href="removeProduct.jsp?prdid=<%= pid%>">remove</a></td>
			</tr>
			<%
				}
				%>
		</tbody>


	</table>
</body>
</html>