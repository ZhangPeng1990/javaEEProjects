package tushu.produc.service;

import java.util.List;

import tushu.business.product.object.OrderForm;
import tushu.business.product.object.Work;
import tushu.business.user.object.User;
import tushu.enums.OrderProgress;
import tushu.enums.OrderType;

public interface OrderFormService {

	public List<OrderForm> getOrders(User user, OrderType ...type);
	
	public List<OrderForm> addOrders(User user, OrderType type, Work work);
	
	public List<OrderForm> deleteOrder(User user, OrderForm orderForm, OrderType type);
	
	public List<OrderForm> updateOrder(User user, OrderForm orderForm, OrderType type);
	
	public void deleteOrderForm(Long id);
	
	public OrderForm getById(Long id);
	
	public void updateOrderType(Long id, OrderType type);
	
	public void updateOrderProgress(Long id, OrderProgress progress);
}
