package tushu.business.product.object;

import java.util.List;

import tushu.enums.PageType;

public class Page {

	private Integer id;
	
	private Integer pageNum;
	
	private PageType pageType;//左页面或右页面
	
	private Template template;
	
	private Work work;
	
	private List<Images> images;
	
	private String[] des;

	/**
	 * get and set...
	 * @return
	 */
	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getPageNum() {
		return pageNum;
	}

	public void setPageNum(Integer pageNum) {
		this.pageNum = pageNum;
	}

	public PageType getPageType() {
		return pageType;
	}

	public void setPageType(PageType pageType) {
		this.pageType = pageType;
	}

	public Template getTemplate() {
		return template;
	}

	public void setTemplate(Template template) {
		this.template = template;
	}

	public Work getWork() {
		return work;
	}

	public void setWork(Work work) {
		this.work = work;
	}

	public List<Images> getImages() {
		return images;
	}

	public void setImages(List<Images> images) {
		this.images = images;
	}

	public String[] getDes() {
		return des;
	}

	public void setDes(String[] des) {
		this.des = des;
	}
}
