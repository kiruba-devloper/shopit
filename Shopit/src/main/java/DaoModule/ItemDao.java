package DaoModule;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import Model.Item;

public class ItemDao {
	
		public static int addItems(List<Item> list) {
		 int status=0;
		 try {
			 Connection con= ShopitDao.getConnection(); 
			 for(Item i:list) {
			  
	            PreparedStatement ps=con.prepareStatement("insert into item (uname,id,pname,category,dop,qty,uprice,tprice) values (?,?,?,?,?,?,?,?)");  
	            ps.setString(1,i.getUname());  
	            ps.setInt(2, i.getId());
	            ps.setString(3,i.getPname());
	            ps.setString(4,i.getCategory());
	            ps.setString(5,i.getDop());
	            ps.setInt(6, i.getQty());
	            ps.setDouble(7, i.getUprice());  
	            ps.setDouble(8, i.getTprice());  
	            status=ps.executeUpdate();  
	              
			 }
	            con.close();  
			 
		 }catch(Exception ex){ex.printStackTrace();}  
		 return status;
	 }
	 
		 public static List<Item> getItemDetails(String uname){  
			 List<Item> list=new ArrayList<Item>(); 
		          
		        try{  
		            Connection con=ShopitDao.getConnection();  
		            PreparedStatement ps=con.prepareStatement("select * from item where uname=?");  
		            ps.setString(1,uname);  
		            ResultSet rs=ps.executeQuery();  
		            while(rs.next()){ 
		            	Item i = new Item();
		                i.setUname(rs.getString("uname"));
		                i.setPname(rs.getString("pname"));
		                i.setCategory(rs.getString("category"));
		                i.setDop(rs.getString("dop"));
		                i.setId(rs.getInt("id"));
		                i.setQty(rs.getInt("qty"));
		                i.setUprice(rs.getDouble("uprice"));
		                i.setTprice(rs.getDouble("tprice"));
		                list.add(i);	                            
		            }  
		            con.close();  
		        }catch(Exception ex){ex.printStackTrace();}  
		          
		        return list;  
		    } 
}
