package tushu.business.product.object;

import java.util.Date;

import tushu.business.user.object.User;
import tushu.enums.OrderType;

public class OrderForm {

	private Long id;

    private String orderNumber;//订单编号

    private User user;

    private Product product;

    private Work work;
    
    private Date createTime;

    private Date paymentTime;

    private OrderType orderType;

    private Integer productNumber;//数量--->同一个商品买了几件

    private Double amountPayable;
    
    private AddressMessage address;
    
    private ExpressMessage expressMessage;
    
	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getOrderNumber() {
		return orderNumber;
	}

	public void setOrderNumber(String orderNumber) {
		this.orderNumber = orderNumber;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public Product getProduct() {
		return product;
	}

	public void setProduct(Product product) {
		this.product = product;
	}

	public Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	public Date getPaymentTime() {
		return paymentTime;
	}

	public void setPaymentTime(Date paymentTime) {
		this.paymentTime = paymentTime;
	}

	public OrderType getOrderType() {
		return orderType;
	}

	public void setOrderType(OrderType orderType) {
		this.orderType = orderType;
	}

	public Integer getProductNumber() {
		return productNumber;
	}

	public void setProductNumber(Integer productNumber) {
		this.productNumber = productNumber;
	}

	public Double getAmountPayable() {
		return amountPayable;
	}

	public void setAmountPayable(Double amountPayable) {
		if(this.product != null){
			this.amountPayable = this.product.getSellPrice() * this.productNumber;
			if(this.expressMessage != null){
				this.amountPayable += this.expressMessage.getExpressPrice();
			}
		}else{
			this.amountPayable = amountPayable;
		}
	}

	public AddressMessage getAddress() {
		return address;
	}

	public void setAddress(AddressMessage address) {
		this.address = address;
	}

	public ExpressMessage getExpressMessage() {
		return expressMessage;
	}

	public void setExpressMessage(ExpressMessage expressMessage) {
		this.expressMessage = expressMessage;
	}

	public Work getWork() {
		return work;
	}

	public void setWork(Work work) {
		this.work = work;
	}
}
