package tushu.user.controller;

import java.util.LinkedList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;

import tushu.business.product.object.IndexShowType;
import tushu.business.product.object.Product;
import tushu.business.product.object.ProductType;
import tushu.constans.Constans;
import tushu.produc.service.IndexShowTypeService;
import tushu.produc.service.ProductTypeService;

@Controller
public class BaseController {

	@Autowired
	private ProductTypeService productTypeService;
	
	@Autowired
	private IndexShowTypeService indexShowTypeService;
	
	@ModelAttribute
	public void all(HttpServletRequest request){
		HttpSession session = request.getSession();
		
		if(session.getAttribute(Constans.Product_Type) == null){
			LinkedList<ProductType> types = productTypeService.getRoot();
			session.setAttribute(Constans.Product_Type, types);
		}
		
		if(session.getAttribute(Constans.Index_Show_Type) == null){
			List<IndexShowType<Product>> showTypes = indexShowTypeService.getIndexShowTypes();
			session.setAttribute(Constans.Index_Show_Type, showTypes);
		}
	}
}
