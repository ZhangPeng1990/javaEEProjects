package tushu.admin.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import tushu.business.product.object.Template;
import tushu.produc.service.TemplateService;

@Controller
@RequestMapping("/temp")
public class TemplateController {

	@Autowired
	private TemplateService templateService;
	
	@RequestMapping("/skipAdd")
	public String addNew(){
		return "admin/addTemplate";
	}
	
	@RequestMapping("/add")
	public String add(Template t){
		templateService.addTemplate(t);
		return "redirect:skipAdd.html";
	}
}
