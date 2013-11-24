package tushu.produc.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import tushu.business.product.object.Work;
import tushu.business.user.object.User;
import tushu.model.WorkDO;
import tushu.produc.service.ImagesService;
import tushu.produc.service.ProductService;
import tushu.produc.service.WorkService;
import tushu.product.mapper.WorkDOMapper;
import tushu.product.mapper.WorkRelationshipImageDOMapper;
import tushu.user.service.UserService;

@Service("workService")
public class WorkServiceImpl implements WorkService {

	@Autowired
	private WorkDOMapper workDOMapper;
	
	@Autowired
	private WorkRelationshipImageDOMapper wriMapper;
	
	@Autowired
	private ImagesService imagesService;
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private ProductService productService;
	
	@Override
	public Work add(Work work) {
		WorkDO workDO = BeanCopier.toWorkDO(work);
		this.workDOMapper.insert(workDO);
		work.setId(workDO.getId());
		return work;
	}

	@Override
	public List<Work> getByUser(User user) {
		List<Work> list = null;
		List<WorkDO> listDos = this.workDOMapper.getByUserId(user.getId());
		if(listDos != null && listDos.size() > 0){
			list = new ArrayList<Work>();
			for(WorkDO wd : listDos){
				Work w = BeanCopier.toWork(wd);
				w.setUser(this.userService.getUserById(Integer.parseInt(wd.getUserId().toString())));
				w.setProduct(this.productService.getById(wd.getProductId()));
				list.add(w);
			}
		}
		return list;
	}

	@Override
	public Work getById(Integer id) {
		Work work = null;
		WorkDO workDO = this.workDOMapper.selectByPrimaryKey(id);
		if(workDO != null){
			work = BeanCopier.toWork(workDO);
			work.setUser(this.userService.getUserById(Integer.parseInt(workDO.getUserId().toString())));
			work.setProduct(this.productService.getById(workDO.getProductId()));
		}
		return work;
	}

}
