<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="DaoModule.ProductsDao"%>
<%@ page import="Model.Products"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Remove Product</title>
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
			href="Logout">Logout</a>
	</h3>
	<br>

	<h1 align="center">Remove Product</h1>
	<%
String vid = (String)session.getAttribute("vid");
String vname = (String)session.getAttribute("vname");
String prdid = request.getParameter("prdid");
	Products p =ProductsDao.getProductDetail(prdid);
	//if(vname.equals(p.getName())){
	String name = p.getName();
	String description =p.getDescription();
	String price =p.getPrice();
	String category =p.getCategory();
	String stock_quantity =p.getStock_quantity();
	String image_url =p.getImage_url();
	String vendor_id =p.getVendor_id();
	String vendor_name =p.getVendor_name();
	
 %>

	<form action="removeProductFromDb.jsp" method="post">
		<table align="center">
			<tr>
				<td colspan="2" align="center"><img src="<%=image_url %>"></td>

			</tr>
			<tr>
				<td>Product Name</td>
				<td><input type="text" name="name" value=<%=name %> readonly /></td>
			</tr>
			<tr>
				<td>Description</td>
				<td><input type="text" name="description"
					value=<%=description %> readonly /></td>
			</tr>
			<tr>
				<td>Price</td>
				<td><input type="text" name="price" value=<%=price %> readonly /></td>
			</tr>
			<tr>
				<td>Category</td>
				<td><input type="text" name="category" value=<%=category %>
					readonly /></td>
			</tr>
			<tr>
				<td>Stock Quantity</td>
				<td><input type="text" name="stock_quantity"
					value=<%=stock_quantity %> readonly /></td>
			</tr>
			<tr>
				<td>Image url</td>
				<td><input type="text" name="image_url" value=<%=image_url %>
					readonly /></td>
			</tr>

			<tr>
				<td colspan="2"><input type="submit" value="Confirm Remove" /></td>
			</tr>
		</table>
		<input type="hidden" name="vendor_id" value=<%=vid %> /> <input
			type="hidden" name="vendor_name" value=<%=vname %> /> <input
			type="hidden" name="prdid" value=<%=prdid %> />
	</form>

</body>
</html>