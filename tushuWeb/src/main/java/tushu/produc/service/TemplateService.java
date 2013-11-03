package tushu.produc.service;

import java.util.List;

import tushu.business.product.object.Template;

public interface TemplateService {

	public List<Template> getAll();
	
	public void addTemplate(Template template);
}
