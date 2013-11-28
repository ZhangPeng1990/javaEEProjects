package tushu.produc.service;

import tushu.business.product.object.SysConfig;
import tushu.enums.SysConfigKey;

public interface SysConfigService {

	public SysConfig getSysConfig(SysConfigKey key);
	
	public SysConfig updateSysConfig(SysConfig key);
}
