package tushu.produc.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import tushu.business.product.object.Images;
import tushu.business.product.object.Work;
import tushu.model.WorkDO;
import tushu.model.WorkRelationshipImageDO;
import tushu.produc.service.ImagesService;
import tushu.produc.service.WorkService;
import tushu.product.mapper.WorkDOMapper;
import tushu.product.mapper.WorkRelationshipImageDOMapper;

@Service("workService")
public class WorkServiceImpl implements WorkService {

	@Autowired
	private WorkDOMapper workDOMapper;
	
	@Autowired
	private WorkRelationshipImageDOMapper wriMapper;
	
	@Autowired
	private ImagesService imagesService;
	
	@Override
	public void add(Work work) {
		WorkDO workDO = BeanCopier.toWorkDO(work);
		this.workDOMapper.insert(workDO);
		
		List<Images> images = work.getImages();
		if(images != null && images.size() > 0){
			for(Images i : images){
				WorkRelationshipImageDO workRelationshipImageDO = new WorkRelationshipImageDO();
				workRelationshipImageDO.setImageId(i.getId());
				workRelationshipImageDO.setWorkId(workDO.getId());
				wriMapper.insert(workRelationshipImageDO);
			}
		}
	}

}
