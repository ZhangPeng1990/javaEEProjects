package tushu.user.controller;

import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import tushu.business.product.object.AddressMessage;
import tushu.business.product.object.ExpressMessage;
import tushu.business.product.object.Images;
import tushu.business.product.object.OrderForm;
import tushu.business.user.object.Inform;
import tushu.business.user.object.User;
import tushu.constans.Constans;
import tushu.enums.OrderType;
import tushu.enums.UserOperation;
import tushu.produc.service.AddressMessageService;
import tushu.produc.service.ExpressMessageService;
import tushu.produc.service.OrderFormService;
import tushu.user.service.InformService;
import tushu.user.service.UserService;
import tushu.utils.FileTools;

@Controller
@RequestMapping("/user")
public class UserController extends BaseController {
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private InformService informService;
	
	@Autowired
	private OrderFormService orderFormService;
	
	@Autowired
	private AddressMessageService addressMessageService;
	
	@Autowired
	private ExpressMessageService expressMessageService;
	
	String operation = "";
	
	@RequestMapping("informs/{userId}")
	public String listInforms(@PathVariable("userId") int userId, ModelMap mm){
		User user = userService.getUserById(userId);
		List<Inform> list = informService.getByUser(user);
		int informNum = list != null ? list.size() : 0;
		mm.put("list", list);
		mm.put("informNum", informNum);
		
		operation = UserOperation.INFORMS.toString();
		mm.addAttribute("operation", operation);
		return "user/informs";
	}
	
	@RequestMapping("address/{userId}")
	public String listAddress(@PathVariable("userId") int userId, ModelMap mm){
		User user = userService.getUserById(userId);
		
		List<AddressMessage> list = this.addressMessageService.getByUser(user);
		mm.addAttribute("list", list);
		
		operation = UserOperation.ADDRESS.toString();
		mm.addAttribute("operation", operation);
		return "user/address";
	}
	
	@ResponseBody
	@RequestMapping("address/{userId}/addAddress")
	public String addAddress(@PathVariable("userId") int userId, ModelMap mm, AddressForm form){
		String state = "";
		User user = userService.getUserById(userId);
		if(user != null){
			AddressMessage am = new AddressMessage();
			am.setUserId(new Long(userId));
			am.setRecipientsName(form.getName());
			am.setProvince(form.getProvince_id());
			am.setCity(form.getCity_id());
			am.setCounty(form.getCounty_id());
			am.setStreet(form.getAddress());
			am.setPhone(form.getMobiel());
			am.setTel(form.getTel());
			am.setEmail(form.getEmail());
			am.setPostCode(form.getCode());
			this.addressMessageService.addAddressMessage(am);
			state = "200";
		}
		return state;
	}
	
	@RequestMapping("deleteInform/{userId}/{informId}")
	public String deleteInform(@PathVariable("informId") int informId, @PathVariable("userId") int userId, ModelMap mm, HttpServletRequest request){
		informService.deleteInform(informId);
		String url = "/user/informs/" + userId + ".html";
		
		User user = (User) request.getSession().getAttribute(Constans.SESSION_USER_ATTR_NAME);
		request.getSession().setAttribute(Constans.Inform_Num, informService.getByUser(user).size());
		
		return "redirect:" + url;
	}
	
	@RequestMapping("deleteAddress/{userId}/{addressId}")
	public String deleteAddress(@PathVariable("addressId") int addressId, @PathVariable("userId") int userId, ModelMap mm, HttpServletRequest request){
		this.addressMessageService.deleteById(addressId);
		String url = "/user/address/" + userId + ".html";
		return "redirect:" + url;
	}
	
	@RequestMapping("{userId}/cart")
	public String cart(@PathVariable("userId") int userId, ModelMap mm, HttpServletRequest request){
		List<OrderForm> list = orderFormService.getOrders(userService.getUserById(userId), OrderType.SHOPPING_CART);
		mm.addAttribute("list", list);
		double totalAmount = 0;
		for(OrderForm of : list){
			totalAmount += of.getAmountPayable();
		}
		mm.addAttribute("totalAmount", totalAmount);
		return "product/cart";
	}
	
	@RequestMapping("{userId}/order")
	public String order(@PathVariable("userId") int userId, ModelMap mm, HttpServletRequest request){
		List<OrderForm> list = orderFormService.getOrders(userService.getUserById(userId), OrderType.ACCOUNT_PAID, OrderType.NON_PAYMENT);
		mm.addAttribute("list", list);
		operation = UserOperation.ORDER.toString();
		mm.addAttribute("operation", operation);
		return "product/order";
	}
	
