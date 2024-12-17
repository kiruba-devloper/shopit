<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <jsp:useBean id="ref" class="ServiceModule.MyCart"></jsp:useBean>
<jsp:setProperty property="*" name="ref"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Thank's for shopping</title>

<link rel="stylesheet" type="text/css" href="CSS/style.css" />
</head>
<body>
	<%
		
		//if (session.getAttribute("uname") == null)
			//response.sendRedirect("userLogin.jsp");
	%>
	<%
				//int result = ref.checkOut();
				//if (result == 1) {
					out.println("<h3 style=\"background-color:green;\">Purchase Successful....</h3>");
			        
			        
			    

            %>
            
            <h1 align="left">
		Shop<span style="color: white; background-color: red; size: 20px;">it</span>
	</h1>
	<h3 align="center" id="menu">
		<a href="Home">Home</a>&nbsp;&nbsp;&nbsp;<a href="profile.jsp">Profile</a>&nbsp;&nbsp;&nbsp;<a
			href="viewCart.jsp">View Cart</a>&nbsp;&nbsp;&nbsp;<a href="Logout">Logout</a>
	</h3>
	<br>

	<h1 align="center" style="color:green;">Thank's For Shopping</h1>
	<div class='thx_img' >
	       <img   src="IMG/thanking_purchase.png" />
	</div>
	<h3 align="center"><a href="Home"><button id='btn'>Buy Products</button></a></h3>
	<%
	//}
	%>
</body>
</html>