<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>User Register</title>
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
}`
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
		<a href="userlogin.jsp">Shopy Login</a>
	</h3>
	<br>
	<h1 align="center">
		Shop<span style="color: white; background-color: red; size: 20px;">it</span>
	</h1>
	<h1 align="center">Vendor Register</h1>

	<form action="VendorLoginRegister" method="post">
		<table align="center">
			<tr>
				<th><h3>Vendor Name*</h3></th>
				<td><input type="text" placeholder="Enter Vendor name"
					name="vname" required></td>
			</tr>
			<tr>
				<th><h3>Vendor Password*</h3></th>
				<td><input type="password" placeholder="Enter Vendor password"
					name="vpass" required></td>
			</tr>
			<tr>
				<th><h3>Confirm Vendor Password*</h3></th>
				<td><input type="password"
					placeholder="confirm Vendor password" name="cpass" required>
				</td>
			</tr>
			<tr>
				<th><h3>Email Id*</h3></th>
				<td><input type="email" placeholder="Enter email id"
					name="vemail" required></td>
			</tr>
			<tr>
				<th><h3>Mobile No*</h3></th>
				<td><input type="number" placeholder="Enter mobile number"
					name="vmobile" required></td>
			</tr>
			<tr>
				<th><h3>Vendor Location</h3></th>
				<td><input type="number" placeholder="Enter Vendor Location"
					name="vmobile"></td>
			</tr>
			<tr>
				<th colspan="2"><input type="submit" value="Register" id="btn"></input>
				</th>
			</tr>
			<tr>
				<th><br>
				<br>Already have a account Login <a href="vendorLogin.jsp">here..!</a></th>
			</tr>
		</table>

	</form>

</body>
</html>