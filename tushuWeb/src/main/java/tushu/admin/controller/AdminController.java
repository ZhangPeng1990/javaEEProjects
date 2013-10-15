package tushu.admin.controller;

import java.util.ArrayList;
import java.util.LinkedList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import tushu.business.product.object.IndexShowType;
import tushu.business.product.object.Product;
import tushu.business.product.object.ProductType;
import tushu.business.user.object.User;
import tushu.constans.Constans;
import tushu.enums.AdminOperation;
import tushu.enums.UserType;
import tushu.produc.service.ImagesService;
import tushu.produc.service.IndexShowTypeService;
import tushu.produc.service.ProductService;
import tushu.produc.service.ProductTypeService;
import tushu.user.service.UserService;

@Controller
@RequestMapping("/admin")
public class AdminController {

	@Autowired
	private UserService userService;
	
	@Autowired
	private ImagesService imagesService;
	
	@Autowired
	private ProductService productService;
	
	@Autowired
	private ProductTypeService productTypeService;
	
	@Autowired
	private IndexShowTypeService indexShowTypeService;
	
	String operation = "";
	
	@RequestMapping("index")
	public String index(HttpServletRequest request){
		User user = (User) request.getSession().getAttribute(Constans.SESSION_USER_ATTR_NAME);
		if(user != null && user.getUserType().equals(UserType.ADMIN)){
			return "admin/admin";
		}else{
			return "forbid";
		}
	}
	
	@RequestMapping("users")
	public String users(HttpServletRequest request, ModelMap mm){
		//身份判断
		User loginUser = (User) request.getSession().getAttribute(Constans.SESSION_USER_ATTR_NAME);
		if(loginUser == null || !loginUser.getUserType().equals(UserType.ADMIN)){
			return "forbid";
		}
		//身份判断
		
		operation = AdminOperation.USER.toString();
		mm.addAttribute("operation", operation);
		List<User> users = userService.getAll();
		mm.addAttribute("users", users);
		return "admin/user_admin";
	}
	
	@RequestMapping("deluser/{id}")
	public String deluser(HttpServletRequest request, @PathVariable("id") Integer id, ModelMap mm){
		
		//身份判断
		User loginUser = (User) request.getSession().getAttribute(Constans.SESSION_USER_ATTR_NAME);
		if(loginUser == null || !loginUser.getUserType().equals(UserType.ADMIN)){
			return "forbid";
		}
		//身份判断
				
		operation = AdminOperation.USER.toString();
		mm.addAttribute("operation", operation);
		userService.delete(id);
		List<User> users = userService.getAll();
		mm.addAttribute("users", users);
		return "admin/user_admin";
	}
	
	@RequestMapping("productType")
	@SuppressWarnings("unchecked")
	public String product_Type(HttpServletRequest request, ModelMap mm){
		
		//身份判断
		User loginUser = (User) request.getSession().getAttribute(Constans.SESSION_USER_ATTR_NAME);
		if(loginUser == null || !loginUser.getUserType().equals(UserType.ADMIN)){
			return "forbid";
		}
		//身份判断
		operation = AdminOperation.WEB_HEAD.toString();
		mm.addAttribute("operation", operation);
		
		HttpSession session = request.getSession();
		LinkedList<ProductType> types = new LinkedList<ProductType>();
		if(session.getAttribute(Constans.Product_Type) != null){
			types = (LinkedList<ProductType>) session.getAttribute(Constans.Product_Type);
		}else{
			types = productTypeService.getRoot();
		}
		mm.addAttribute("types", types);
		
		return "admin/product_Type_admin";
	}
	
	@RequestMapping("indexType")
	@SuppressWarnings("unchecked")
	public String indexType(HttpServletRequest request, ModelMap mm){
		
		//身份判断
		User loginUser = (User) request.getSession().getAttribute(Constans.SESSION_USER_ATTR_NAME);
		if(loginUser == null || !loginUser.getUserType().equals(UserType.ADMIN)){
			return "forbid";
		}
		//身份判断
		operation = AdminOperation.INDEX_TYPE.toString();
		mm.addAttribute("operation", operation);
		
		HttpSession session = request.getSession();
		List<IndexShowType<Product>> showTypes = new ArrayList<IndexShowType<Product>>();
		if(session.getAttribute(Constans.Index_Show_Type) != null){
			showTypes = (List<IndexShowType<Product>>) session.getAttribute(Constans.Index_Show_Type);
		}else{
			showTypes = indexShowTypeService.getIndexShowTypes();
		}
		mm.addAttribute("types", showTypes);
		
		return "admin/index_Type_admin";
	}
	
	@RequestMapping("product")
	public String product(HttpServletRequest request, ModelMap mm){
		
		//身份判断
		User loginUser = (User) request.getSession().getAttribute(Constans.SESSION_USER_ATTR_NAME);
		if(loginUser == null || !loginUser.getUserType().equals(UserType.ADMIN)){
			return "forbid";
		}
		//身份判断
		operation = AdminOperation.PRODUCT.toString();
		mm.addAttribute("operation", operation);
		
		List<Product> list = productService.getAll();
		mm.addAttribute("list", list);
		
		return "admin/product_admin";
	}
}
