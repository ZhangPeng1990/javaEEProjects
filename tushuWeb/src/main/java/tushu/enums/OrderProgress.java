package tushu.enums;


/**
 * 订单进度
 */
public enum OrderProgress {
	In_Printing("制作中"),
	Print_Complete("制作完成"),
	Sending("配送中"),
	Deal_Complete("交易完成");
	
	OrderProgress(String desc){
		
	}
	
	private String desc;

	public String getDesc() {
		return desc;
	}
}
