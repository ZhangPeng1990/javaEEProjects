package tushu.produc.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import tushu.business.product.object.AddressMessage;
import tushu.business.product.object.OrderForm;
import tushu.business.user.object.User;
import tushu.model.AddressMessageDO;
import tushu.produc.service.AddressMessageService;
import tushu.product.mapper.AddressMessageDOMapper;

@Service("AddressMessageService")
public class AddressMessageServiceImpl implements AddressMessageService {

	@Autowired
	private AddressMessageDOMapper addressMessageDOMapper;
	
	@Override
	public List<AddressMessage> getByUser(User user) {
		List<AddressMessage> ams = new ArrayList<AddressMessage>();
		List<AddressMessageDO> amsdo = this.addressMessageDOMapper.getByUserId(user.getId());
		if(amsdo != null){
			for(AddressMessageDO dos : amsdo){
				AddressMessage am = BeanCopier.toAddressMessage(dos);
				ams.add(am);
			}
		}
		return ams;
	}

	@Override
	public AddressMessage getByOrder(OrderForm order) {
		AddressMessage am = null;
		AddressMessageDO dos = this.addressMessageDOMapper.getByOrderFormId(order.getId());
		if(dos != null){
			am = BeanCopier.toAddressMessage(dos);
		}
		return am;
	}

	@Override
	public AddressMessage getById(Integer id) {
		AddressMessage am = null;
		AddressMessageDO dos = this.addressMessageDOMapper.selectByPrimaryKey(id);
		if(dos != null){
			am = BeanCopier.toAddressMessage(dos);
		}
		return am;
	}

	@Override
	public void addAddressMessage(AddressMessage addressMessage) {
		AddressMessageDO dos = BeanCopier.toAddressMessageDO(addressMessage);
		this.addressMessageDOMapper.insert(dos);
	}

	@Override
	public void deleteById(Integer id) {
		this.addressMessageDOMapper.deleteByPrimaryKey(id);
	}

}
