package tushu.produc.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import tushu.business.product.object.Page;
import tushu.business.product.object.Work;
import tushu.model.PageDO;
import tushu.produc.service.PageService;
import tushu.produc.service.TemplateService;
import tushu.produc.service.WorkService;
import tushu.product.mapper.PageDOMapper;

@Service("pageService")
public class PageServiceImpl implements PageService {

	@Autowired
	private PageDOMapper pageDOMapper;
	
	@Autowired
	private TemplateService templateService;
	
	@Autowired
	private WorkService workService;
	
	@Override
	public Page addPage(Page page) {
		PageDO pageDO = BeanCopier.toPageDO(page);
		this.pageDOMapper.insert(pageDO);
		page.setId(pageDO.getId());
		return page;
	}

	@Override
	public List<Page> getByWork(Work work) {
		List<PageDO> list = this.pageDOMapper.getByWorkId(work.getId());
		List<Page> pages = null;
		if(list != null && list.size() > 0){
			pages = new ArrayList<Page>();
			for(PageDO pageDO : list){
				Page page = BeanCopier.toPage(pageDO);
				page.setTemplate(this.templateService.getById(pageDO.getTemplateId()));
				page.setWork(work);
			}
		}
		return pages;
	}

}
