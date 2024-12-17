package Model;

public class Products {
	private String product_id, name, description, price, category, stock_quantity, image_url, vendor_id, vendor_name;

	public String getProduct_id() {
		return product_id;
	}

	public void setProduct_id(String product_id) {
		this.product_id = product_id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getPrice() {
		return price;
	}

	public void setPrice(String price) {
		this.price = price;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public String getStock_quantity() {
		return stock_quantity;
	}

	public void setStock_quantity(String stock_quantity) {
		this.stock_quantity = stock_quantity;
	}

	public String getImage_url() {
		return image_url;
	}

	public void setImage_url(String image_url) {
		this.image_url = image_url;
	}

	public String getVendor_id() {
		return vendor_id;
	}

	public void setVendor_id(String vendor_id) {
		this.vendor_id = vendor_id;
	}

	public String getVendor_name() {
		return vendor_name;
	}

	public void setVendor_name(String vendor_name) {
		this.vendor_name = vendor_name;
	}

	@Override
	public String toString() {
		return "Products [product_id=" + product_id + ", name=" + name + ", description=" + description + ", price="
				+ price + ", category=" + category + ", stock_quantity=" + stock_quantity + ", image_url=" + image_url
				+ ", vendor_id=" + vendor_id + ", vendor_name=" + vendor_name + "]";
	}

	public Products(String product_id, String name, String description, String price, String category,
			String stock_quantity, String image_url, String vendor_id, String vendor_name) {
		super();
		this.product_id = product_id;
		this.name = name;
		this.description = description;
		this.price = price;
		this.category = category;
		this.stock_quantity = stock_quantity;
		this.image_url = image_url;
		this.vendor_id = vendor_id;
		this.vendor_name = vendor_name;
	}

	public Products() {
		super();
		// TODO Auto-generated constructor stub
	}
	
}
