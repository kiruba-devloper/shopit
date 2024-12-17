package Controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import DaoModule.ProductsDao;
import DaoModule.ShopitDao;
import Model.Products;
import Model.Vendors;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;


@WebServlet("/Home")
public class Home extends HttpServlet {
	private static final long serialVersionUID = 1L;
  
    public Home() {
        super();
       
    }
    List<Products> product = new ArrayList<Products>();
    List<Vendors> vendor = new ArrayList<Vendors>();
    StringBuffer sb= new StringBuffer();
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		PrintWriter pw = response.getWriter();
//		try {
//		Connection con= ShopitDao.getConnection();  
//        PreparedStatement ps=con.prepareStatement("select * from products");  
//        ResultSet rs;
//		
//			rs = ps.executeQuery();
//		
//        while(rs.next()){  
//            Products p=new Products();  
//            p.setProduct_id(rs.getString("product_id"));  
//            p.setName(rs.getString("name")); 
//            p.setDescription(rs.getString("description")); 
//            p.setPrice(rs.getString("price")); 
//            p.setCategory(rs.getString("category"));
//            p.setStock_quantity(rs.getString("stock_quantity"));
//            p.setImage_url(rs.getString("image_url"));
//            p.setVendor_id(rs.getString("vendor_id"));
//            p.setVendor_name(rs.getString("vendor_name"));
//            product.add(p);  
//            
//        }
//       // con.close();
//            // second table
//          //  Connection con1= ShopitDao.getConnection();  
//            PreparedStatement predst=con.prepareStatement("select * from vendors");  
//             
//    		
//             ResultSet	rs1 = predst.executeQuery();
//             
//            while(rs1.next()){  
//            	Vendors v=new Vendors();  
//                v.setVid(rs1.getString("vid"));  
//                v.setVname(rs1.getString("vname")); 
//                v.setVpass(rs1.getString("vpass")); 
//                v.setVemail(rs1.getString("vemail")); 
//                v.setVmobile(rs1.getString("vmobile"));
//                v.setVloc(rs1.getString("vloc"));
//                vendor.add(v);  
//                
//            }
//            con.close();
//            int count=1;
//                if(product !=null && vendor !=null) {
//                	for(Products  p :product ) {
//                		for(Vendors v : vendor) {	
//                			if(p.getVendor_id().equals(v.getVid())) {
//                				if(count==1) {
//                					sb.append("<tr>");
//                					count++;
//                				}
//                				else if(count==5) {
//                					sb.append("</tr>");
//                					count=1;
//                    					
//                				}else {
//                				    sb.append("<td><h3>"+p.getProduct_id()+" "+p.getName()+"</h3><br><img src=\""+p.getImage_url()+"\"\\><br>Description: "+p.getDescription()+"<br> <h3>Price: Rs.<span style='color:Brown'>"+p.getPrice()+"</span></h3><br> Category: "+p.getCategory()+"<br> Vendor Name: "+p.getVendor_name()+"<br> Avaliable Quantity: "+p.getStock_quantity()+"<br> Vendor Location: "+v.getVloc()+"<br><br><h2><a href=\"ProductDetails?prdid="+p.getProduct_id()+"&prdName="+p.getName()+"\"><button id='btn'>Buy</button></a></h2></td>");
//                				count ++;
//                				}
//                			}
//                		//sb.append("<tr><td>"+cname+"</td><td>"+cpass+"</td><td>"+cmobile+"</td></tr>");
//                		}
//                	}
//                	//System.out.println(sb);
//                }
//                
//                
//                               
//                
//                
//                else {
//                	System.out.println("sry");
//                }
//                request.setAttribute("table",(sb) );
//    			
//    			request.getRequestDispatcher("home.jsp").forward(request, response);
//          
//		} catch (SQLException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}  
//     
		request.getRequestDispatcher("home.jsp").forward(request, response);
	}

}
