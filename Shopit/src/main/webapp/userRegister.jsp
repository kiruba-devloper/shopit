<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>User Register</title>
<link rel="stylesheet" type="text/css" href="CSS/style.css" />

</head>
<body align="center">
	<h3 align="center" id="menu">
		<a href="vendorLogin.jsp">Vendor Login</a>
	</h3>
	<br>
	<h1 align="center">
		Shop<span style="color: white; background-color: red; size: 20px;">it</span>
	</h1>
	<h1 align="center">Shopy Register</h1>

	<form action="LoginRegister" method="post">
		<table align="center">
			<tr>
				<th><h3>User Name*</h3></th>
				<td><input type="text" placeholder="Enter user name"
					name="uname" required></td>
			</tr>
			<tr>
				<th><h3>User Password*</h3></th>
				<td><input type="password" placeholder="Enter user password"
					name="upass" required></td>
			</tr>
			<tr>
				<th><h3>Confirm User Password*</h3></th>
				<td><input type="password" placeholder="confirm user password"
					name="cpass" required></td>
			</tr>
			<tr>
				<th><h3>Email Id*</h3></th>
				<td><input type="email" placeholder="Enter email id"
					name="uemail" required></td>
			</tr>
			<tr>
				<th><h3>Mobile No.</h3></th>
				<td><input type="number" placeholder="Enter mobile number"
					name="umobile"></td>
			</tr>
			<tr>
				<th colspan="2"><input type="submit" value="Register" id="btn"></input>
				</th>
			</tr>
			<tr>
				<th><br>
				<br>Already have a account Login <a href="userLogin.jsp">here..!</a></th>
			</tr>
		</table>

	</form>

</body>
</html>