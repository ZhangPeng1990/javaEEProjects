package tushu.produc.service;

import java.util.List;

import tushu.business.product.object.Work;
import tushu.business.user.object.User;

public interface WorkService {

	public Work add(Work work);
	
	public List<Work> getByUser(User user);
	
	public Work getById(Integer id);
	
	public void deleteById(Work work);
}
