package tushu.user.service.impl;


import tushu.business.user.object.Inform;
import tushu.business.user.object.User;
import tushu.enums.UserType;
import tushu.model.InformDO;
import tushu.model.UserDO;


public class BeanCopyer {

	public static User toUser(UserDO userDO){
		User user = new User();
		user.setId(userDO.getId());
		user.setUserName(userDO.getUserName());
		user.setPassword(userDO.getPassword());
		user.setInsertTime(userDO.getInsertTime());
		user.setUpdateTime(userDO.getUpdateTime());
		user.setUserType(UserType.valueOf(userDO.getUserstate()));
		
		user.setNickname(userDO.getNickname());
		user.setRealName(userDO.getRealName());
		user.setSex(userDO.getSex());
		user.setBirthday(userDO.getBirthday());
		return user;
	}
	
	public static UserDO toUserDO(User user){
		UserDO userDO = new UserDO();
		userDO.setId(user.getId());
		userDO.setPassword(user.getPassword());
		userDO.setUserName(user.getUserName());
		userDO.setInsertTime(user.getInsertTime());
		userDO.setUpdateTime(user.getUpdateTime());
		userDO.setUserstate(user.getUserType() != null ? user.getUserType().toString() : null);
		
		userDO.setNickname(user.getNickname());
		userDO.setRealName(user.getRealName());
		userDO.setSex(user.getSex());
		userDO.setBirthday(user.getBirthday());
		userDO.setImageId(user.getIcon() != null ? user.getIcon().getId() : null);
		return userDO;
	}
	
	public static Inform toInform(InformDO informDO){
		Inform inform = new Inform();
		inform.setId(informDO.getId());
		inform.setContent(informDO.getContent());
		inform.setInsertTime(informDO.getInsertTime());
		inform.setTitle(informDO.getTitle());
		return inform;
	}
	
	public static InformDO toInformDO(Inform inform){
		InformDO informDO = new InformDO();
		informDO.setContent(inform.getContent());
		informDO.setId(inform.getId());
		informDO.setInsertTime(inform.getInsertTime());
		informDO.setSenderId(inform.getSender() != null ? inform.getSender().getId() : null);
		informDO.setTitle(inform.getTitle());
		informDO.setUserId(inform.getUser() != null ? inform.getUser().getId() : null);
		return informDO;
	}
	
}
