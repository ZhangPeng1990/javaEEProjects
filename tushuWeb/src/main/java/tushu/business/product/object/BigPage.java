package tushu.business.product.object;

/**
 * 此业务对象不保存到数据库
 * 仅用于和前端页面交互使用
 * 一个BigPage包含两个Page对象，一左一右
 * @author zp
 *
 */
public class BigPage {

	private Integer index;
	
	private Page[] pages;
	private Page leftPage;
	private Page rightPage;
	
	public Integer getIndex() {
		return index;
	}
	public void setIndex(Integer index) {
		this.index = index;
	}
	public Page[] getPages() {
		return pages;
	}
	public void setPages(Page[] pages) {
		this.pages = pages;
	}
	public Page getLeftPage() {
		return leftPage;
	}
	public void setLeftPage(Page leftPage) {
		this.leftPage = leftPage;
	}
	public Page getRightPage() {
		return rightPage;
	}
	public void setRightPage(Page rightPage) {
		this.rightPage = rightPage;
	}
}
