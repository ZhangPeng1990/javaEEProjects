package tushu.produc.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import tushu.business.product.object.IndexShowType;
import tushu.business.product.object.Product;
import tushu.enums.Types;
import tushu.model.IndexShowTypeDO;
import tushu.produc.service.IndexShowTypeService;
import tushu.produc.service.ProductService;
import tushu.product.mapper.IndexShowTypeDOMapper;

@Service("indexShowTypeService")
public class IndexShowTypeServiceImpl implements IndexShowTypeService {
	
	@Autowired
	private IndexShowTypeDOMapper indexShowTypeDOMapper;
	
	@Autowired
	private ProductService productService;
	
	public List<IndexShowType<Product>> getIndexShowTypes(){
		List<IndexShowTypeDO> typeDO = this.indexShowTypeDOMapper.selectBytype(Types.EXHIBITION.toString());
		List<IndexShowType<Product>> list = new ArrayList<IndexShowType<Product>>();
		if(typeDO != null){
			for(IndexShowTypeDO dos : typeDO){
				IndexShowType<Product> it = BeanCopier.toIndexShowType(dos);
				List<Product> products = this.productService.getByIndexShowType(it);
				it.setObjects(products);
				list.add(it);
			}
		}
		return list;
	}

}