	@RequestMapping("{userId}/createOrder")
	public String createOrder(@PathVariable("userId") int userId, ModelMap mm, HttpServletRequest request, PayForm form){
		User user = (User) request.getSession().getAttribute(Constans.SESSION_USER_ATTR_NAME);
		String ids = form.getPay_ids();
		mm.addAttribute("pay_ids", ids);
		String[] tempIds = null;
		if(ids != null){
			tempIds = ids.split(",");
		}
		Long[] payId = null;
		if(tempIds != null && tempIds.length > 0){
			payId = new Long[tempIds.length];
			for(int i = 0; i < tempIds.length; i++){
				payId[i] = new Long(tempIds[i]);
			}
		}
		double totalPayNum = 0;
		List<OrderForm> orders = null;
		if(payId != null && payId.length > 0){
			orders = new ArrayList<OrderForm>();
			for(Long id : payId){
				OrderForm of = orderFormService.getById(id);
				orders.add(of);
				totalPayNum += (of.getProduct().getSellPrice() * of.getProductNumber());
			}
		}
		user = this.userService.getUserById(Integer.parseInt(user.getId().toString()));
		System.out.println("付款人：" + user.getUserName());
		System.out.println("应付款金额：" + totalPayNum);
		
		List<AddressMessage> addresses = user.getAddresses();
		AddressMessage address = null;
		if(addresses != null && addresses.size() > 0){
			address = addresses.get(0);//现在没有默认地址功能，所以以第一个地址为默认地址，后边再完善
		}
		mm.addAttribute("addresses", addresses);
		mm.addAttribute("address", address);
		
		List<ExpressMessage> expressMessages = expressMessageService.getAll();
		mm.addAttribute("expressMessages", expressMessages);
		return "product/create_order";
	}
	
	@RequestMapping("{userId}/createOrderSuccess")
	public String createOrderSuccess(@PathVariable("userId") int userId, ModelMap mm, HttpServletRequest request, PayForm form){
		double shouldPayMoney = 0.0;
		
		String[] ids = form.getPay_ids().split(",");
		if(ids != null && ids.length > 0){
			for(String sid : ids){
				Long id = new Long(sid);
				OrderForm of = this.orderFormService.getById(id);
				shouldPayMoney += of.getAmountPayable();
				this.orderFormService.updateOrderType(id, OrderType.NON_PAYMENT);
			}
		}
		
		Integer id = form.getPosts();
		ExpressMessage em = expressMessageService.getById(id);
		shouldPayMoney = shouldPayMoney + em.getExpressPrice();
		mm.addAttribute("shouldPayMoney", shouldPayMoney);
		//刷新购物车
		List<OrderForm> list = orderFormService.getOrders(userService.getUserById(userId), OrderType.SHOPPING_CART);
		request.getSession().setAttribute(Constans.Shoping_Cart, list);
		
		return "product/create_order_success";
	}
	
	@RequestMapping("pic/{userId}")
	public String picManage(@PathVariable("userId") int userId, ModelMap mm, HttpServletRequest request){
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute(Constans.SESSION_USER_ATTR_NAME);
		
		String userPicFolderPath = "";
		
		if(user != null && (user.getId().intValue() == userId)){
			operation = UserOperation.PICTURE.toString();
			mm.addAttribute("operation", operation);
			userPicFolderPath = this.getUserPath(request, userId);
			FileTools.createFolder(userPicFolderPath);
			
			File file = new File(userPicFolderPath);
			File[] files = file.listFiles();
			List<Images> images = null;
			if(files != null && files.length > 0){
				images = new ArrayList<Images>();
				for(File f : files){
					Images image = new Images();
					image.setName(f.getName());
					image.setUrl(request.getContextPath() + "/" + Constans.User_Pic_Path + userId + "/" + image.getName());
					images.add(image);
				}
			}
			mm.addAttribute("images", images);
			return "user/picManage";
		}else{
			return "forbid";
		}
		
	}
	
	private String getUserPath(HttpServletRequest request, int userId){
		String userPicFolderPath = "";
		HttpSession session = request.getSession();
		String webPath = session.getServletContext().getRealPath("/");
		userPicFolderPath = webPath + Constans.User_Pic_Path + userId;
		return userPicFolderPath;
	}
	
	@RequestMapping(value="{userId}/uploadFile", method = RequestMethod.POST)
    @ResponseBody
	public String uploadFile(HttpServletRequest request, HttpServletResponse response, @PathVariable("userId") int userId) throws UnsupportedEncodingException{
    	String responseStr="";
        MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;    
        Map<String, MultipartFile> fileMap = multipartRequest.getFileMap();
        String ctxPath = this.getUserPath(multipartRequest, userId);
        //创建文件夹  
        File file = new File(ctxPath);    
        if (!file.exists()) {    
            file.mkdirs();    
        }    
        String fileName = null;
        for (Map.Entry<String, MultipartFile> entity : fileMap.entrySet()) {
            // 上传文件名    
            MultipartFile mf = entity.getValue();
            fileName = URLDecoder.decode(mf.getOriginalFilename(), "UTF-8");
            
            File uploadFile = new File(ctxPath + File.separator + fileName);    
            try {  
                FileCopyUtils.copy(mf.getBytes(), uploadFile); 
                responseStr="上传成功";
        } catch (IOException e) {
            responseStr="上传失败";  
            e.printStackTrace();
        }    
        }   
        System.out.println(responseStr);
        return responseStr; 
	}
}
