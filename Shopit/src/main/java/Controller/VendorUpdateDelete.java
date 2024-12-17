package Controller;

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


@WebServlet("/VendorUpdateDelete")
public class VendorUpdateDelete extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		PrintWriter pw = response.getWriter();
		HttpSession session=request.getSession(false);  

        if(session!=null){  
        String sname=(String)session.getAttribute("vname");
        request.setAttribute("mem",sname);
        String name = request.getParameter("vname");
		String pass = request.getParameter("vpass"); 
        Vendors v = ShopitDao.getVendorDetail(name);
        String dbname = v.getVname();
        String dbpass = v.getVpass();
          if(name.equals(dbname) && pass.equals(dbpass)) {
        	  int count = ShopitDao.deleteVendor(name);
			
			
			if(count>=1) {
				request.getSession().invalidate();
				pw.println("<h3 style=\"background-color:green;\">Vendor Delete Successful....</h3>");
				
				request.getRequestDispatcher("vendorLogin.jsp").include(request, response);
				
				
			}
			else {
				pw.println("\"<h3 style=\"background-color:tomato;\">Deletion not sucessfull...! Try again....</h3>\""); 
	            request.getRequestDispatcher("vendorDelete.jsp").include(request, response); 
			}
          }else {
        	  pw.println("\"<h3 style=\"background-color:tomato;\">Please check your password...! Try again....</h3>\""); 
	            request.getRequestDispatcher("vendorDelete.jsp").include(request, response);
          }
        }  
        else{  
        	pw.println("\"<h3 style=\"background-color:tomato;\">Please Login to Continue....</h3>\""); 
            request.getRequestDispatcher(" vendorLogin.jsp").include(request, response);  
        } 
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		PrintWriter pw = response.getWriter();
		HttpSession session=request.getSession(false); 
		if(session!=null){  
	        String sname=(String)session.getAttribute("vname"); 
	        request.setAttribute("mem",sname);
	        String pass= request.getParameter("cpass");
			String upt = request.getParameter("upt");
			Vendors v = new Vendors();
			v.setVname(sname);
			Vendors vendor = ShopitDao.getVendorDetail(sname);
		        String dbname = vendor.getVname();
		        String dbpass = vendor.getVpass();
		          if(sname.equals(dbname) && pass.equals(dbpass)) {
		        	  
		        	  if(upt.equalsIgnoreCase("Update Vendor Name")) {
		        		  String vname = request.getParameter("update");
		        		  v.setVname(vname);
		        		  int count = ShopitDao.updateVname(v,dbname);
							if(count>=1) {
								pw.println("<h3 style=\"background-color:green;\">Vendor Name Update Successful....</h3>");
								request.getRequestDispatcher("vendorHome.jsp").include(request, response);
							}
							else {
								pw.println("\"<h3 style=\"background-color:tomato;\">Something went wrong! Try again....</h3>\"");
								request.getRequestDispatcher("vendorUpdate.jsp").include(request, response);
							}
		        	  }
		        	  else if(upt.equalsIgnoreCase("Update Vendor Password")) {
		        		  String vpass = request.getParameter("update");
		        		  v.setVpass(vpass);
		        		  int count = ShopitDao.updateVpass(v);
		        		  if(count>=1) {
		        			  pw.println("<h3 style=\"background-color:green;\">Vendor Password Update Successful....</h3>");
		        			  request.getRequestDispatcher("vendorHome.jsp").include(request, response);
		        		  }
		        		  else {
		        			  pw.println("\"<h3 style=\"background-color:tomato;\">Something went wrong! Try again....</h3>\"");
		        			  request.getRequestDispatcher("vendorUpdate.jsp").include(request, response);
		        		  }
		        	  }
		        	  else if(upt.equalsIgnoreCase("Update Mobile Number")) {
		        		  String vmobile = request.getParameter("update");
		        		  v.setVpass(vmobile);
		        		  int count = ShopitDao.updateVpass(v);
		        		  if(count>=1) {
		        			  pw.println("<h3 style=\"background-color:green;\">Vendor Mobile Number Update Successful....</h3>");
		        			  request.getRequestDispatcher("vendorHome.jsp").include(request, response);
		        		  }
		        		  else {
		        			  pw.println("\"<h3 style=\"background-color:tomato;\">Something went wrong! Try again....</h3>\"");
		        			  request.getRequestDispatcher("vendorUpdate.jsp").include(request, response);
		        		  }
		        	  }
		        	  else if(upt.equalsIgnoreCase("Update Vendor Email")) {
		        		  String vemail = request.getParameter("update");
		        		  v.setVpass(vemail);
		        		  int count = ShopitDao.updateVpass(v);
		        		  if(count>=1) {
		        			  pw.println("<h3 style=\"background-color:green;\">Vendor Email Update Successful....</h3>");
		        			  request.getRequestDispatcher("vendorHome.jsp").include(request, response);
		        		  }
		        		  else {
		        			  pw.println("\"<h3 style=\"background-color:tomato;\">Something went wrong! Try again....</h3>\"");
		        			  request.getRequestDispatcher("vendorUpdate.jsp").include(request, response);
		        		  }
		        	  }
		        	  else if(upt.equalsIgnoreCase("Update Vendor location")) 
		        	  {
		        		  String vloc = request.getParameter("update");
		        		  v.setVloc(vloc);
		        		  int count = ShopitDao.updateVloc(v);
		        		  if(count>=1) {
		        			  pw.println("<h3 style=\"background-color:green;\">Vendor Location Update Successful....</h3>");
		        			  request.getRequestDispatcher("vendorHome.jsp").include(request, response);
		        		  }
		        		  else {
		        			  pw.println("\"<h3 style=\"background-color:tomato;\">Something went wrong! Try again....</h3>\"");
		        			  request.getRequestDispatcher("vendorUpdate.jsp").include(request, response);
		        		  }
		        	  }
		          
		        	  
					else {
						pw.println("\"<h3 style=\"background-color:tomato;\">Update not sucessfull...! Try again....</h3>\""); 
			            request.getRequestDispatcher("vendorUpdate.jsp").include(request, response); 
					}
		          }else {
		        	  pw.println("\"<h3 style=\"background-color:tomato;\">Please check Vendor name and password...! Try again....</h3>\""); 
			            request.getRequestDispatcher("vendorDelete.jsp").include(request, response);
		          }
		        }   
	        else{  
	        	pw.println("\"<h3 style=\"background-color:tomato;\">Please Login to Continue....</h3>\""); 
	            request.getRequestDispatcher("vendorLogin.jsp").include(request, response);  
	        } 
	}
	

}

