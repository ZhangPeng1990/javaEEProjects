package tushu.user.service;

import java.util.List;

import tushu.business.user.object.Inform;
import tushu.business.user.object.User;

public interface InformService {

	public Inform addInform(Inform inform);
	
	public Inform deleteByUser(User user);
	
	public Inform getInform(Integer id);
	
	public List<Inform> getByUser(User user);
	
	public void deleteInform(Integer id);
}
