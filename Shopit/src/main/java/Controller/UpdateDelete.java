package Controller;

import java.io.IOException;
import java.io.PrintWriter;

import DaoModule.ShopitDao;
import Model.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 * Servlet implementation class UserDelete
 */
@WebServlet("/UpdateDelete")
public class UpdateDelete extends HttpServlet {
	private static final long serialVersionUID = 1L;
           
    public UpdateDelete() {
        super();
        
    }	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		PrintWriter pw = response.getWriter();
		HttpSession session=request.getSession(false);  

        if(session!=null){  
        String sname=(String)session.getAttribute("uname");
        request.setAttribute("mem",sname);
        String name = request.getParameter("uname");
		String pass = request.getParameter("upass"); 
        User u = ShopitDao.getUserDetail(name);
        String dbname = u.getUname();
        String dbpass = u.getUpass();
          if(name.equals(dbname) && pass.equals(dbpass)) {
        	  int count = ShopitDao.delete(name);
			
			
			if(count>=1) {
				request.getSession().invalidate();
				pw.println("<h3 style=\"background-color:green;\">Delete Successful....</h3>");
				
				request.getRequestDispatcher("userLogin.jsp").include(request, response);
				
				
			}
			else {
				pw.println("\"<h3 style=\"background-color:tomato;\">Deletion not sucessfull...! Try again....</h3>\""); 
	            request.getRequestDispatcher("userDelete.jsp").include(request, response); 
			}
          }else {
        	  pw.println("\"<h3 style=\"background-color:tomato;\">Please check your password...! Try again....</h3>\""); 
	            request.getRequestDispatcher("userDelete.jsp").include(request, response);
          }
        }  
        else{  
        	pw.println("\"<h3 style=\"background-color:tomato;\">Please Login to Continue....</h3>\""); 
            request.getRequestDispatcher("userLogin.jsp").include(request, response);  
        } 
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		PrintWriter pw = response.getWriter();
		HttpSession session=request.getSession(false); 
		if(session!=null){  
	        String sname=(String)session.getAttribute("uname"); 
	        request.setAttribute("mem",sname);
	        String pass= request.getParameter("cpass");
			String upt = request.getParameter("upt");
			User u = new User();
			u.setUname(sname);
			 User user = ShopitDao.getUserDetail(sname);
		        String dbname = user.getUname();
		        String dbpass = user.getUpass();
		          if(sname.equals(dbname) && pass.equals(dbpass)) {
		        	  
		        	  if(upt.equalsIgnoreCase("Update User Name")) {
		        		  String uname = request.getParameter("update");
		        		  u.setUname(uname);
		        		  int count = ShopitDao.updateUname(u,dbname);
							if(count>=1) {
								pw.println("<h3 style=\"background-color:green;\">User Name Update Successful....</h3>");
								request.getRequestDispatcher("Home.jsp").include(request, response);
							}
							else {
								pw.println("\"<h3 style=\"background-color:tomato;\">Something went wrong! Try again....</h3>\"");
								request.getRequestDispatcher("userUpdate.jsp").include(request, response);
							}
		        	  }
		        	  else if(upt.equalsIgnoreCase("Update User Password")) {
		        		  String upass = request.getParameter("update");
		        		  u.setUpass(upass);
		        		  int count = ShopitDao.updateUpass(u);
		        		  if(count>=1) {
		        			  pw.println("<h3 style=\"background-color:green;\">User Password Update Successful....</h3>");
		        			  request.getRequestDispatcher("Home.jsp").include(request, response);
		        		  }
		        		  else {
		        			  pw.println("\"<h3 style=\"background-color:tomato;\">Something went wrong! Try again....</h3>\"");
		        			  request.getRequestDispatcher("userUpdate.jsp").include(request, response);
		        		  }
		        	  }
		        	  else if(upt.equalsIgnoreCase("Update Mobile Number")) {
		        		  String umobile = request.getParameter("update");
		        		  u.setUpass(umobile);
		        		  int count = ShopitDao.updateUpass(u);
		        		  if(count>=1) {
		        			  pw.println("<h3 style=\"background-color:green;\">User Mobile Number Update Successful....</h3>");
		        			  request.getRequestDispatcher("Home.jsp").include(request, response);
		        		  }
		        		  else {
		        			  pw.println("\"<h3 style=\"background-color:tomato;\">Something went wrong! Try again....</h3>\"");
		        			  request.getRequestDispatcher("userUpdate.jsp").include(request, response);
		        		  }
		        	  }
		        	  else if(upt.equalsIgnoreCase("Update User Email")) {
		        		  String uemail = request.getParameter("update");
		        		  u.setUpass(uemail);
		        		  int count = ShopitDao.updateUpass(u);
		        		  if(count>=1) {
		        			  pw.println("<h3 style=\"background-color:green;\">User Email Update Successful....</h3>");
		        			  request.getRequestDispatcher("Home.jsp").include(request, response);
		        		  }
		        		  else {
		        			  pw.println("\"<h3 style=\"background-color:tomato;\">Something went wrong! Try again....</h3>\"");
		        			  request.getRequestDispatcher("userUpdate.jsp").include(request, response);
		        		  }
		        	  }
		        	  
					else {
						pw.println("\"<h3 style=\"background-color:tomato;\">Update not sucessfull...! Try again....</h3>\""); 
			            request.getRequestDispatcher("userUpdate.jsp").include(request, response); 
					}
		          }else {
		        	  pw.println("\"<h3 style=\"background-color:tomato;\">Please check username and password...! Try again....</h3>\""); 
			            request.getRequestDispatcher("userDelete.jsp").include(request, response);
		          }
		        }   
	        else{  
	        	pw.println("\"<h3 style=\"background-color:tomato;\">Please Login to Continue....</h3>\""); 
	            request.getRequestDispatcher("userLogin.jsp").include(request, response);  
	        } 
	}

}
