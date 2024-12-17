<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Vendor Login</title>
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
padding: 40px;
border-radius:10px;
}
table input{
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
padding:1px;
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
	<h3 align="center" id="menu">
		<a href="userLogin.jsp">Shopy Login</a>
	</h3>
	<br>
	<h1 align="center">
		Shop<span style="color: white; background-color: red; size: 20px;">it</span>
	</h1>
	<h1 align="center">Vendor Login</h1>

	<form action="VendorLoginRegister" method="get">
		<table align="center">
			<tr>
				<th><h3>Vendor Name / Email</h3></th>
				<td><input type="text"
					placeholder="Enter Vendor name or email id" name="vname"></td>
			</tr>
			<tr>
				<th><h3>Vendor Password</h3></th>
				<td><input type="password" placeholder="Enter password"
					name="vpass"></td>
			</tr>

			<tr>
				<th colspan="2"><input type="submit" value="Login" id="btn"></input>
				</th>
			</tr>
			<tr>
				<th colspan="2" align="center"><br>
				<br>Register for New Account click <a id="btn"
					href="vendorRegister.jsp" style="color: black">Register</a></th>
			</tr>
		</table>
	</form>
</body>
</html>