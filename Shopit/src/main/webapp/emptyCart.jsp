<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <jsp:useBean id="cart" class="ServiceModule.MyCart" scope="session"></jsp:useBean>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Empty Cart</title>
</head>
<body>
	<%
		
		if (session.getAttribute("uname") == null)
			response.sendRedirect("userLogin.jsp");
	%>
	<%
				//for emptying cart
				
                int resvalue = cart.empty();

                if (resvalue == 1) {
                	 
                    RequestDispatcher requestDispatcher = request.getRequestDispatcher("/viewCart.jsp");
                    requestDispatcher.include(request, response);
                    out.println("<h2 style=\"color:green;\">Emptying Cart Successful....</h2>");
                }


            %>
</body>
</html>