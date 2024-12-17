<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <jsp:useBean id="cart" class="ServiceModule.MyCart" scope="session"></jsp:useBean>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Remove Product From Cart</title>
</head>
<body>
	<%
		
		if (session.getAttribute("uname") == null)
			response.sendRedirect("userLogin.jsp");
	%>
	<%
				
                int prdid = Integer.parseInt(request.getParameter("prdid"));

               
				
                int resvalue = cart.remove(prdid);

                if (resvalue == 1) {
                	 out.println("<h3 style=\"background-color:green;\">Item Removed Successfully....</h3>");
                    RequestDispatcher requestDispatcher = request.getRequestDispatcher("/viewCart.jsp");
                    requestDispatcher.include(request, response);
                   
                }


            %>
</body>
</html>