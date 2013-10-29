package tushu.produc.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import tushu.business.product.object.Images;
import tushu.model.ImagesDO;
import tushu.produc.service.ImagesService;
import tushu.product.mapper.ImagesDOMapper;

@Service("imagesService")
public class ImagesServiceImpl implements ImagesService {

	@Autowired
	private ImagesDOMapper imagesDOMapper;
	
	@Override
	public Images getImages(Integer id) {
		Images images = null;
		ImagesDO imagesDO = this.imagesDOMapper.selectByPrimaryKey(id);
		if(imagesDO != null){
			images = BeanCopyer.toImage(imagesDO);
		}
		return images;
	}

	public Images addImages(Images images){
		ImagesDO imagesDO = BeanCopyer.toImagesDO(images);
		imagesDOMapper.insert(imagesDO);
		images.setId(imagesDO.getId());
		return images;
	}
	
	public boolean deleteByUrl(String url){
		int i = this.imagesDOMapper.deleteByUrl(url);
		if(i > 0){
			return true;
		}
		return false;
	}
}
