package tushu.user.service;

import java.util.List;

import tushu.business.user.object.User;

public interface UserService {

	public User getUserById(Integer id);
	
	public User checkUser(String userName, String passWord) throws Exception;
	
	public User addUser(String userName, String passWord) throws Exception;
	
	public List<User> getAll();
	
	public boolean canAdd(String userName);
	
	public void delete(Integer id);
}
