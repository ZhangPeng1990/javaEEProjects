package tushu.user.service.impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import tushu.business.user.object.Inform;
import tushu.business.user.object.User;
import tushu.model.InformDO;
import tushu.user.mapper.InformDOMapper;
import tushu.user.service.InformService;
import tushu.user.service.UserService;



@Service("informService")
public class InformServiceImpl implements InformService {

	@Autowired
	private UserService userService;
	
	@Autowired
	private InformDOMapper informDOMapper;
	
	
	@Override
	public Inform addInform(Inform inform) {
		inform.setInsertTime(new Date());
		InformDO informDO = BeanCopyer.toInformDO(inform);
		informDOMapper.insert(informDO);
		inform = BeanCopyer.toInform(informDO);
		return inform;
	}
	
	@Override
	public Inform getInform(Integer id) {
		Inform inform = null;
		InformDO informDO = informDOMapper.selectByPrimaryKey(id);
		if(informDO != null){
			inform = BeanCopyer.toInform(informDO);
			inform.setUser(userService.getUserById(Integer.parseInt(informDO.getUserId().toString())));
			inform.setSender(userService.getUserById(Integer.parseInt(informDO.getSenderId().toString())));
		}
		return inform;
	}
	
	@Override
	public Inform deleteByUser(User user) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Inform> getByUser(User user) {
		List<InformDO> list = this.informDOMapper.selectByUserDO(Integer.parseInt(user.getId().toString()));
		List<Inform> informs = new ArrayList<Inform>();
		if(list != null){
			for(InformDO i : list){
				Inform inform = BeanCopyer.toInform(i);
				inform.setUser(userService.getUserById(Integer.parseInt(i.getUserId().toString())));
				inform.setSender(userService.getUserById(Integer.parseInt(i.getSenderId().toString())));
				informs.add(inform);
			}
		}
		return informs;
	}
	
	@Override
	public void deleteInform(Integer id){
		informDOMapper.deleteByPrimaryKey(id);
	}

}
