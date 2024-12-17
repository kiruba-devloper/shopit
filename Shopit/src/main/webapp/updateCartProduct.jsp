<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="Model.Item"%>
    <jsp:useBean id="cart" class="ServiceModule.MyCart" scope="session"></jsp:useBean>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Update Cart Product</title>
</head>
<body>
	<%
		
		if (session.getAttribute("uname") == null)
			response.sendRedirect("userLogin.jsp");
	%>
	<%
				Item i = new Item();
                int prdid = Integer.parseInt(request.getParameter("id"));
				i.setCategory(request.getParameter("category"));
              	i.setDop(request.getParameter("dop"));
				i.setId(prdid);
				i.setPname(request.getParameter("pname"));
				i.setQty(Integer.parseInt(request.getParameter("qty")));
				System.out.println(request.getParameter("qty"));
				i.setTprice(Double.parseDouble(request.getParameter("tprice")));
				i.setUname((String)(session.getAttribute("uname")));
				i.setUprice(Double.parseDouble(request.getParameter("uprice")));
				
                int resvalue = cart.updateItem(i);

                if (resvalue == 1) {
                	 out.println("<h3 style=\"background-color:green;\">Item Update Successfully....</h3>");
                    RequestDispatcher requestDispatcher = request.getRequestDispatcher("/viewCart.jsp");
                    requestDispatcher.include(request, response);
                   
                }


            %>
</body>
</html>