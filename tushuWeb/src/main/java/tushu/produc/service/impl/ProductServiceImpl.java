package tushu.produc.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import tushu.business.product.object.Images;
import tushu.business.product.object.IndexShowType;
import tushu.business.product.object.Product;
import tushu.enums.ProductColumn;
import tushu.model.ProductDO;
import tushu.produc.service.ImagesService;
import tushu.produc.service.ProductService;
import tushu.product.mapper.ProductDOMapper;

@Service("productService")
public class ProductServiceImpl implements ProductService {
	
	@Autowired
	private ProductDOMapper productDOMapper;
	
	@Autowired
	private ImagesService iamgesService;
	
	public List<Product> getByIndexShowType(IndexShowType<Product> type){
		List<Product> list = new ArrayList<Product>();
		List<ProductDO> dos = this.productDOMapper.getByIndexShowType(type.getId());
		if(dos != null){
			for(ProductDO pd : dos){
				Product p = BeanCopyer.toProduct(pd);
				Images images = iamgesService.getImages(pd.getIndexShowImage());
				p.setIndexShowImage(images);
				list.add(p);
			}
		}
		return list;
	}
	
	public Product getById(Integer id){
		Product p = null;
		ProductDO pdo = this.productDOMapper.selectByPrimaryKey(id);
		if(pdo != null){
			p = BeanCopyer.toProduct(pdo);
		}
		return p;
	}
	
	public void updateViewCount(Integer id, Integer viewCount){
		this.productDOMapper.updateViewCount(id, viewCount);
	}
	
	public void updateSaledCount(Integer id, Integer saledCount){
		this.productDOMapper.updateSaledCount(id, saledCount);
	}
	
	public List<Product> getByColumn(ProductColumn column, Integer size){
		List<Product> ps = new ArrayList<Product>();
		List<ProductDO> pdos = this.productDOMapper.getByColumn(column.toString(), size);
		if(pdos != null){
			for(ProductDO pdo : pdos){
				Product p = BeanCopyer.toProduct(pdo);
				ps.add(p);
			}
		}
		return ps;
	}
	
	public List<Product> getAll(){
		List<Product> ps = new ArrayList<Product>();
		List<ProductDO> pdos = this.productDOMapper.getAll();
		if(pdos != null){
			for(ProductDO pdo : pdos){
				Product p = BeanCopyer.toProduct(pdo);
				ps.add(p);
			}
		}
		return ps;
	}
}
