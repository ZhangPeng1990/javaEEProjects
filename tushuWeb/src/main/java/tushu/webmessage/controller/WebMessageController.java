package tushu.webmessage.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/webMessage")
public class WebMessageController {

	@RequestMapping("help")
	public String help(){
		return "index";
	}
}
