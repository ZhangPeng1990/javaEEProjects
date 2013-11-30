package tushu.user.controller;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.MalformedURLException;
import java.net.URLDecoder;
import java.util.ArrayList;
import java.util.Date;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;
import java.util.UUID;

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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import tushu.business.product.object.AddressMessage;
import tushu.business.product.object.BigPage;
import tushu.business.product.object.ExpressMessage;
import tushu.business.product.object.Images;
import tushu.business.product.object.OrderForm;
import tushu.business.product.object.Page;
import tushu.business.product.object.Product;
import tushu.business.product.object.Template;
import tushu.business.product.object.Work;
import tushu.business.user.object.Inform;
import tushu.business.user.object.User;
import tushu.constans.Constans;
import tushu.enums.BookEditType;
import tushu.enums.OrderType;
import tushu.enums.PageType;
import tushu.enums.SysConfigKey;
import tushu.enums.UserOperation;
import tushu.produc.service.AddressMessageService;
import tushu.produc.service.ExpressMessageService;
import tushu.produc.service.ImagesService;
import tushu.produc.service.OrderFormService;
import tushu.produc.service.ProductService;
import tushu.produc.service.SysConfigService;
import tushu.produc.service.TemplateService;
import tushu.produc.service.WorkService;
import tushu.user.service.InformService;
import tushu.user.service.UserService;
import tushu.utils.FileTools;
import tushu.utils.GlobalUtils;
import tushu.utils.JpegTool;
import tushu.utils.JpegToolException;
import tushu.utils.ReNmaeUtils;

@Controller
@RequestMapping("/user")
public class UserController extends BaseController {
	
	private final static String CRLF = System.getProperty("line.separator");
	
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
	
	@Autowired
	private ImagesService imagesService;
	
	@Autowired
	private SysConfigService sysConfigService;
	
	@Autowired
	private ProductService productService;
	
	@Autowired
	private WorkService workService;
	
	@Autowired
	private TemplateService templateService;
	
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
	
	@RequestMapping("listWorks/{userId}")
	public String listWorks(@PathVariable("userId") int userId, ModelMap mm){
		User user = userService.getUserById(userId);
		
		List<Work> works = workService.getByUser(user);
		mm.put("works", works);
		
		operation = UserOperation.WORKS.toString();
		mm.addAttribute("operation", operation);
		return "user/my_work";
	}
	
	@RequestMapping("deleteWork/{workId}")
	public String deleteWork(@PathVariable("workId") int workId, ModelMap mm, HttpServletRequest request){
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute(Constans.SESSION_USER_ATTR_NAME);
		
		Work work = workService.getById(workId);
		String txtPath = sysConfigService.getSysConfig(SysConfigKey.User_Work_Save_Path).getConfigValue() + work.getContentPath();
		
		File file = new File(txtPath);
		if(file.exists()){
			file.delete();
		}
		
		this.workService.deleteById(work);
		
		String url = "/user/listWorks/" + user.getId() + ".html";
		return "redirect:" + url;
	}
	
	@SuppressWarnings("unchecked")
	@RequestMapping("editWork/{workId}")
	public String editWork(@PathVariable("workId") int workId, ModelMap mm, HttpServletRequest request){
		Work work = this.workService.getById(workId);
		Product product = work.getProduct();
		mm.addAttribute("product", product);
		mm.addAttribute("work", work);
		
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
			
			//模板集合
			List<Template> templates = (List<Template>) session.getAttribute(Constans.template_Path);
			if(templates == null || templates.size() < 1){
				templates = templateService.getAll();
			}
			mm.addAttribute("templates", templates);
			session.setAttribute(Constans.template_Path, templates);
			
			//页面
			List<Page> pages = new LinkedList<Page>();
			List<BigPage> showPages = new LinkedList<BigPage>();
			int totalPage = product.getPages();
			int temp = 1;
			for(int i = 0; i < totalPage; i++){
				Page page = new Page();
				page.setPageNum(i + 1);
				if(i % 2 == 0){
					page.setPageType(PageType.LEFT);
				}else{
					page.setPageType(PageType.RIGHT);
				}
				pages.add(page);
				if(i < totalPage - 1 && pages.size() == 2){
					BigPage bigPage = new BigPage();
					bigPage.setIndex(temp);
					Page[] spages = new Page[2];
					spages = (Page[]) pages.toArray(spages);
					bigPage.setPages(spages);
					bigPage.setLeftPage(spages[0]);
					bigPage.setRightPage(spages[1]);
					pages.clear();
					temp++;
					showPages.add(bigPage);
				}else if(i == totalPage - 1 && pages.size() == 1){
					BigPage bigPage = new BigPage();
					bigPage.setIndex(temp);
					Page[] spages = new Page[1]; 
					spages = (Page[]) pages.toArray(spages);
					bigPage.setPages(spages);
					bigPage.setLeftPage(spages[0]);
					pages.clear();
					showPages.add(bigPage);
				}else if(i == totalPage - 1 && pages.size() == 2){
					BigPage bigPage = new BigPage();
					bigPage.setIndex(temp);
					Page[] spages = new Page[2]; 
					spages = (Page[]) pages.toArray(spages);
					bigPage.setPages(spages);
					bigPage.setLeftPage(spages[0]);
					bigPage.setRightPage(spages[1]);
					pages.clear();
					showPages.add(bigPage);
				}
			}
			mm.addAttribute("pages", showPages);
			
			mm.addAttribute("bookEditType", BookEditType.Edit_Existing);
			String content = null;
			File txtFile = new File(sysConfigService.getSysConfig(SysConfigKey.User_Work_Save_Path).getConfigValue() + work.getContentPath());
			content = FileTools.readTxt(txtFile);
			mm.addAttribute("content", content);
		}
		
