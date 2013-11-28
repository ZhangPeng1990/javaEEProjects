package tushu.service;

import junit.base.BaseTest;

import org.apache.naming.factory.BeanFactory;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import tushu.business.product.object.SysConfig;
import tushu.enums.SysConfigKey;
import tushu.produc.service.SysConfigService;
import tushu.produc.service.impl.SysConfigServiceImpl;

//MBean
@Service("jmxSysConfigMBean")
public class JmxSysConfig extends BaseTest implements JmxSysConfigMBean{

	@Autowired
	private SysConfigService sysConfigService;
	
	private String userPath = "";
	
	public JmxSysConfig(){
		sysConfigService = new SysConfigServiceImpl();
	}
	
	public String getUserPath() {
		System.out.println("getUserPath");
		return sysConfigService.getSysConfig(SysConfigKey.User_Work_Save_Path).toString();
	}

	public void setUserPath(String userPath) {
		System.out.println("setUserPath");
		SysConfig sysConfig = sysConfigService.getSysConfig(SysConfigKey.User_Work_Save_Path);
		sysConfig.setConfigValue(userPath);
		sysConfigService.updateSysConfig(sysConfig);
		this.userPath = userPath;
		System.out.println(this.userPath);
	}

}
