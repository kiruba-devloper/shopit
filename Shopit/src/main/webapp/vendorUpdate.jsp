<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Update Vendor Details</title>
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
width:400px;
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
#r{
margin: 0px;
padding:0px;
width:30px;

}
</style> -->
<script type="text/javascript">
function vendorname(){
	let btn = document.getElementById("change");
	btn.setAttribute("placeholder","Enter new Vendor name");
	btn.setAttribute("type","text");
}
function vendorpass(){
	let btn = document.getElementById("change");
	btn.setAttribute("placeholder","Enter new Password");
	btn.setAttribute("type","text");
}
function vendoremail(){
	let btn = document.getElementById("change");
	btn.setAttribute("placeholder","Enter new Email");
	btn.setAttribute("type","text");
}
function vendorlocation(){
	let btn = document.getElementById("change");
	btn.setAttribute("placeholder","Enter new Location");
	btn.setAttribute("type","text");
}
function vendormobile(){
	let btn = document.getElementById("change");
	btn.setAttribute("placeholder","Enter new Mobile Number");	
	btn.setAttribute("type","number");	
	btn.setAttribute("minlength","10");	
	btn.setAttribute("size","10");	
}
</script>
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

	<h1 align="center">Update Vendor Details</h1>

	<form action="VendorUpdateDelete">
		<table align="center">
			<tr>
				<th><h3>Vendor Name*</h3></th>
				<td colspan="3"><input type="text" name="uname"
					placeholder="Enter user name" required></td>
			</tr>
			<tr>
				<td><input type="radio" value="Update Vendor Name" name="upt"
					id="r" onclick="vendorname()">Vendor Name</td>
				<td><input type="radio" value="Update Vendor Password"
					name="upt" id="r" onclick="vendorpass()">Vendor Password</td>
				<td><input type="radio" value="Update Mobile Number" name="upt"
					id="r" onclick="vendormobile()">Mobile Number</td>
				<td><input type="radio" value="Update Vendor Email" name="upt"
					id="r" onclick="vendoremail()">Email</td>
				<td><input type="radio" value="Update Vendor location"
					name="upt" id="r" onclick="vendorlocation()">Vendor
					location</td>

			</tr>
			<tr>
				<td colspan="4"><input type="text" name="update"
					placeholder="Enter value" id="change" required></input></td>
			</tr>

			<tr>
				<th colspan="4"><input type="submit" value="Update" id="btn"></input>
				</th>
			</tr>
		</table>

	</form>

</body>
</html>