package ServiceModule;

import java.io.IOException;
import java.util.ArrayList;

import DaoModule.ItemDao;
import DaoModule.ProductsDao;
import Model.Item;
import Model.Products;

public class MyCart {

	private static ArrayList<Item> item = new ArrayList<Item>();
	
//	public  int addItem(Item i) {
//		for(Item itm: item) {
//			if(i.getId()==itm.getId()) {
//				itm.setQty(itm.getQty()+i.getQty());
//				return;
//			}
//		}
//		if(i!=null) {
//		item.add(new Item("laptop","elect","11112","kkk",52,1,50.00,50.00));
//		item.add(new Item(i.getPname(),i.getCategory(),i.getDop(),i.getUname(),i.getId(),i.getQty(),i.getUprice(),i.getTprice()));
//		return 1;
//		}else {
//			return 0;
//		}
//		//System.out.println(item);
//		//System.out.println(viewList());
//	}
	
	 public int addItem(Item i) {
	        if (i != null) {
	           
	            for (Item itm : item) {
	                if (itm.getId() == i.getId()) {
	                    
	                    itm.setQty(itm.getQty() + i.getQty());
	                    return 1;
	                }
	            }
	            
	            item.add(new Item(i.getPname(),i.getCategory(),i.getDop(),i.getUname(),i.getId(),i.getQty(),i.getUprice(),i.getTprice()));
	           
	            return 1;
	            
	        }
	        return 0; // Return 0 if the item is null
	    }
	 public int updateItem(Item i) {
		 if (i != null) {
	           
	            for (Item itm : item) {
	                if (itm.getId() == i.getId()) {
	                    System.out.println("mycrt :"+i.getId());
	                    itm.setQty(i.getQty());
	                    return 1;
	                }
	            }
	            
	           // item.add(new Item(i.getPname(),i.getCategory(),i.getDop(),i.getUname(),i.getId(),i.getQty(),i.getUprice(),i.getTprice()));
	           
	            return 1;
	            
	        }
	        return 0;
	 }
	
	public int empty() {
		if(item!=null) {
				item.clear();
				return 1;
		}
		else {
			return 0;
		}
	}
	
	public int remove(int id) {
		boolean result=item.removeIf(i-> id==i.getId());
		int res = (result==true)? 1:0;
		return res;
	}
	
	public ArrayList<Item> viewList1(){
		//System.out.println(item);
		return item;
	}
	public void viewList(jakarta.servlet.jsp.JspWriter out) throws IOException {
		
		for (Item i : item) {
            String pname = i.getPname();
            int pid = i.getId();
            double uprice = i.getUprice();
            double tprice = i.getTprice();
            String category = i.getCategory();
            int qty = i.getQty();
            out.println("<tr>");
            out.println("<td>" + pid + "</td>");
            out.println("<td>" + pname + "</td>");
            out.println("<td>" + category + "</td>");
            out.println("<td>" + qty + "</td>");
            out.println("<td>" + uprice + "</td>");
            out.println("<td>" + tprice + "</td>");
            out.println("</tr>");
        }
		System.out.println(item);
	}
	
	public Item getProduct(int id) {
		for(Item itm: item) {
			if(id==itm.getId()) {
				
				return itm;
			}
		}
		return null;
	}
	
	
	
	public int checkOut() {
	try {	
		//Connection con=ShopitDao.getConnection(); 
		int res = 0;
		for(Item i:item) {
			String id = Integer.toString(i.getId());
			Products p = ProductsDao.getProductDetail(id);
			int qty = Integer.parseInt(p.getStock_quantity());
			String uptqty = Integer.toString(qty-i.getQty());
			p.setStock_quantity(uptqty);
			 res = ProductsDao.updateProduct(p, id);
		}
		int result = ItemDao.addItems(item);
		if(res == 1 && result == 1) {
			empty();
		return res;
		}
	} catch (Exception ex) {
        System.out.println(ex);
    }
		return 0;
	}
}
