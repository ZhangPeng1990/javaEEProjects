package tushu.produc.service;

import java.util.List;

import tushu.business.product.object.ExpressMessage;

public interface ExpressMessageService {

	public ExpressMessage getById(Integer id);
	
	public List<ExpressMessage> getAll();
	
	public ExpressMessage addExpressMessage(ExpressMessage expressMessage);
	
	public void deleteById(Integer id);
}
