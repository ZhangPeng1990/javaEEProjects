package tushu.produc.service.impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.Assert;

import tushu.business.product.object.OrderForm;
import tushu.business.product.object.Product;
import tushu.business.user.object.User;
import tushu.enums.OrderType;
import tushu.model.OrderFormDO;
import tushu.produc.service.AddressMessageService;
import tushu.produc.service.OrderFormService;
import tushu.produc.service.ProductService;
import tushu.product.mapper.OrderFormDOMapper;
import tushu.user.service.UserService;
import tushu.utils.GUID;

@Service("orderFormService")
public class OrderFormServiceImpl implements OrderFormService {

	@Autowired
	private OrderFormDOMapper orderFormDOMapper;
	
	@Autowired
	private ProductService productService;
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private AddressMessageService addressMessageService;
	
	@Override
	public List<OrderForm> getOrders(User user, OrderType ...type) {
		Assert.notNull(user);
		List<OrderForm> lists = new ArrayList<OrderForm>();
		String shopping_cart = null;
		String non_payment = null;
		String account_paid = null;
		
		OrderType[] params = type;
		if(params != null && params.length > 0){
			for(OrderType ot : params){
				if(ot.toString().equals(OrderType.ACCOUNT_PAID.toString())) shopping_cart = ot.toString();
				if(ot.toString().equals(OrderType.NON_PAYMENT.toString())) shopping_cart = ot.toString();
				if(ot.toString().equals(OrderType.SHOPPING_CART.toString())) shopping_cart = ot.toString();
			}
		}
		
		List<OrderFormDO> dos = orderFormDOMapper.getOrders(Integer.parseInt(user.getId().toString()), shopping_cart, non_payment, account_paid);
		if(dos != null && dos.size() > 0){
			for(OrderFormDO ofd : dos){
				OrderForm of = BeanCopyer.toOrderForm(ofd);
				of.setProduct(productService.getById(ofd.getProductId()));
				of.setUser(user);
				of.setAddress(addressMessageService.getByOrder(of));
				lists.add(of);
			}
		}
		return lists;
	}
	
	public List<OrderForm> addOrders(User user, OrderType type, Product product){
		
		if(type.toString().equals(OrderType.SHOPPING_CART.toString())){
			OrderFormDO ofdo = this.orderFormDOMapper.getOrder(Integer.parseInt(user.getId().toString()), type.toString(), product.getProductId());
			if(ofdo != null){
				ofdo.setProductNumber(ofdo.getProductNumber() + 1);
				ofdo.setAmountPayable(product.getSellPrice() * ofdo.getProductNumber());
				this.orderFormDOMapper.updateByPrimaryKey(ofdo);
			}else{
				OrderForm of = new OrderForm();
				of.setUser(user);
				of.setProduct(product);
				of.setOrderType(type);
				of.setProductNumber(1);
				of.setAmountPayable(product.getSellPrice());
				of.setCreateTime(new Date());
				if(type.toString().equals(OrderType.ACCOUNT_PAID.toString())){
					of.setPaymentTime(new Date());
				}
				of.setOrderNumber(GUID.generatorGUID());
				
				OrderFormDO ofd = BeanCopyer.toOrderFormDO(of);
				this.orderFormDOMapper.insert(ofd);
			}
		}else{
			OrderForm of = new OrderForm();
			of.setUser(user);
			of.setProduct(product);
			of.setOrderType(type);
			of.setProductNumber(1);
			of.setAmountPayable(product.getSellPrice());
			of.setCreateTime(new Date());
			if(type.toString().equals(OrderType.ACCOUNT_PAID.toString())){
				of.setPaymentTime(new Date());
			}
			of.setOrderNumber(GUID.generatorGUID());
			
			OrderFormDO ofd = BeanCopyer.toOrderFormDO(of);
			this.orderFormDOMapper.insert(ofd);
		}
		return this.getOrders(user, type);
	}
	
	public List<OrderForm> deleteOrder(User user, OrderForm orderForm, OrderType type){
		this.orderFormDOMapper.deleteByPrimaryKey(orderForm.getId());
		return this.getOrders(user, type);
	}

	public List<OrderForm> updateOrder(User user, OrderForm orderForm, OrderType type){
		OrderFormDO ofdo = BeanCopyer.toOrderFormDO(orderForm);
		orderFormDOMapper.updateByPrimaryKey(ofdo);
		return this.getOrders(user, type);
	}
	
	public void deleteOrderForm(Long id){
		orderFormDOMapper.deleteByPrimaryKey(id);
	}
	
	public OrderForm getById(Long id){
		OrderForm of = null;
		OrderFormDO ofdo = this.orderFormDOMapper.selectByPrimaryKey(id);
		if(ofdo != null){
			of = BeanCopyer.toOrderForm(ofdo);
			of.setProduct(this.productService.getById(ofdo.getProductId()));
			of.setUser(this.userService.getUserById(ofdo.getUserId()));
		}
		return of;
	}
	
	public void updateOrderType(Long id, OrderType type){
		this.orderFormDOMapper.updateOrderType(id, type.toString());
	}
}
