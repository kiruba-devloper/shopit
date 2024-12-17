package Controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.io.PrintWriter;

import DaoModule.ShopitDao;
import Model.User;
import Model.Vendors;


@WebServlet("/VendorLoginRegister")
public class VendorLoginRegister extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
    public VendorLoginRegister() {
        super();
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		PrintWriter pw = response.getWriter();
		String name = request.getParameter("vname");
		String pass = request.getParameter("vpass");
	
		Vendors v = ShopitDao.getVendorDetail(name);
		
		if((name.equals(v.getVname())|| name.equalsIgnoreCase(v.getVemail())) && pass.equals(v.getVpass()) ) {
			HttpSession session = request.getSession();
			session.setAttribute("vname",v.getVname());
			session.setAttribute("vid", v.getVid());
			pw.println("<h3 style=\"background-color:green;\">Login Successful....Welcome back : <span style=\"text-color:red;\">"+name+"</span></h3>");
			
			RequestDispatcher rd = request.getRequestDispatcher("vendorHome.jsp");
			rd.include(request, response);
			
		}else {
			pw.println("<h3 style=\"background-color:red;\">Incorrect Details check Details or register</h3>");
			
			RequestDispatcher rd = request.getRequestDispatcher("vendorLogin.jsp");
			rd.include(request, response);
		}
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		PrintWriter pw = response.getWriter();
	
		String name = request.getParameter("vname");
		String pass = request.getParameter("vpass");
		String cpass = request.getParameter("cpass");
		String email = request.getParameter("vemail");
		String mobile = request.getParameter("vmobile");
		String loc = request.getParameter("vloc");
		
		Vendors v = new Vendors();
		v.setVname(name);
		v.setVpass(cpass);
		v.setVemail(email);
		v.setVmobile(mobile);
		v.setVmobile(loc);
		boolean isavaliable = false;
		Vendors vendor = ShopitDao.getVendorDetail(name);
		String dbvendor = vendor.getVname();
		if(vendor.equals(dbvendor)) {
			isavaliable=true;
		}
		
		if(!(isavaliable)) {
			if(pass.equals(cpass)) {
					int count = ShopitDao.addVendor(v);
					
					if(count>=1) {
						
						pw.println("<h3 style=\"background-color:green;\">Vendor Register Successfull....</h3>");
						
						RequestDispatcher rd = request.getRequestDispatcher("vendorLogin.jsp");
						rd.include(request, response);
					}else {
						pw.println("\"<h3 style=\"background-color:tomato;\">Something went wrong! Try again....</h3>\"");

						request.getRequestDispatcher("vendorRegister.jsp").include(request, response);
					}
			}
			else {
				pw.println("\"<h3 style=\"background-color:tomato;\">Entered Password is not Matched....</h3>\"");

				request.getRequestDispatcher("vendorRegister.jsp").include(request, response);
			}
	}else {
		pw.println("\"<h3 style=\"background-color:tomato;\">Vendor name already Exist....</h3>\"");

		request.getRequestDispatcher("vendorLogin.jsp").include(request, response);
	}

	
	}

}
