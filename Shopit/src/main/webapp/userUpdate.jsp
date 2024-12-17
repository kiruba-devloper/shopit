<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Update User Details</title>
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
function username(){
	let btn = document.getElementById("change");
	btn.setAttribute("placeholder","Enter new username");
	btn.setAttribute("type","text");
}
function userpass(){
	let btn = document.getElementById("change");
	btn.setAttribute("placeholder","Enter new Password");
	btn.setAttribute("type","text");
}
function useremail(){
	let btn = document.getElementById("change");
	btn.setAttribute("placeholder","Enter new Email");
	btn.setAttribute("type","text");
}
function usermobile(){
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
		
		if (session.getAttribute("uname") == null)
			response.sendRedirect("userLogin.jsp");
			
	%>
	<h1 align="left">
		Shop<span style="color: white; background-color: red; size: 20px;">it</span>
	</h1>
	<h3 align="center" id="menu">
		<a href="index.jsp">Home</a>&nbsp;&nbsp;&nbsp;<a href="AdminCheck">Setting</a>&nbsp;&nbsp;&nbsp;<a
			href="Logout">Logout</a>
	</h3>
	<br>

	<h1 align="center">Update User Details</h1>

	<form action="UpdateUser">
		<table align="center">
			<tr>
				<th><h3>User Name*</h3></th>
				<td colspan="3"><input type="text" name="uname"
					placeholder="Enter user name" required></td>
			</tr>
			<tr>
				<td><input type="radio" value="Update User Name" name="upt"
					id="r" onclick="username()">Update User Name</td>
				<td><input type="radio" value="Update User Password" name="upt"
					id="r" onclick="userpass()">Update User Password</td>
				<td><input type="radio" value="Update Mobile Number" name="upt"
					id="r" onclick="usermobile()">Update Mobile Number</td>
				<td><input type="radio" value="Update Mobile Number" name="upt"
					id="r" onclick="useremail()">Update User Email</td>

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