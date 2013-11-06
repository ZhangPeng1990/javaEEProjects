package tushu.business.product.object;

import tushu.enums.TemplateType;

public class Template {

	private Integer id;
	
	private String name;
	
	private String li_Class;
	
	private String a_Class;
	
	private TemplateType type;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getLi_Class() {
		return li_Class;
	}

	public void setLi_Class(String li_Class) {
		this.li_Class = li_Class;
	}

	public String getA_Class() {
		return a_Class;
	}

	public void setA_Class(String a_Class) {
		this.a_Class = a_Class;
	}

	public TemplateType getType() {
		return type;
	}

	public void setType(TemplateType type) {
		this.type = type;
	}
}
