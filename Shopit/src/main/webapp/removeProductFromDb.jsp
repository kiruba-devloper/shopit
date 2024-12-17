<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="Model.Products"%>
<%@ page import="DaoModule.ProductsDao"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Remove Product From DB</title>
</head>
<body>
	<%
		
		if (session.getAttribute("vname") == null)
			response.sendRedirect("vendorLogin.jsp");
	%>
	<%
				
                String prdid = request.getParameter("prdid");

               
				
                int resvalue = ProductsDao.deleteProduct(prdid);

                if (resvalue == 1) {
                    RequestDispatcher requestDispatcher = request.getRequestDispatcher("/vendorHome.jsp");
                    requestDispatcher.forward(request, response);
                    out.println("Product Removed sucessfully");
                }


            %>
</body>
</html>