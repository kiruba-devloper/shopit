<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="Model.Item"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.text.DecimalFormat"%>
<%@ page import="ServiceModule.MyCart"%>
<jsp:useBean id="ref" class="ServiceModule.MyCart"></jsp:useBean>
<jsp:setProperty property="*" name="ref"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>View Cart</title>
<link rel="stylesheet" type="text/css" href="CSS/style.css" />
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

	<h1 align="center">View Cart</h1>

	<%
String uname = (String)session.getAttribute("uname");
%>

	<div class="vendor_tag">
		<h3>
			Shopy Name: <span style="color: dark-blue"><%=uname %></span>
		</h3>
		
	</div>
	<form action="checkOutCart.jsp" >
	<table align="center" border="5">
		<thead>
			<tr>
				<th><h2>Product Id</h2></th>
				<th><h2>Product Name</h2></th>
				<th><h2>Category</h2></th>
				<th><h2>Quantity</h2></th>
				<th><h2>Unit Price</h2></th>
				<th><h2>Price</h2></th>
				<th><h2>Modify</h2></th>
				<th><h2>Delete</h2></th>
			</tr>
		</thead>
		<tbody>
			<% 
			
			ArrayList<Item> item =ref.viewList1();
			//System.out.println(ref.viewList());
			int count=0;
			DecimalFormat df = new DecimalFormat("0.00");
			double	total = 0.00;
			int tolqty = 0;
			double tax = 0.00;
			double tolamount=0.00;
			for(Item i:item){
				String pname = i.getPname();
				int pid = i.getId();				
				double uprice =i.getUprice();
				double tprice =i.getTprice();
				
				String category =i.getCategory();
				int quantity =i.getQty();
				total +=tprice;	
				tolqty +=quantity;
				//System.out.println(pid);	
				out.println("<tr>");
				out.println("<td>" + pid + "</td>");
				out.println("<td>" + pname + "</td>");
				out.println("<td>" + category + "</td>");
				out.println("<td>" + quantity + "</td>");
				out.println("<td>" + uprice + "</td>");
				out.println("<td>" + tprice + "</td>");
				out.println("<td><a href='editCartProduct.jsp?prdid=" + pid + "'><button type='button'>Edit</button></a></td>");
				out.println("<td><a href='removeCartProduct.jsp?prdid=" + pid + "'><button type='button'>Remove</button></a></td>");
				out.println("</tr>");

				count++;
			}
				if(count!=0){
				out.println("<tr><th colspan='5' align='left'>Subtotal Rs.</th><td colspan='3' style='color:red'>"+df.format(total)+"</td></tr>");
				out.println("<tr><th colspan='5' align='left' >Sales tax @9%</th><td colspan='3' style='color:blue'>"+df.format(total*0.09)+"</td></tr>"); 
				out.println("<tr><th colspan='5' align='left'>Shipping Rs.</th><td colspan='3' style='color:blue'>"+40+"</td></tr>");
				tolamount= total+40+(total*0.09);
				out.println("<tr><th colspan='5' align='left'>Total Amount Rs</th><td colspan='3' style='color:blue'>"+df.format(tolamount)+"</td></tr>");
				out.println("<tr><td colspan='8'><h3><input type='submit' value='Check Out'></input></h3></td></tr>");
				out.println("<h2><a href='emptyCart.jsp'><button type='button' id='btn'><span style='color: red'>Empty Cart</span></button></a></h2>");
				}
				else
				{
					System.out.println("item obj verala");
					out.println("<tr><th colspan='8' align='center'><h2>Nothing in your Cart! Add Something to your Cart....   </h2></th></tr>");
					out.println("<tr><th colspan='8' align='center'><h1 style='color:Violet'>Happy Shopping  </h1></th></tr>");
					
					}
			%>
		</tbody>
	

	</table>
	<input type="hidden" name="amount" value="<%=df.format(total) %>" />
	<input type="hidden" name="tax" value="<%=df.format(total*0.09) %>" />
	<input type="hidden" name="delivery" value="<%=40 %>" />
	<input type="hidden" name="tolamount" value="<%=df.format(tolamount) %>" />
	
	</form>
	<h3 align="center"><a href="Home"><button id='btn'>Buy more Products</button></a></h3>
</body>
</html>