		return "product/photoBookEditer";
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
		
		Integer emid = form.getPosts();
		String orderNum = "";
		ExpressMessage em = expressMessageService.getById(emid);
		String[] ids = form.getPay_ids().split(",");
		if(ids != null && ids.length > 0){
			for(String sid : ids){
				Long id = new Long(sid);
				OrderForm of = this.orderFormService.getById(id);
				orderNum = of.getOrderNumber();
				of.setExpressMessage(em);
				shouldPayMoney += of.getAmountPayable();
				this.orderFormService.updateOrderType(id, OrderType.NON_PAYMENT);
			}
		}
		
		shouldPayMoney = shouldPayMoney + em.getExpressPrice();
		mm.addAttribute("shouldPayMoney", shouldPayMoney);
		mm.addAttribute("orderNum", orderNum);
		//刷新购物车
		List<OrderForm> list = orderFormService.getOrders(userService.getUserById(userId), OrderType.SHOPPING_CART);
		request.getSession().setAttribute(Constans.Shoping_Cart, list != null ? list.size() : 0);
		
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
        String tempCtxPath = ctxPath + "\\temp";
        //创建文件夹  
        File file = new File(ctxPath);    
        File tempFile = new File(tempCtxPath);
        if (!file.exists()) {    
            file.mkdirs();    
        }    
        
        if (!tempFile.exists()) {    
        	tempFile.mkdirs();    
        } 
        
        String fileName = null;
        for (Map.Entry<String, MultipartFile> entity : fileMap.entrySet()) {
            // 上传文件名    
            MultipartFile mf = entity.getValue();
            fileName = URLDecoder.decode(mf.getOriginalFilename(), "UTF-8");
            String newName = ReNmaeUtils.reName(fileName);
            String tempName = ReNmaeUtils.getNewName(newName, "-temp");
            
            File uploadFile = new File(ctxPath + File.separator + newName);    
            try {  
                FileCopyUtils.copy(mf.getBytes(), uploadFile);
                Images image = new Images();
                image.setName(newName);
                image.setIndex(0);
                image.setUrl("/" + Constans.User_Pic_Path + userId + "/" + newName);
                this.imagesService.addImages(image);
                //生成缩略图
                JpegTool j = new JpegTool();
        		try {
        			j.SetScale(0.7);
        			j.SetSmallHeight(70);
        			j.SetSmallWidth(70);
        			j.doFinal(ctxPath + File.separator + newName,tempCtxPath + File.separator + tempName);
        		} catch (JpegToolException e) {
        			// TODO Auto-generated catch block
        			e.printStackTrace();
        		}finally{
        			j = null;
        		}
        		
                responseStr="上传成功";
        } catch (IOException e) {
            responseStr="上传失败";  
            e.printStackTrace();
        }    
        }   
        System.out.println(responseStr);
        return responseStr; 
	}
	
	@RequestMapping(value="{userId}/addWork", method = RequestMethod.POST)
    @ResponseBody
    public String addWork(HttpServletRequest request, HttpServletResponse response, 
    		@PathVariable("userId") int userId, @RequestParam("htmlContent") String htmlContent, 
    		@RequestParam("productId") int productId, @RequestParam("type") String type, @RequestParam("workId") Integer workId){
		
		Work work = null;
		System.out.println(htmlContent);
		String bdPath = weiteToService(htmlContent);
		if(type.equals(BookEditType.ADD_New.toString())){
			work = new Work();
			work.setContentPath(bdPath);
			work.setUser((User)request.getSession().getAttribute(Constans.SESSION_USER_ATTR_NAME));
			work.setProduct(productService.getById(productId));
			workService.add(work);
		}else if(type.equals(BookEditType.Edit_Existing.toString())){
			work = this.workService.getById(workId);
			String oldPath = sysConfigService.getSysConfig(SysConfigKey.User_Work_Save_Path).getConfigValue() + work.getContentPath();
			File file = new File(oldPath);
			if(file.exists()){
				file.delete();
			}
			work.setContentPath(bdPath);
			workService.updateWork(work);
		}
		
		return "SUCCESS";
	}
	
	private String weiteToService(String content){
		BufferedWriter out = null;
		String newdbFilename = null;
		try {
			String newFilename = UUID.randomUUID().toString().replace("-", "") + ".txt";
			String datedir = GlobalUtils.dateDir(new Date());
			String newfilePath = sysConfigService.getSysConfig(SysConfigKey.User_Work_Save_Path).getConfigValue() + datedir;
			if (!new File(newfilePath).exists())
			{
				new File(newfilePath).mkdirs();
			}
			String newFullFilepath = newfilePath + newFilename;
			newdbFilename = datedir + newFilename;
			
			out = new BufferedWriter(new FileWriter(newFullFilepath));
			System.out.println(content);
			out.write(content);
		} catch (MalformedURLException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} finally{
			try {
				if(out != null){
					out.close();
				}
			} catch (IOException e) {
				e.printStackTrace();
			}
			
		}
		return newdbFilename;
	}
}
