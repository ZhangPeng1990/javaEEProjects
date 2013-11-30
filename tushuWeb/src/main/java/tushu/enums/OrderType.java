package tushu.enums;

public enum OrderType {

	SHOPPING_CART("购物车"),//购物车
	NON_PAYMENT("等待付款"),//未付款
	ACCOUNT_PAID("已付款");//已付款
	
	OrderType(String desc){
		this.desc = desc;
	}
	private String desc;

	public String getDesc() {
		return desc;
	}
	
}
