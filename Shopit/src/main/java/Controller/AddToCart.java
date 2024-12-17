package Controller;

import java.io.IOException;
import java.io.PrintWriter;

import Model.Item;
import ServiceModule.MyCart;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;


@WebServlet("/AddToCart")
public class AddToCart extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		response.setContentType("text/html");
		PrintWriter pw = response.getWriter();
		if (session.getAttribute("uname") == null) {
			pw.println("<h3 style=\"background-color:red;\">Please Login to Continue...</h3>");
			
			RequestDispatcher rd = request.getRequestDispatcher("userLogin.jsp");
			rd.include(request, response);
		}
		int id = Integer.parseInt(request.getParameter("id"));
		//int id = 100;
		
		String pname = request.getParameter("pname");
		String category = request.getParameter("category");
		Double uprice = Double.parseDouble(request.getParameter("uprice"));
		String uname = request.getParameter("uname");
		Integer qty = Integer.parseInt(request.getParameter("quantity"));
		String dop= (String)session.getAttribute("date");
		
		Double tprice = uprice*qty;
		
		Item item = new Item();
		item.setId(id);
		item.setPname(pname);
		item.setUname(uname);
		item.setCategory(category);
		item.setUprice(uprice);
		item.setTprice(tprice);
		item.setQty(qty);
		item.setDop(dop);
		MyCart m=new MyCart();
		int res=m.addItem(item);
		//System.out.println("result"+res);
		//System.out.println(m.viewList());
		pw.println("<h3 style=\"background-color:green;\">Product Added Sucessfully....</h3>");
		
//		RequestDispatcher rd = request.getRequestDispatcher("viewCart.jsp");
//		rd.forward(request, response);
		
		response.sendRedirect("viewCart.jsp");
		
		
	}

}
