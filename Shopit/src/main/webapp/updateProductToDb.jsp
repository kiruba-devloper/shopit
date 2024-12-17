<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="Model.Products"%>
<%@ page import="DaoModule.ProductsDao"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Update Product To DB</title>
</head>
<body>
	<%
		
		if (session.getAttribute("vname") == null)
			response.sendRedirect("vendorLogin.jsp");
	%>
	<%
				Products p = new Products();
                String prdid = request.getParameter("prdid");
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
               
				
                int resvalue = ProductsDao.updateProduct(p, prdid);

                if (resvalue == 1) {
                    RequestDispatcher requestDispatcher = request.getRequestDispatcher("/vendorHome.jsp");
                    requestDispatcher.forward(request, response);
                    out.println("Product Updated sucessfully");
                }


            %>
</body>
</html>