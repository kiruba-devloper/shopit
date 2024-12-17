package Controller;

import java.io.IOException;

import DaoModule.ProductsDao;
import Model.Products;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class ProductDetails
 */
@WebServlet("/ProductDetails")
public class ProductDetails extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public ProductDetails() {
        super();
       
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String Prdid= request.getParameter("prdid");
		String Prdname= request.getParameter("prdName");
		
		//System.out.println(Prdid+" "+Prdname);
		
		Products p = ProductsDao.getProductDetail(Prdid);
		//System.out.println("prddet :"+p);
		if(Prdid.equals(p.getProduct_id())) {
		request.setAttribute("productId",p.getProduct_id());
		//System.out.println(p.getProduct_id());
		request.setAttribute("productName",p.getName() );
		request.setAttribute("productimage",p.getImage_url() );
		request.setAttribute("description",p.getDescription() );
		request.setAttribute("category",p.getCategory() );
		request.setAttribute("vendorId",p.getVendor_id() );
		request.setAttribute("vendorName",p.getVendor_name() );
		request.setAttribute("stockQuantity",p.getStock_quantity() );
		request.setAttribute("price",p.getPrice() );
		
		request.getRequestDispatcher("productDetail.jsp").forward(request, response);
		}
	}

	
}
