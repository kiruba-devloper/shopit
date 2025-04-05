package DaoModule;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import Model.User;
import Model.Vendors;

public class ShopitDao {
	public static Connection getConnection(){  
        Connection con=null;  
        try{  
        	Class.forName("com.mysql.cj.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://sql12.freesqldatabase.com:3306/sql12771409","sql12771409","1aSVuBYUg8");  
        }catch(Exception e){System.out.println(e);}  
        return con;  

    }  
    
	public static int addUser (User u){  
        int status=0;  
        try{  
            Connection con= getConnection();  
            PreparedStatement ps=con.prepareStatement("insert into users (uname,upass,uemail,umobile) values (?,?,?,?)");  
            ps.setString(1,u.getUname());  
            ps.setString(2,u.getUpass());  
            ps.setString(3,u.getUemail());  
            ps.setString(4,u.getUmobile());  
              
            status=ps.executeUpdate();  
              

            con.close();  
        }catch(Exception ex){ex.printStackTrace();}  
          
        return status;  
    }  
    public static int updateUname(User u,String name){  
        int status=0;  
        try{  
            Connection con=getConnection();  
            PreparedStatement ps=con.prepareStatement("update users set uname=? where uname=?");  
            ps.setString(1,u.getUname());   
            ps.setString(2,name);  
              
            status=ps.executeUpdate();  
              
            con.close();  
        }catch(Exception ex){ex.printStackTrace();}  
          
        return status;  
    }  
    public static int updateUpass(User u){  
    	int status=0;  
    	try{  
    		Connection con=getConnection();  
    		PreparedStatement ps=con.prepareStatement("update users set upass=? where uname=?");
    		ps.setString(1,u.getUpass()); 
    		ps.setString(2,u.getUname());  
    		
    		status=ps.executeUpdate();  
    		
    		con.close();  
    	}catch(Exception ex){ex.printStackTrace();}  
    	
    	return status;  
    }  
    public static int updateUemail(User u){  
    	int status=0;  
    	try{  
    		Connection con=getConnection();  
    		PreparedStatement ps=con.prepareStatement("update users set uemail=? where uname=?"); 
    		ps.setString(1,u.getUemail());  
    		ps.setString(2,u.getUname());  
    		
    		status=ps.executeUpdate();  
    		
    		con.close();  
    	}catch(Exception ex){ex.printStackTrace();}  
    	
    	return status;  
    }  
    public static int updateUmobile(User u){  
    	int status=0;  
    	try{  
    		Connection con=getConnection();  
    		PreparedStatement ps=con.prepareStatement("update users set umobile=? where uname=?"); 
    		ps.setString(1,u.getUmobile());  
    		ps.setString(2,u.getUname());  
    		
    		status=ps.executeUpdate();  
    		
    		con.close();  
    	}catch(Exception ex){ex.printStackTrace();}  
    	
    	return status;  
    }  
    public static int delete(String uname){  
        int status=0;  
        try{  
            Connection con=getConnection();  

            PreparedStatement ps=con.prepareStatement("delete from users where uname=?");  
            ps.setString(1,uname);  
            status=ps.executeUpdate();  
              
            con.close();  
        }catch(Exception e){e.printStackTrace();}  
          
        return status;  
    }  
    public static User getUserDetail(String uname){  
        User u=new User();  
          
        try{  
            Connection con=getConnection();  
        	
            PreparedStatement ps=con.prepareStatement("select * from users where uname=?");  
            ps.setString(1,uname);  
            ResultSet rs=ps.executeQuery();  
            if(rs.next()){  
                u.setUname(rs.getString("uname"));  
                u.setUpass(rs.getString("upass"));  
                u.setUemail(rs.getString("uemail"));  
                u.setUmobile(rs.getString("umobile"));  
                
            }  
            con.close();  
        }catch(Exception ex){ex.printStackTrace();}  
          
        return u;  
    }  
    public static List<User> getAllUser(){  
        List<User> list=new ArrayList<User>();  
          
        try{  
            Connection con= getConnection();  
            PreparedStatement ps=con.prepareStatement("select * from users");  
            ResultSet rs=ps.executeQuery();  
            while(rs.next()){  
                User u=new User();  
                u.setUname(rs.getString("uname"));  
                u.setUpass(rs.getString("upass"));  
                u.setUemail(rs.getString("uemail"));  
                u.setUmobile(rs.getString("umobile"));  
                list.add(u);  
            }  
            con.close();  
        }catch(Exception e){e.printStackTrace();}  
          
        return list;  
    }  
    
