<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <jsp:useBean id="cart" class="ServiceModule.MyCart" scope="session"></jsp:useBean>
     <%@ page import="Model.Item" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit Cart Product </title>
<link rel="stylesheet" type="text/css" href="CSS/style.css" />
</head>
<script>
  const inputField = document.getElementById('qu');
  inputField.addEventListener('input', function() {
    inputField.value = inputField.value.toUpperCase(); // Converts input to uppercase
  });
</script>
<body align="center">
	<%
		
		if (session.getAttribute("uname") == null)
			response.sendRedirect("userLogin.jsp");
	%>
	<h1 align="left">
		Shop<span style="color: white; background-color: red; size: 20px;">it</span>
	</h1>
	<h3 align="center" id="menu">
		<a href="Home">Home</a>&nbsp;&nbsp;&nbsp;<a href="profile.jsp">Profile</a>&nbsp;&nbsp;&nbsp;<a
			href="viewCart.jsp">View Cart</a>&nbsp;&nbsp;&nbsp;<a href="Logout">Logout</a>
	</h3>
	<br>

	<h1 align="center">Edit Cart Product</h1>
	<%

String uname = (String)session.getAttribute("uname");
int prdid = Integer.parseInt(request.getParameter("prdid"));
	Item i = cart.getProduct(prdid);
	//if(vname.equals(p.getName())){
	String pname = i.getPname();
				int pid = i.getId();				
				double uprice =i.getUprice();
				String dop = i.getDop();
				String category =i.getCategory();
				int quantity =i.getQty();
				
			
 %>
<div class="vendor_tag">
		<h3>
			Shopy Name: <span style="color: dark-blue"><%=uname %></span>
		</h3>
	</div>
	<form action="updateCartProduct.jsp" method="post">
		<table align="center">
			
			<tr>
				<td>Product ID</td>
				<td><input type="number" name="id" value=<%=pid %> readonly /></td>
			</tr>
			<tr>
				<td>Product Name</td>
				<td><input type="text" name="pname" value=<%=pname %> readonly /></td>
			</tr>
			<tr>
				<td>Category</td>
				<td><input type="text" name="category"
					value=<%=category %> readonly /></td>
			</tr>
			<tr>
				<td>Quantity</td>
				<td><input type="number" name="qty"
					value=<%=quantity %> min="1" max="50"/></td>
			</tr>
			<tr>
				<td>Unit Price</td>
				<td><input type="text" name="uprice" value=<%=uprice %> readonly /></td>
			</tr>
			<% 
			
			double tprice =uprice*quantity; %>
			<tr>
				<td>Price</td>
				<td><input type="text" name="tprice" value=<%=tprice %> readonly /></td>
			</tr>
			
			
			

			<tr>
				<td colspan="2"><input type="submit" value="Confirm" /></td>
			</tr>
		</table>
		
			<input type="hidden" name="dop" value=<%=dop %> />
	</form>

</body>
</html>