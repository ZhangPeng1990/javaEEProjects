package tushu.product.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import tushu.business.product.object.Images;
import tushu.business.product.object.OrderForm;
import tushu.business.product.object.Product;
import tushu.business.product.object.ProductType;
import tushu.business.user.object.User;
import tushu.constans.Constans;
import tushu.enums.OrderType;
import tushu.enums.ProductColumn;
import tushu.produc.service.OrderFormService;
import tushu.produc.service.ProductService;
import tushu.produc.service.ProductTypeService;

@Controller
@RequestMapping("/product")
public class ProductController {

	@Autowired
	private ProductService productService;
	
	@Autowired
	private ProductTypeService productTypeService;
	
	@Autowired
	private OrderFormService orderFormService;
	
	@RequestMapping("/details/{id}")
	public String details(@PathVariable("id") int id, ModelMap mm){
		Product product = productService.getById(id);
		if(product != null){
			productService.updateViewCount(id, product.getViewCount() + 1);
		}
		mm.addAttribute("product", product);
		
		//看了又看
		List<Product> productLooks = productService.getByColumn(ProductColumn.view_Count, 3);
		//热销
		List<Product> productSelles = productService.getByColumn(ProductColumn.saled_Count, 4);
		mm.addAttribute("productLooks", productLooks);
		mm.addAttribute("productSelles", productSelles);
		
		return "product/details";
	}
	
	@RequestMapping("/listByType/{typeId}")
	public String listByType(@PathVariable("typeId") int typeId, ModelMap mm){
		List<ProductType> list = this.productTypeService.getByFather(productTypeService.getProductTypeById(typeId));
		mm.addAttribute("types", list);
		return "product/listByType";
	}
	
	@RequestMapping("/{productId}/beginMake")
	public String beginMake(@PathVariable("productId") Integer productId, ModelMap mm, HttpServletRequest request){
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute(Constans.SESSION_USER_ATTR_NAME);
		if(user == null){
			return "redirect:/login/returnLogin.html";
		}
		mm.addAttribute("productId", productId);
		return "product/make";
	}
	
	@RequestMapping("/{productId}/making")
	public String making(@PathVariable("productId") Integer productId, ModelMap mm, HttpServletRequest request){
		Product product = this.productService.getById(productId);
		mm.addAttribute("product", product);
		
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute(Constans.SESSION_USER_ATTR_NAME);
		
		String userPicFolderPath = "";
		
		if(user == null){
			return "redirect:/login/returnLogin.html";
		}else{
			userPicFolderPath = this.getUserPath(request, user.getId().intValue());
			
			File file = new File(userPicFolderPath);
			File[] files = file.listFiles();
			List<Images> images = null;
			if(files != null && files.length > 0){
				images = new ArrayList<Images>();
				for(File f : files){
					Images image = new Images();
					image.setName(f.getName());
					image.setUrl(request.getContextPath() + "/" + Constans.User_Pic_Path + user.getId().intValue() + "/" + image.getName());
					images.add(image);
				}
			}
			mm.addAttribute("images", images);
			
			//取缩略图集合
			String smallPicPath = userPicFolderPath + File.separator + "temp";
			File smallPic = new File(smallPicPath);
			File[] smallPicFiles = smallPic.listFiles();
			List<Images> smallImages = null;
			if(smallPicFiles != null && smallPicFiles.length > 0){
				smallImages = new ArrayList<Images>();
				for(File f : smallPicFiles){
					Images image = new Images();
					image.setName(f.getName());
					image.setUrl(request.getContextPath() + "/" + Constans.User_Pic_Path + user.getId().intValue() + "/temp/" + image.getName());
					String fatherName = image.getName().replace("-temp", "");
					image.setFatherUrl(request.getContextPath() + "/" + Constans.User_Pic_Path + user.getId().intValue() + "/" + fatherName);
					smallImages.add(image);
				}
			}
			mm.addAttribute("smallImages", smallImages);
		}
			
		return "product/photoBookEditer";
	}
	
