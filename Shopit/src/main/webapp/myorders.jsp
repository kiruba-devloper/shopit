<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="Model.Item"%>
<%@ page import="DaoModule.ItemDao"%>
<%@ page import="java.text.DecimalFormat"%>
<%@ page import="java.util.List"%>
<%@ page import="ServiceModule.MyCart"%>
<jsp:useBean id="ref" class="ServiceModule.MyCart"></jsp:useBean>
<jsp:setProperty property="*" name="ref"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>My Orders</title>
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

	<h1 align="center">My Orders</h1>

	<%
String uname = (String)session.getAttribute("uname");
%>

	<div class="vendor_tag">
		<h3>
			Shopy Name: <span style="color: dark-blue"><%=uname %></span>
		</h3>
			</div>
	<
	<table align="center" border="5">
		<thead>
			<tr>
				<th><h2>Purchase Date</h2></th>
				<th><h2>Product Id</h2></th>
				<th><h2>Product Name</h2></th>
				<th><h2>Category</h2></th>
				<th><h2>Quantity</h2></th>
				<th><h2>Unit Price</h2></th>
				<th><h2>Price</h2></th>
				
			</tr>
		</thead>
		<tbody>
			<% 
			
			List<Item> item =ItemDao.getItemDetails(uname);
			//System.out.println(ref.viewList());
			
		if (item==null){
			System.out.println("item obj verala");%>
			<tr>
				<th colspan="8" align="center"><h2>Your Purchase Order is Empty....! </h2></th>
				<th colspan="8" align="center"><h1 style="color:Violet">Buy Purchase Some Products to view your Orders  </h1></th>
			</tr>
			<tr>
				<th colspan="8" align="center"><h2>
						<a href="Home"><button>Buy Product</button></a>
					</h2></th>
			</tr>
			<%}
		DecimalFormat df = new DecimalFormat("0.00");
				double	total = 0.00;
		
			for(Item i:item){
				String pname = i.getPname();
				String dop = i.getDop();
				int pid = i.getId();				
				double uprice =i.getUprice();
				double tprice =i.getTprice();
				String category =i.getCategory();
				int quantity =i.getQty();
				tprice = quantity*uprice;
				total +=tprice;	
				
				//System.out.println(pid);	
				out.println("<tr>");
				out.println("<td>"+dop+"</td>");
				out.println("<td>"+pid+"</td>");
				out.println("<td>"+pname+"</td>");
				out.println("<td>"+category+"</td>");
				out.println("<td>"+quantity+"</td>");
				out.println("<td>"+uprice+"</td>");
				out.println("<td>"+tprice+"</td>");
				
				out.println("</tr>");
				
			}
				if(item!=null){ %>
				
			
			<tr>	<td colspan="6" ><h3 align="left">Total Amount of Purchase is Rs.</h3></td><td colspan="1"><h3 style="color:blue"><%=df.format(total) %></h3></td></tr>
			
			<!-- <tr> <td colspan="8"><h2><button type="submit">Check Out</button></h2></td></tr> -->
			<%
			}
			%>
			
		</tbody>
	

	</table>

</body>
</html>