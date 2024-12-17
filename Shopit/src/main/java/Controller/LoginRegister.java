package Controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.time.LocalDate;

import DaoModule.ShopitDao;
import Model.User;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;


@WebServlet("/LoginRegister")
public class LoginRegister extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		PrintWriter pw = response.getWriter();
		String name = request.getParameter("uname");
		String pass = request.getParameter("upass");
	
		User u = ShopitDao.getUserDetail(name);
		LocalDate dt= LocalDate.now();
		String date =dt.toString();
		
		if((name.equals(u.getUname())|| name.equalsIgnoreCase(u.getUemail())) && pass.equals(u.getUpass()) ) {
			HttpSession session = request.getSession();
			session.setAttribute("uname", name);
			session.setAttribute("date", date);
			//System.out.println(dt);
			pw.println("<h3 style=\"background-color:green;\">Login Successful....Welcome back : <span style=\"text-color:red;\">"+name+"</span></h3>");
			
			RequestDispatcher rd = request.getRequestDispatcher("Home");
			rd.include(request, response);
			
		}else {
			pw.println("<h3 style=\"background-color:red;\">Incorrect Details check Details or register</h3>");
			
			RequestDispatcher rd = request.getRequestDispatcher("userLogin.jsp");
			rd.include(request, response);
		}
		
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		PrintWriter pw = response.getWriter();
	
		String name = request.getParameter("uname");
		String pass = request.getParameter("upass");
		String cpass = request.getParameter("cpass");
		String email = request.getParameter("uemail");
		String mobile = request.getParameter("umobile");
		
		User u = new User();
		u.setUname(name);
		u.setUpass(cpass);
		u.setUemail(email);
		u.setUmobile(mobile);
		boolean isavaliable = false;
		User user = ShopitDao.getUserDetail(name);
		String dbuser = user.getUname();
		if(user.equals(dbuser)) {
			isavaliable=true;
		}
		
		if(!(isavaliable)) {
			if(pass.equals(cpass)) {
					int count = ShopitDao.addUser(u);
					
					if(count>=1) {
						
						pw.println("<h3 style=\"background-color:green;\">Register Successfull....</h3>");
						
						RequestDispatcher rd = request.getRequestDispatcher("userLogin.jsp");
						rd.include(request, response);
					}else {
						pw.println("\"<h3 style=\"background-color:tomato;\">Something went wrong! Try again....</h3>\"");

						request.getRequestDispatcher("userRegister.jsp").include(request, response);
					}
			}
			else {
				pw.println("\"<h3 style=\"background-color:tomato;\">Entered Password is not Matched....</h3>\"");

				request.getRequestDispatcher("userRegister.jsp").include(request, response);
			}
	}else {
		pw.println("\"<h3 style=\"background-color:tomato;\">User name already Exist....</h3>\"");

		request.getRequestDispatcher("addRegister.jsp").include(request, response);
	}

	}

}