	@RequestMapping("/{productId}/making2")
	public String making2(@PathVariable("productId") Integer productId, ModelMap mm, HttpServletRequest request){
		Product product = this.productService.getById(productId);
		mm.addAttribute("product", product);
		
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute(Constans.SESSION_USER_ATTR_NAME);
		
		String userPicFolderPath = "";
		
		if(user == null){
			return "redirect:/login/returnLogin.html";
		}else{
			userPicFolderPath = this.getUserPath(request, user.getId().intValue());
			
			File file = new File(userPicFolderPath);
			File[] files = file.listFiles();
			List<Images> images = null;
			if(files != null && files.length > 0){
				images = new ArrayList<Images>();
				for(File f : files){
					Images image = new Images();
					image.setName(f.getName());
					image.setUrl(request.getContextPath() + "/" + Constans.User_Pic_Path + user.getId().intValue() + "/" + image.getName());
					images.add(image);
				}
			}
			mm.addAttribute("images", images);
		}
			
		return "product/mimoprint";
	}
	
	private String getUserPath(HttpServletRequest request, int userId){
		String userPicFolderPath = "";
		HttpSession session = request.getSession();
		String webPath = session.getServletContext().getRealPath("/");
		userPicFolderPath = webPath + Constans.User_Pic_Path + userId;
		return userPicFolderPath;
	}
	
	@RequestMapping("/details/addToShoppingCart")
	@ResponseBody
	public String addToShoppingCart(HttpServletRequest request, HttpServletResponse reponse, @RequestParam("productId") Integer productId, @RequestParam("type") String type)
	{
		int newSize;
		User user = (User) request.getSession().getAttribute(Constans.SESSION_USER_ATTR_NAME);
		Product product = this.productService.getById(productId); 
		OrderType ot = OrderType.valueOf(type);
		newSize = this.orderFormService.addOrders(user, ot, product).size();
		reponse.setStatus(200);
		request.getSession().setAttribute(Constans.Shoping_Cart, newSize);
		return String.valueOf(newSize);
	}
	
	@RequestMapping("/{productId}/addShoppingCart")
	@ResponseBody
	public String addShoppingCart(HttpServletRequest request, HttpServletResponse reponse, @PathVariable ("productId") Integer productId, @RequestParam ("type") String type)
	{
		int newSize;
		User user = (User) request.getSession().getAttribute(Constans.SESSION_USER_ATTR_NAME);
		Product product = this.productService.getById(productId); 
		OrderType ot = OrderType.valueOf(type);
		newSize = this.orderFormService.addOrders(user, ot, product).size();
		reponse.setStatus(200);
		request.getSession().setAttribute(Constans.Shoping_Cart, newSize);
		return String.valueOf(newSize);
	}
	
	@RequestMapping("/deleteOrderForm/{type}/{id}")
	public String deleteOrderForm(HttpServletRequest request, HttpServletResponse reponse, 
			@PathVariable ("id") Long id, @PathVariable ("type") String type, ModelMap mm)
	{
		int newSize;
		User user = (User) request.getSession().getAttribute(Constans.SESSION_USER_ATTR_NAME);
		OrderForm oform = orderFormService.getById(id);
		
		this.orderFormService.deleteOrderForm(id);
		List<OrderForm> list = orderFormService.getOrders(user, OrderType.valueOf(type));
		mm.addAttribute("list", list);
		double totalAmount = 0;
		for(OrderForm of : list){
			totalAmount += of.getAmountPayable();
		}
		mm.addAttribute("totalAmount", totalAmount);
		if(oform.getOrderType().equals(OrderType.NON_PAYMENT)){
			return "redirect:/user/" + user.getId() + "/order.html";
		}else if(oform.getOrderType().equals(OrderType.SHOPPING_CART)){
			newSize = list.size();
			request.getSession().setAttribute(Constans.Shoping_Cart, newSize);
			return "product/cart";
		}else{
			return null;
		}
	}
}
