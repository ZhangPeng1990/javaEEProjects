package tushu.user.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.ResponseBody;

import tushu.business.user.object.User;
import tushu.produc.service.OrderFormService;
import tushu.user.service.InformService;
import tushu.user.service.UserService;
import tushu.constans.Constans;
import tushu.enums.OrderType;
import tushu.enums.UserType;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@Controller
@RequestMapping("/login")
public class LoginController extends BaseController {

	@Autowired
	private UserService userService;
	
	@Autowired
	private InformService informService;
	
	@Autowired
	private OrderFormService orderFormService;
	
	@RequestMapping("returnLogin")
	public String returnLogin(HttpServletRequest request){
		return "login/login";
	}
	
	@RequestMapping("loginOut")
	public String loginOut(HttpServletRequest request){
		request.getSession().removeAttribute(Constans.SESSION_USER_ATTR_NAME);
		return "redirect:returnLogin.html";
	}
	
	@RequestMapping("login")
	@ResponseBody
	public String login(@ModelAttribute("form") UserForm form, HttpServletRequest request, HttpServletResponse response)
	{
		User user = null;
		String state = "";
		
		try {
			user = this.userService.checkUser(form.getUsername(), form.getPassword());
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		if (user == null) {
			String message = "用户名或密码不正确";
			request.getSession().setAttribute("message", message);
			state = "403";
		}else{
			request.getSession().setAttribute(Constans.SESSION_USER_ATTR_NAME, user);
			request.getSession().removeAttribute("message");
			state = "200";
			if(user.getUserType().equals(UserType.ADMIN)){
				state = "admin";
			}
			
			request.getSession().setAttribute(Constans.Inform_Num, informService.getByUser(user).size());
			request.getSession().setAttribute(Constans.Shoping_Cart, orderFormService.getOrders(user, OrderType.SHOPPING_CART).size());
		}
		return state;
	}
	
	@RequestMapping("returnRegister")
	public String returnRegister(){
		return "login/register";
	}
	
	@RequestMapping("check_email")
	@ResponseBody
	public String checkUserName(@ModelAttribute("form") UserForm form, HttpServletRequest request, HttpServletResponse response)
	{
		String state = "";
		
		boolean canAdd = this.userService.canAdd(form.getUsername());
		
		if (canAdd) {
			state = "200";
		}else{
			state = "403";
		}
		return state;
	}
	
	@RequestMapping("register")
	@ResponseBody
	public String register(@ModelAttribute("form") UserForm form, HttpServletRequest request, HttpServletResponse response)
	{
		String state = "200";
		try {
			this.userService.addUser(form.getUsername(), form.getPassword());
		} catch (Exception e) {
			state = "403";
			e.printStackTrace();
		}
		return state;
	}

}
