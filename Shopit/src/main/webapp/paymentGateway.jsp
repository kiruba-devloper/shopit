<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="Model.Item"%>

<%@ page import="java.util.ArrayList"%>
<%@ page import="ServiceModule.MyCart"%>
<jsp:useBean id="ref" class="ServiceModule.MyCart"></jsp:useBean>
<jsp:setProperty property="*" name="ref"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>View Cart</title>
<link rel="stylesheet" type="text/css" href="CSS/checkout.css" />
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
		<a href="Home">Home</a>&nbsp;&nbsp;&nbsp;<a href="profile.jsp">Profile</a>&nbsp;&nbsp;&nbsp;<a
			href="viewCart.jsp">View Cart</a>&nbsp;&nbsp;&nbsp;<a href="Logout">Logout</a>
	</h3>
	<br>

	<h1 align="center">Payment Gateway</h1>
	<%
	String uname = (String)session.getAttribute("uname");
	String amount = request.getParameter("amount");
	String tax = request.getParameter("tax");
	String delivery = request.getParameter("delivery");
	String tolamount = request.getParameter("tolamount");
	String payment_method = request.getParameter("payment_method");
	
	if(payment_method.equals("Credit Card")){
		out.println("<h2 align = 'center'>Enter Credit Card Details...</h2>");
		out.println("<table align='center'>");
		out.println("<tr><th>Card Holder Name<th><td><input type='text' name='cname' placeholder='Enter card name' required /></td></tr>");
		out.println("<tr><th>Card Number<th><td><input type='number' name='cno' placeholder='Enter card number' required /></td></tr>");
		out.println("<tr><th>Card Cvv<th><td><input type='number' name='cvv' placeholder='Enter card cvv' required /></td></tr>");
		out.println("<tr><th>Amount to Pay<th><td><input type='number' name='amount' value="+tolamount+" readonly /></td></tr>");
		out.println("<tr><h2><a href='completePurchase.jsp'><button id='btn'>Proceed to Buy</button></h2></tr>");
		out.println("</table>");
		
	}
	
	 if(payment_method.equals("Bank Transfer")){
		out.println("<h2 align = 'center'>Enter Bank Account Details...</h2>");
		out.println("<table align='center'>");
		out.println("<tr><th>Name on Bank Records<th><td><input type='text' name='rname' placeholder='Enter Name on Bank Records' required /></td></tr>");
		out.println("<tr><th>Account Number<th><td><input type='number' name='acno' placeholder='Enter Account number'  required/></td></tr>");
		out.println("<tr><th>IFSC Code<th><td><input type='number' name='ifsc' placeholder='Enter IFSC Code' required /></td></tr>");
		out.println("<tr><th>Bank Name<th><td><input type='number' name='bname' placeholder='Enter Bank Name' required /></td></tr>");
		out.println("<tr><th>Amount to Pay<th><td><input type='number' name='amount' value="+tolamount+" readonly /></td></tr>");
		out.println("<tr><h2><a href='completePurchase.jsp'><button id='btn'>Proceed to Buy</button></h2></tr>");
		out.println("</table>");
		int result = ref.checkOut();
		if (result == 1) {
			//out.println("<h3 style=\"background-color:green;\">Purchase Successful....</h3>");
            RequestDispatcher requestDispatcher = request.getRequestDispatcher("/Home");
            requestDispatcher.include(request, response);
            
        }
	}
	if(payment_method.equals("Paypal")){
		out.println("<h2 align = 'center'>Enter Paypal Account Details...</h2>");
		out.println("<table align='center'>");
		out.println("<tr><th>Enter Paypal Name<th><td><input type='text' name='cname' placeholder='Enter card name' required /></td></tr>");
		out.println("<tr><th>Enter Paypal Email<th><td><input type='number' name='cno' placeholder='Enter card number' required /></td></tr>");
		out.println("<tr><th>Amount to Pay<th><td><input type='number' name='amount' value="+tolamount+" readonly /></td></tr>");
		out.println("<tr><h2><a href='completePurchase.jsp'><button id='btn'>Proceed to Buy</button></h2></tr>");
		out.println("</table>");
		int result = ref.checkOut();
		if (result == 1) {
			//out.println("<h3 style=\"background-color:green;\">Purchase Successful....</h3>");
            RequestDispatcher requestDispatcher = request.getRequestDispatcher("/Home");
            requestDispatcher.include(request, response);
            
        }
	}
	if(payment_method.equals("Cash on Delivery")){
		out.println("<h2 align = 'center'>Cash on Delivery</h2>");
		out.println("<table align='center'>");
		
		out.println("<tr><th colspan='2' align='center'>Payment will Colleted During Products Delivery....!</th></tr>");
		out.println("<tr><th>Amount to Pay<th><td><input type='number' name='amount' value="+tolamount+" readonly /></td></tr>");
		out.println("<tr><h2><a href='completePurchase.jsp'><button id='btn'>Proceed to Buy</button></h2></tr>");
		out.println("</table>");
		int result = ref.checkOut();
		if (result == 1) {
			//out.println("<h3 style=\"background-color:green;\">Purchase Successful....</h3>");
            RequestDispatcher requestDispatcher = request.getRequestDispatcher("/Home");
            requestDispatcher.include(request, response);
            
        }
	}
	
%>
</body>
</html>