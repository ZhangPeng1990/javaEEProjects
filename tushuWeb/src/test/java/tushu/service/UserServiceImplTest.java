package tushu.service;

import junit.base.BaseTest;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import tushu.business.user.object.User;
import tushu.user.service.UserService;

public class UserServiceImplTest extends BaseTest{

	
	private UserService userService;
	
	@Autowired
	public void setUserService(UserService userService) {
		this.userService = userService;
	}

	@Test
	public void testGetUserBuDyId() {
		User user = userService.getUserById(1);
		System.out.println(user.getUserName());
	}

}
