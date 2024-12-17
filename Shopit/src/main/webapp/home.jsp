<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="Model.Item"%>
<%@ page import="Model.Products"%>
<%@ page import="DaoModule.ProductsDao"%>
<%@ page import="DaoModule.ItemDao"%>

<%@ page import="java.util.List"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Shopit Home</title>
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
		<a href="profile.jsp">Profile</a>&nbsp;&nbsp;&nbsp;<a
			href="viewCart.jsp">View Cart</a>&nbsp;&nbsp;&nbsp;<a href="Logout">Logout</a>
	</h3>
	<br>
	<form action="home.jsp">
		<h1 align="center">Home</h1>
		<hr>
		<h4 align='right'>
			<label>By Category:</label> <select name='fillter'>


				<%
				String uname = (String)session.getAttribute("uname");
				//String uname = "kiruba";
				List<Item> item = ItemDao.getItemDetails(uname);
				List<String> category = ProductsDao.getAllCategory();
				for (String s : category) {
					out.println("<option>" + s + "</option>");
				}
				%>

			</select>
			<button type='submit'>Go</button>
		</h4>
	</form>


	<%
	String fillter = request.getParameter("fillter");
	//out.print(fillter);
	int j = 1;
	int count = 1;
	if(fillter==null){
	//out.print(item);
	if (item == null || item.isEmpty()) {
		List<Products> p = ProductsDao.getAllProduct();
		int size = p.size() - 1;
		int start = p.size() - 6;
		out.println("<table align='center' border='1' class='home'>");
		out.println("<tr><th colspan='9'><h2 align='left'>Shopit Recommended Products For you</th></tr>");
		out.println("<tr>");
		for (int i = size; i > start; i--) {

			out.print("<td><h3>" + p.get(i).getName() + "</h3><br><img src=\"" + p.get(i).getImage_url()
			+ "\"\\><br>Description: " + p.get(i).getDescription() + "<br> <h3>Price: Rs.<span style='color:Brown'>"
			+ p.get(i).getPrice() + "</span></h3><br> Category: " + p.get(i).getCategory() + "<br> Vendor Name: "
			+ p.get(i).getVendor_name() + "<br> Avaliable Quantity: " + p.get(i).getStock_quantity()
			+ "<br><br><h2><a href=\"ProductDetails?prdid=" + p.get(i).getProduct_id() + "&prdName="
			+ p.get(i).getName() + "\"><button id='btn'>Buy</button></a></h2></td>");
		}
		out.println("</table>");
		out.println("</tr>");
		out.println("<hr><br>");
		out.println("<table align='center' border='1' class='home'>");
		for (String s : category) {
			List<Products> pr = ProductsDao.getProductCategory(s);
			out.println("<tr><th colspan='9'><h2 align='left'>Popular Shopit " + s + " Products</th></tr>");
			count = 1;

			for (Products pro : pr) {
		if (count == 1) {
			out.println("<tr>");
			//out.println("<br>");
			count++;
		}

		out.print("<td><h3>" + pro.getName() + "</h3><br><img src=\"" + pro.getImage_url()
				+ "\"\\><br>Description: " + pro.getDescription() + "<br> <h3>Price: Rs.<span style='color:Brown'>"
				+ pro.getPrice() + "</span></h3><br> Category: " + pro.getCategory() + "<br> Vendor Name: "
				+ pro.getVendor_name() + "<br> Avaliable Quantity: " + pro.getStock_quantity()
				+ "<br><br><h2><a href=\"ProductDetails?prdid=" + pro.getProduct_id() + "&prdName=" + pro.getName()
				+ "\"><button id='btn'>Buy</button></a></h2></td>");
		count++;
		if (count == 6) {
			out.println("</tr>");

			count = 1;

		}
			}

		}
		out.println("</table>");
	} else if(item!=null && !(item.isEmpty())) {
		//System.out.println(item);
		out.println("<table align='center' border='1' class='home'>");
		out.println("<tr><th colspan='9'><h2 align='left'>Shopit Recommended Products For you</h2></th></tr>");
		String Category = item.getLast().getCategory();
		//System.out.print(Category);
		List<Products> p = ProductsDao.getProductCategory(Category);
		/* int end = 0;
		if (p.size() <= 6) {
			end = p.size();
		} else {
			end = 5;
		} */
		int show = 1;
		out.println("<tr>");
		for (Products product : p) {
			

			out.print("<td><h3>" + product.getName() + "</h3><br><img src=\"" + product.getImage_url()
					+ "\"\\><br>Description: " + product.getDescription() + "<br> <h3>Price: Rs.<span style='color:Brown'>"
					+ product.getPrice() + "</span></h3><br> Category: " + product.getCategory() + "<br> Vendor Name: "
					+ product.getVendor_name() + "<br> Avaliable Quantity: " + product.getStock_quantity()
					+ "<br><br><h2><a href=\"ProductDetails?prdid=" + product.getProduct_id() + "&prdName=" + product.getName()
					+ "\"><button id='btn'>Buy</button></a></h2></td>");
			show++;
			if (show == 5) {
				
				break;
			}

			}
		out.println("</tr>");
		out.println("</table>");

		out.println("<table align='center' border='1' class='home'>");
		for (String s : category) {
			out.println("<tr><th colspan='9'><h2 align='left'>Popular Shopit " + s + " Products</h2></th></tr>");

			List<Products> pr = ProductsDao.getProductCategory(s);

			for (Products pro : pr) {
		if (count == 1) {
			out.println("<tr>");
			count++;
		}

		out.print("<td><h3>" + pro.getName() + "</h3><br><img src=\"" + pro.getImage_url()
				+ "\"\\><br>Description: " + pro.getDescription() + "<br> <h3>Price: Rs.<span style='color:Brown'>"
				+ pro.getPrice() + "</span></h3><br> Category: " + pro.getCategory() + "<br> Vendor Name: "
				+ pro.getVendor_name() + "<br> Avaliable Quantity: " + pro.getStock_quantity()
				+ "<br><br><h2><a href=\"ProductDetails?prdid=" + pro.getProduct_id() + "&prdName=" + pro.getName()
				+ "\"><button id='btn'>Buy</button></a></h2></td>");
		count++;
		if (count == 6) {
			out.println("</tr>");
		
			count = 1;

		}
			}

		}
	}
	}
	else
	if (fillter != null) {
		out.println("<table align='center' border='1' class='home'>");
		out.println("<tr><th colspan='9'><h2 align='left'>Shopit Recommended "+fillter+" Products For you</h2></th></tr>");

		List<Products> p = ProductsDao.getProductCategory(fillter);
		for (Products pro : p) {
			if (count == 1) {
		out.println("<tr>");
		//out.println("<br>");
		count++;
			}
			//System.out.println(pro.getProduct_id());
			out.print("<td><h3>" + pro.getName() + "</h3><br><img src=\"" + pro.getImage_url() + "\"\\><br>Description: "
			+ pro.getDescription() + "<br> <h3>Price: Rs.<span style='color:Brown'>" + pro.getPrice()
			+ "</span></h3><br> Category: " + pro.getCategory() + "<br> Vendor Name: " + pro.getVendor_name()
			+ "<br> Avaliable Quantity: " + pro.getStock_quantity() + "<br><br><h2><a href=\"ProductDetails?prdid="
			+ pro.getProduct_id() + "&prdName=" + pro.getName() + "\"><button id='btn'>Buy</button></a></h2></td>");
			count++;
			if (count == 6) {
		out.println("</tr>");

		count = 1;

			}
		}
		out.println("</table>");
	}
	%>
	${table}

</body>
</html>