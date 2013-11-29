package tushu.business.product.object;

import java.io.Serializable;
import java.util.List;

import tushu.enums.Types;

public class IndexShowType<E> implements Serializable {

	private static final long serialVersionUID = 5493547015721337479L;

	private Integer id;
	
	private String name;
	
	private String describe;
	
	private Types type;
	
	private Integer index;
	
	private List<E> objects;//存放商品或者活动 的集合

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

	public String getDescribe() {
		return describe;
	}

	public void setDescribe(String describe) {
		this.describe = describe;
	}

	public Types getType() {
		return type;
	}

	public void setType(Types type) {
		this.type = type;
	}

	public List<E> getObjects() {
		return objects;
	}

	public void setObjects(List<E> objects) {
		this.objects = objects;
	}

	public Integer getIndex() {
		return index;
	}

	public void setIndex(Integer index) {
		this.index = index;
	}
}
