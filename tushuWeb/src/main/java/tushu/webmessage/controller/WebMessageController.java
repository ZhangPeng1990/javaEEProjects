package tushu.webmessage.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/webMessage")
public class WebMessageController {

	@RequestMapping("/aboutUs")
	public String aboutUs(ModelMap mm){
		return "webMessage/aboutUs";
	}
	
	@RequestMapping("/serviceTerms")
	public String serviceTerms(ModelMap mm){
		return "webMessage/serviceTerms";
	}
	
	@RequestMapping("/privacyPolicy")
	public String privacyPolicy(ModelMap mm){
		return "webMessage/privacyPolicy";
	}
}
