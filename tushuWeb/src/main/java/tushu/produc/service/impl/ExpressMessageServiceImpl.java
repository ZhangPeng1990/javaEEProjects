package tushu.produc.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import tushu.business.product.object.ExpressMessage;
import tushu.model.ExpressMessageDO;
import tushu.produc.service.ExpressMessageService;
import tushu.product.mapper.ExpressMessageDOMapper;

@Service("expressMessageService")
public class ExpressMessageServiceImpl implements ExpressMessageService {

	@Autowired
	private ExpressMessageDOMapper expressMessageDOMapper;
	
	public ExpressMessage addExpressMessage(ExpressMessage expressMessage){
		ExpressMessageDO emdo = BeanCopier.toExpressMessageDO(expressMessage);
		int id = this.expressMessageDOMapper.insert(emdo);
		expressMessage.setId(id);
		return expressMessage;
	}
	
	public ExpressMessage getById(Integer id){
		ExpressMessage em = null;
		ExpressMessageDO emdo = this.expressMessageDOMapper.selectByPrimaryKey(id);
		if(emdo != null){
			em = BeanCopier.toExpressMessage(emdo);
		}
		return em;
	}
	
	public List<ExpressMessage> getAll(){
		List<ExpressMessage> list = null;
		List<ExpressMessageDO> listDO = this.expressMessageDOMapper.getAll();
		if(listDO != null && listDO.size() > 0){
			list = new ArrayList<ExpressMessage>();
			for(ExpressMessageDO emdo : listDO){
				ExpressMessage em = null;
				em = BeanCopier.toExpressMessage(emdo);
				list.add(em);
			}
		}
		return list;
	}
	
	public void deleteById(Integer id){
		this.expressMessageDOMapper.deleteByPrimaryKey(id);
	}
}
