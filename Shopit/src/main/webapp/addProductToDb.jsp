<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="Model.Products"%>
<%@ page import="DaoModule.ProductsDao"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Add Product To DB</title>
</head>
<body>
	<%
		
		if (session.getAttribute("vname") == null)
			response.sendRedirect("vendorLogin.jsp");
	%>
	<%
				Products p = new Products();
                String name = request.getParameter("name");
                String description = request.getParameter("description");
                String price = request.getParameter("price");
                String category = request.getParameter("category");
                String stock_quantity = request.getParameter("stock_quantity");
                String image_url = request.getParameter("image_url");
                String vendor_name = request.getParameter("vendor_name");
                String vendor_id = request.getParameter("vendor_id");
				p.setName(name);
				p.setDescription(description);
				p.setPrice(price);
				p.setCategory(category);
				p.setStock_quantity(stock_quantity);
				p.setImage_url(image_url);
				p.setVendor_id(vendor_id);
				p.setVendor_name(vendor_name);
               
				
                int resvalue = ProductsDao.addProduct(p);

                if (resvalue == 1) {
                    RequestDispatcher requestDispatcher = request.getRequestDispatcher("/vendorHome.jsp");
                    requestDispatcher.include(request, response);
                    out.println("<h3 style=\"background-color:green;\">Product Updated sucessfully....</h3>");
                }


            %>
</body>
</html>