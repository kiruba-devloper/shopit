package Model;

public class Item {
	 String pname,category,dop,uname;
	 Integer id,qty;
	 Double uprice,tprice;
	
	public Item() {
		super();
		// TODO Auto-generated constructor stub
	}

	public String getPname() {
		return pname;
	}

	public void setPname(String pname) {
		this.pname = pname;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public String getDop() {
		return dop;
	}

	public void setDop(String dop) {
		this.dop = dop;
	}

	public String getUname() {
		return uname;
	}

	public void setUname(String uname) {
		this.uname = uname;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getQty() {
		return qty;
	}

	public void setQty(Integer qty) {
		this.qty = qty;
	}

	public Double getUprice() {
		return uprice;
	}

	public void setUprice(Double uprice2) {
		this.uprice = uprice2;
	}

	public Double getTprice() {
		return tprice;
	}

	public void setTprice(Double tprice2) {
		this.tprice = tprice2;
	}

	@Override
	public String toString() {
		return "Item [pname=" + pname + ", category=" + category + ", dop=" + dop + ", uname=" + uname + ", id=" + id
				+ ", qty=" + qty + ", uprice=" + uprice + ", tprice=" + tprice + "]";
	}

	public Item(String pname, String category, String dop, String uname, Integer id, Integer qty, double d,
			double e) {
		super();
		this.pname = pname;
		this.category = category;
		this.dop = dop;
		this.uname = uname;
		this.id = id;
		this.qty = qty;
		this.uprice = d;
		this.tprice = e;
	}


		
	

}
