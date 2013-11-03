package tushu.produc.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import tushu.business.product.object.Template;
import tushu.model.TemplateDO;
import tushu.produc.service.TemplateService;
import tushu.product.mapper.TemplateDOMapper;

@Service("templateService")
public class TemplateServiceImpl implements TemplateService {

	@Autowired
	private TemplateDOMapper templateDOMapper;
	
	@Override
	public List<Template> getAll() {
		List<Template> list = null;
		List<TemplateDO> listDOS = this.templateDOMapper.getAll();
		if(listDOS != null){
			list = new ArrayList<Template>();
			for(TemplateDO tdo : listDOS){
				list.add(BeanCopyer.toTemplate(tdo));
			}
		}
		return list;
	}

	@Override
	public void addTemplate(Template template) {
		TemplateDO tdo = BeanCopyer.toTemplateDO(template);
		this.templateDOMapper.insert(tdo);
	}

}
