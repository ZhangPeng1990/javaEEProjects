package tushu.user.service.impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import tushu.business.product.object.AddressMessage;
import tushu.business.user.object.User;
import tushu.enums.UserType;
import tushu.model.UserDO;
import tushu.produc.service.AddressMessageService;
import tushu.produc.service.ImagesService;
import tushu.user.mapper.UserDOMapper;
import tushu.user.service.UserService;


@Service("userService")
public class UserServiceImpl implements UserService {

	@Autowired
	private UserDOMapper userMapper;
	
	@Autowired
	private ImagesService imagesService;
	
	@Autowired
	private AddressMessageService addressMessageService;

	public User getUserById(Integer id) {
		UserDO u = userMapper.selectByPrimaryKey(new Long(id));
		User user = null;
		if(u != null){
			user = BeanCopyer.toUser(u);
			user.setIcon(imagesService.getImages(u.getImageId()));
			List<AddressMessage> addresses = addressMessageService.getByUser(user);
			user.setAddresses(addresses);
		}
		return user;
	}
	
	public User checkUser(String userName, String passWord) throws Exception{
		User user = null;
		List<UserDO> users = this.userMapper.checkUserByNameAndPass(userName, passWord);
		if(users != null && users.size() == 1){
			user = BeanCopyer.toUser(users.get(0));
		}
		
		if(users.size() > 1){
			throw new Exception("多个用户异常");
		}
		
		return user;
	}
	
	public boolean canAdd(String userName){
		int num = this.userMapper.findByName(userName);
		
		if(num >= 1){
			return false;
		}else{
			return true;
		}
	}
	
	public User addUser(String userName, String passWord) throws Exception{
		
		if(!this.canAdd(userName)){
			throw new Exception("用户名已注册异常");
		}
		User user = new User();
		user.setInsertTime(new Date());
		user.setUpdateTime(new Date());
		user.setUserName(userName);
		user.setPassword(passWord);
		user.setUserType(UserType.CUSTOMER);
		
		UserDO userDO = BeanCopyer.toUserDO(user);
		userMapper.insert(userDO);
		user = BeanCopyer.toUser(userDO);
		return user;
	}
	
	public List<User> getAll(){
		List<User> list = new ArrayList<User>();
		List<UserDO> dos = this.userMapper.getAll();
		if(dos != null && dos.size() > 0){
			for(UserDO ud : dos){
				User u = BeanCopyer.toUser(ud);
				u.setIcon(imagesService.getImages(ud.getImageId()));
				List<AddressMessage> addresses = addressMessageService.getByUser(u);
				u.setAddresses(addresses);
				list.add(u);
			}
		}
		return list;
	}

	public void delete(Integer id){
		this.userMapper.deleteByPrimaryKey(new Long(id));
	}
}
