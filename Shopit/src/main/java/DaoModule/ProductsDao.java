package DaoModule;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import Model.Item;
import Model.Products;

public class ProductsDao {
	 public static int addProduct (Products p){  
	        int status=0;  
	        try{  
	            Connection con= ShopitDao.getConnection();  
	            PreparedStatement ps=con.prepareStatement("insert into products (product_id, name, description, price, category, stock_quantity, image_url, vendor_id, vendor_name) values (?,?,?,?,?,?,?,?,?)");  
	            ps.setString(1,p.getProduct_id());  
	            ps.setString(2,p.getName());  
	            ps.setString(3,p.getDescription());  
	            ps.setString(4,p.getPrice());  
	            ps.setString(5,p.getCategory());  
	            ps.setString(6,p.getStock_quantity());  
	            ps.setString(7,p.getImage_url());  
	            ps.setString(8,p.getVendor_id());  
	            ps.setString(9,p.getVendor_name());  
	              
	            status=ps.executeUpdate();  
	              

	            con.close();  
	        }catch(Exception ex){ex.printStackTrace();}  
	          
	        return status;  
	    } 
	 public static int deleteProduct(String prdid){  
	        int status=0;  
	        try{  
	            Connection con=ShopitDao.getConnection();  

	            PreparedStatement ps=con.prepareStatement("delete from products where product_id=?");  
	            ps.setString(1,prdid);  
	            status=ps.executeUpdate();  
	              
	            con.close();  
	        }catch(Exception e){e.printStackTrace();}  
	          
	        return status;  
	    }
	 public static int updateProduct(Products p,String prdid){  
	    	int status=0;  
	    	try{  
	    		Connection con=ShopitDao.getConnection();  
	    		PreparedStatement ps=con.prepareStatement("update products set name=?, description=?, price=?, category=?, stock_quantity=?, image_url=?, vendor_id=?, vendor_name=? where product_id=?");    
	            ps.setString(1,p.getName());  
	            ps.setString(2,p.getDescription());  
	            ps.setString(3,p.getPrice());  
	            ps.setString(4,p.getCategory());  
	            ps.setString(5,p.getStock_quantity());  
	            ps.setString(6,p.getImage_url());  
	            ps.setString(7,p.getVendor_id());  
	            ps.setString(8,p.getVendor_name());
	            ps.setString(9,prdid);
	    		
	    		status=ps.executeUpdate();  
	    		
	    		con.close();  
	    	}catch(Exception ex){ex.printStackTrace();}  
	    	
	    	return status;  
	    } 
	 public static Products getProductDetail(String prdid){  
		 Products p=new Products();  
	          
	        try{  
	            Connection con=ShopitDao.getConnection();  
	            PreparedStatement ps=con.prepareStatement("select * from products where product_id=?");  
	            ps.setString(1,prdid);  
	            ResultSet rs=ps.executeQuery();  
	            if(rs.next()){ 
	            	p.setProduct_id(prdid);
	                p.setName(rs.getString("name"));  
	                p.setDescription(rs.getString("description"));  
	                p.setPrice(rs.getString("price"));  
	                p.setCategory(rs.getString("category"));  
	                p.setStock_quantity(rs.getString("stock_quantity"));  
	                p.setImage_url(rs.getString("image_url"));
	                p.setVendor_id(rs.getString("vendor_id"));
	                p.setVendor_name(rs.getString("vendor_name"));  	                            
	            }  
	            con.close();  
	        }catch(Exception ex){ex.printStackTrace();}  
	          
	        return p;  
	    } 
	 public static List<Products> getProductCategory(String category){  
		   
		 List<Products> list=new ArrayList<Products>();
		 try{  
			 Connection con=ShopitDao.getConnection();  
			 PreparedStatement ps=con.prepareStatement("select * from products where category=?");  
			 ps.setString(1,category);  
			 ResultSet rs=ps.executeQuery();  
			 while(rs.next()){ 
				 Products p=new Products();
				 p.setProduct_id(rs.getString("product_id"));
				 p.setName(rs.getString("name"));  
				 p.setDescription(rs.getString("description"));  
				 p.setPrice(rs.getString("price"));  
				 p.setCategory(rs.getString("category"));  
				 p.setStock_quantity(rs.getString("stock_quantity"));  
				 p.setImage_url(rs.getString("image_url"));
				 p.setVendor_id(rs.getString("vendor_id"));
				 p.setVendor_name(rs.getString("vendor_name")); 
				 list.add(p);
			 }  
			 con.close();  
		 }catch(Exception ex){ex.printStackTrace();}  
		 
		 return list;  
	 } 
	 public static List<Products> getProductByVendor(String vid){  
		 
		 List<Products> list=new ArrayList<Products>();
		 try{  
			 Connection con=ShopitDao.getConnection();  
			 PreparedStatement ps=con.prepareStatement("select * from products where vendor_id=?");  
			 ps.setString(1,vid);  
			 ResultSet rs=ps.executeQuery();  
			 while(rs.next()){ 
				 Products p=new Products();
				 p.setProduct_id(rs.getString("product_id"));  
				 p.setName(rs.getString("name"));  
				 p.setDescription(rs.getString("description"));  
				 p.setPrice(rs.getString("price"));  
				 p.setCategory(rs.getString("category"));  
				 p.setStock_quantity(rs.getString("stock_quantity"));  
				 p.setImage_url(rs.getString("image_url"));
				 p.setVendor_id(rs.getString("vendor_id"));
				 p.setVendor_name(rs.getString("vendor_name")); 
				 list.add(p);
			 }  
			 con.close();  
		 }catch(Exception ex){ex.printStackTrace();}  
		 
		 return list;  
	 }
	 public static List<Products> getAllProduct(){  
		 
		 List<Products> list=new ArrayList<Products>();
		 try{  
			 Connection con=ShopitDao.getConnection();  
			 PreparedStatement ps=con.prepareStatement("select * from products");  
			   
			 ResultSet rs=ps.executeQuery();  
			 while(rs.next()){ 
				 Products p=new Products();
				 p.setProduct_id(rs.getString("product_id"));  
				 p.setName(rs.getString("name"));  
				 p.setDescription(rs.getString("description"));  
				 p.setPrice(rs.getString("price"));  
				 p.setCategory(rs.getString("category"));  
				 p.setStock_quantity(rs.getString("stock_quantity"));  
				 p.setImage_url(rs.getString("image_url"));
				 p.setVendor_id(rs.getString("vendor_id"));
				 p.setVendor_name(rs.getString("vendor_name")); 
				 list.add(p);
			 }  
			 con.close();  
		 }catch(Exception ex){ex.printStackTrace();}  
		 
		 return list;  
	 }
	 public static List<Products> getAllProductonCategory(){  
		 
		 List<Products> list=new ArrayList<Products>();
		 try{  
			 Connection con=ShopitDao.getConnection();  
			 PreparedStatement ps=con.prepareStatement("select * from products groupby category");  
			 
			 ResultSet rs=ps.executeQuery();  
			 while(rs.next()){ 
				 Products p=new Products();
				 p.setProduct_id(rs.getString("product_id"));  
				 p.setName(rs.getString("name"));  
				 p.setDescription(rs.getString("description"));  
				 p.setPrice(rs.getString("price"));  
				 p.setCategory(rs.getString("category"));  
				 p.setStock_quantity(rs.getString("stock_quantity"));  
				 p.setImage_url(rs.getString("image_url"));
				 p.setVendor_id(rs.getString("vendor_id"));
				 p.setVendor_name(rs.getString("vendor_name")); 
				 list.add(p);
			 }  
			 con.close();  
		 }catch(Exception ex){ex.printStackTrace();}  
		 
		 return list;  
	 }
	 public static List<String> getAllCategory(){  
		 
		 List<String> list=new ArrayList<String>();
		 try{ 
			 Connection con=ShopitDao.getConnection();  
			 PreparedStatement ps=con.prepareStatement("select DISTINCT category from products");  
			 
			 ResultSet rs=ps.executeQuery();  
			 while(rs.next()){ 
				   
				String cate = (rs.getString("category"));  
				 
				 list.add(cate);
			 }  
			 con.close();  
		 }catch(Exception ex){ex.printStackTrace();}  
		 
		 return list;  
	 }
	 
	
}
