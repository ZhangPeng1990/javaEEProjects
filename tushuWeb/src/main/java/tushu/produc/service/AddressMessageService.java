package tushu.produc.service;

import java.util.List;

import tushu.business.product.object.AddressMessage;
import tushu.business.product.object.OrderForm;
import tushu.business.user.object.User;

public interface AddressMessageService {

	public List<AddressMessage> getByUser(User user);
	
	public AddressMessage getByOrder(OrderForm order);
	
	public AddressMessage getById(Integer id);
	
	public void addAddressMessage(AddressMessage addressMessage);
	
	public void deleteById(Integer id);
}
