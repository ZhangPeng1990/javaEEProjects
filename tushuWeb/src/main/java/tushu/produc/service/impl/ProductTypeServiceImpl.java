package tushu.produc.service.impl;

import java.util.LinkedList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import tushu.business.product.object.ProductType;
import tushu.model.ProductTypeDO;
import tushu.produc.service.ProductService;
import tushu.produc.service.ProductTypeService;
import tushu.product.mapper.ProductTypeDOMapper;

@Service("productTypeService")
public class ProductTypeServiceImpl implements ProductTypeService {

	@Autowired
	private ProductTypeDOMapper productTypeDOMapper;
	
	@Autowired
	private ProductService productService;

	private LinkedList<ProductType> getProductTypeByFather(ProductType productType) {
		LinkedList<ProductType> grandchild = null;
		LinkedList<ProductType> types = new LinkedList<ProductType>();
		LinkedList<ProductTypeDO> typeDos = productTypeDOMapper.getByFather(productType.getId());
		if(typeDos != null){
			for(ProductTypeDO priductTypeDO : typeDos){
				ProductType p = BeanCopyer.toProductType(priductTypeDO);
				grandchild = this.getProductTypeByFather(p);
				p.setSons(grandchild);
				p.setProdcut(productService.getById(priductTypeDO.getProductId()));
				types.add(p);
			}
		}
		return types;
	}

	@Override
	public LinkedList<ProductType> getRoot() {
		LinkedList<ProductType> types = new LinkedList<ProductType>();
		LinkedList<ProductType> sons = null;
		List<ProductTypeDO> typeDos = this.productTypeDOMapper.getRoot();
		if(typeDos != null){
			for(ProductTypeDO priductTypeDO : typeDos){
				ProductType productType = BeanCopyer.toProductType(priductTypeDO);
				sons = this.getProductTypeByFather(productType);
				productType.setSons(sons);
				types.add(productType);
			}
		}
		return types;
	}

	@Override
	public ProductType getProductTypeById(Integer id) {
		ProductType productType = null;
		ProductTypeDO typeDo = productTypeDOMapper.selectByPrimaryKey(id);
		if(typeDo != null){
			productType = BeanCopyer.toProductType(typeDo);
			productType.setProdcut(productService.getById(typeDo.getProductId()));
		}
		return productType;
	}
	
	public LinkedList<ProductType> getByFather(ProductType productType){
		LinkedList<ProductType> list = null;
		list = this.getProductTypeByFather(productType);
		return list;
	}
}
