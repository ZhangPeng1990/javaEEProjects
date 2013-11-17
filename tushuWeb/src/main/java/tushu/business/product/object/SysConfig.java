package tushu.business.product.object;

import tushu.enums.SysConfigKey;


public class SysConfig {

	private Integer id;

    private SysConfigKey configKey;

    private String configValue;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public SysConfigKey getConfigKey() {
		return configKey;
	}

	public void setConfigKey(SysConfigKey configKey) {
		this.configKey = configKey;
	}

	public String getConfigValue() {
		return configValue;
	}

	public void setConfigValue(String configValue) {
		this.configValue = configValue;
	}
}