    public static int addVendor (Vendors v){  
        int status=0;  
        try{  
            Connection con=  getConnection();  
            PreparedStatement ps=con.prepareStatement("insert into vendors (vid, vname,vpass,vemail,vmobile ,vloc) values (?,?,?,?,?,?)");  
            ps.setString(1,v.getVid());  
            ps.setString(2,v.getVname());  
            ps.setString(3,v.getVpass());  
            ps.setString(4,v.getVemail());  
            ps.setString(4,v.getVmobile());  
            ps.setString(4,v.getVloc());  
              
            status=ps.executeUpdate();  
              

            con.close();  
        }catch(Exception ex){ex.printStackTrace();}  
          
        return status;  
    }  
    public static int updateVname(Vendors v,String name){  
        int status=0;  
        try{  
            Connection con= getConnection();  
            PreparedStatement ps=con.prepareStatement("update vendors set vname=? where vname=?");  
            ps.setString(1,v.getVname());   
            ps.setString(2,name);  
              
            status=ps.executeUpdate();  
              
            con.close();  
        }catch(Exception ex){ex.printStackTrace();}  
          
        return status;  
    }  
    public static int updateVpass(Vendors v){  
    	int status=0;  
    	try{  
    		Connection con= getConnection();  
    		PreparedStatement ps=con.prepareStatement("update vendors set vpass=? where vname=?");
    		ps.setString(1,v.getVpass()); 
    		ps.setString(2,v.getVname());  
    		
    		status=ps.executeUpdate();  
    		
    		con.close();  
    	}catch(Exception ex){ex.printStackTrace();}  
    	
    	return status;  
    }  
    public static int updateVemail(Vendors v){  
    	int status=0;  
    	try{  
    		Connection con= getConnection();  
    		PreparedStatement ps=con.prepareStatement("update vendors set vemail=? where vname=?"); 
    		ps.setString(1,v.getVemail());  
    		ps.setString(2,v.getVname());  
    		
    		status=ps.executeUpdate();  
    		
    		con.close();  
    	}catch(Exception ex){ex.printStackTrace();}  
    	
    	return status;  
    }  
    public static int updateVloc(Vendors v){  
    	int status=0;  
    	try{  
    		Connection con= getConnection();  
    		PreparedStatement ps=con.prepareStatement("update vendors set vloc=? where vname=?"); 
    		ps.setString(1,v.getVloc());  
    		ps.setString(2,v.getVname());  
    		
    		status=ps.executeUpdate();  
    		
    		con.close();  
    	}catch(Exception ex){ex.printStackTrace();}  
    	
    	return status;  
    }  
    public static int updateVmobile(Vendors v){  
    	int status=0;  
    	try{  
    		Connection con=getConnection();  
    		PreparedStatement ps=con.prepareStatement("update vendors set vmobile=? where vname=?"); 
    		ps.setString(1,v.getVmobile());  
    		ps.setString(2,v.getVname());  
    		
    		status=ps.executeUpdate();  
    		
    		con.close();  
    	}catch(Exception ex){ex.printStackTrace();}  
    	
    	return status;  
    }  
    public static int deleteVendor(String vname){  
        int status=0;  
        try{  
            Connection con=getConnection();  

            PreparedStatement ps=con.prepareStatement("delete from vendors where vname=?");  
            ps.setString(1,vname);  
            status=ps.executeUpdate();  
              
            con.close();  
        }catch(Exception e){e.printStackTrace();}  
          
        return status;  
    }  
    public static Vendors getVendorDetail(String vname){  
    	Vendors v=new Vendors();  
          
        try{  
            Connection con=getConnection();  
            PreparedStatement ps=con.prepareStatement("select * from vendors where vname=?");  
            ps.setString(1,vname);  
            ResultSet rs=ps.executeQuery();  
            if(rs.next()){  
                v.setVname(rs.getString("vname"));  
                v.setVpass(rs.getString("Vpass"));  
                v.setVemail(rs.getString("Vemail"));  
                v.setVmobile(rs.getString("Vmobile"));  
                v.setVid(rs.getString("Vid"));  
                v.setVloc(rs.getString("vloc"));   
                
            }  
            con.close();  
        }catch(Exception ex){ex.printStackTrace();}  
          
        return v;  
    }  
   
  
}

