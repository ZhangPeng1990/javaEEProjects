package tushu.produc.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import tushu.business.product.object.SysConfig;
import tushu.enums.SysConfigKey;
import tushu.model.SysConfigDO;
import tushu.produc.service.SysConfigService;
import tushu.product.mapper.SysConfigDOMapper;

@Service("sysConfigService")
public class SysConfigServiceImpl implements SysConfigService {

	@Autowired
	private SysConfigDOMapper sysConfigDOMapper;
	
	@Override
	public SysConfig getSysConfig(SysConfigKey key) {
		SysConfig sysConfig = null;
		SysConfigDO sysConfigDO = this.sysConfigDOMapper.selectByConfigKey(key.toString());
		sysConfig = (sysConfigDO != null ? sysConfig = BeanCopier.toSysConfig(sysConfigDO) : null);
		return sysConfig;
	}

}
