<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="Model.Item"%>
<%@ page import="Model.User"%>
<%@ page import="DaoModule.ShopitDao"%>

<%@ page import="java.util.ArrayList"%>
<%@ page import="ServiceModule.MyCart"%>
<jsp:useBean id="ref" class="ServiceModule.MyCart"></jsp:useBean>
<jsp:setProperty property="*" name="ref"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Checkout</title>
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

	<h1 align="center">Billing Checkout</h1>

	<%
	String uname = (String)session.getAttribute("uname");
	String amount = request.getParameter("amount");
	String tax = request.getParameter("tax");
	String delivery = request.getParameter("delivery");
	String tolamount = request.getParameter("tolamount");
	User u= ShopitDao.getUserDetail(uname);
	String email = u.getUemail();
	String mobile = u.getUmobile();
%>

    
 <form action="paymentGateway.jsp" method="POST">
   
    <div class="form-section">
        <h2>Billing Information</h2>
       
            
            <div class="form-group">
                <div class="half-width">
                    <label for="first-name">Name</label>
                    <input type="text" id="first-name" name="uname"  value = "<%= uname %>" readonly>
                </div>
                
            </div>

            <label for="email">Email Address</label>
            <input type="email" id="email" name="email" value="<%=email %>" readonly>

            <label for="phone">Phone Number</label>
            <input type="tel" id="phone" name="phone" value="<%=mobile %>" readonly>
            <input type="hidden" name="tax" value="<%=tax %>" />
            <input type="hidden" name="delivery" value="<%=delivery %>" />
            <input type="hidden" name="tolamount" value="<%=tolamount %>" />

           <!--  <label for="address">Billing Address</label>
            <textarea id="address" name="address" rows="4" readonly></textarea>

            <div class="form-group">
                <div class="half-width">
                    <label for="city">City</label>
                    <input type="text" id="city" name="city" readonly>
                </div> -->
                
       <!--  </form> -->
    

    <!-- Order Summary Section -->
    <div class="order-summary">
        <h2>Order Summary</h2>
        <table>
            <thead>
                <tr>
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
               		ref.viewList(out);
               		%>
               		<tr>
                    <td colspan="5" style="text-align: right;"><strong>Subtotal Rs.</strong></td>
                    <td><h3 style="color:blue"><%=amount %></h3></td>
                </tr>
                <tr>
                    <td colspan="5" style="text-align: right;"><strong>Sale Tax Rs.</strong></td>
                    <td><h3 style="color:brown"><%=tax %></h3></td>
                </tr>
                <tr>
                    <td colspan="5" style="text-align: right;"><strong>Shipping Rs.</strong></td>
                    <td><h3 style="color:brown"><%=delivery %></h3></td>
                </tr>
                <tr>
                    <td colspan="5" style="text-align: right;"><strong>Total Rs.</strong></td>
                    <td><h3 style="color:green"><%=tolamount %></h3></td>
                </tr>
            </tbody>
        </table>
    </div>

    <!-- Payment Method Section -->
    <div class="payment-method">
        <h2>Payment Method</h2>
        <div>
            <input type="radio" id="credit-card" name="payment_method" value="Credit Card" required>
            <label for="credit-card">Credit Card</label>
        </div>
        <div>
            <input type="radio" id="paypal" name="payment_method" value="Paypal">
            <label for="paypal">PayPal</label>
        </div>
        <div>
            <input type="radio" id="bank-transfer" name="payment_method" value="Bank Transfer">
            <label for="bank-transfer">Bank Transfer</label>
        </div>
        <div>
            <input type="radio" id="cash-on-Delivery" name="payment_method" value="Cash on Delivery">
            <label for="bank-transfer">Cash on Delivery</label>
        </div>
    </div>
	
    <!-- Checkout Button -->
    <button type="submit" class="checkout-btn">Complete Checkout</button>
</div>
</form>

</body>
</html>
