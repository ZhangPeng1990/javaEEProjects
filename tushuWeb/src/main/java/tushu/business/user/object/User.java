package tushu.business.user.object;

import java.util.Date;
import java.util.List;

import tushu.business.product.object.AddressMessage;
import tushu.business.product.object.Images;
import tushu.enums.UserType;

public class User {

	private Long id;

    private String userName;

    private String password;

    private Date insertTime;

    private Date updateTime;

    private UserType userType;
    
    private String nickname;
    
    private Images icon;
    
    private String realName;
    
    private String sex;
    
    private Date birthday;

    private List<AddressMessage> addresses;
    
	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public Date getInsertTime() {
		return insertTime;
	}

	public void setInsertTime(Date insertTime) {
		this.insertTime = insertTime;
	}

	public Date getUpdateTime() {
		return updateTime;
	}

	public void setUpdateTime(Date updateTime) {
		this.updateTime = updateTime;
	}

	
	public UserType getUserType() {
		return userType;
	}

	public void setUserType(UserType userType) {
		this.userType = userType;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public Images getIcon() {
		return icon;
	}

	public void setIcon(Images icon) {
		this.icon = icon;
	}

	public String getRealName() {
		return realName;
	}

	public void setRealName(String realName) {
		this.realName = realName;
	}

	public String getSex() {
		return sex;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}

	public Date getBirthday() {
		return birthday;
	}

	public void setBirthday(Date birthday) {
		this.birthday = birthday;
	}

	public List<AddressMessage> getAddresses() {
		return addresses;
	}

	public void setAddresses(List<AddressMessage> addresses) {
		this.addresses = addresses;
	}
}
