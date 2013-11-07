package tushu.produc.service;

import java.util.List;

import tushu.business.product.object.Page;
import tushu.business.product.object.Work;

public interface PageService {
	
	public Page addPage(Page page);
	
	public List<Page> getByWork(Work work);

}
