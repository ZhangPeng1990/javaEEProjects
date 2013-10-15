package tushu.produc.service;

import java.util.LinkedList;

import tushu.business.product.object.ProductType;

public interface ProductTypeService {

	public LinkedList<ProductType> getRoot();
	
	public ProductType getProductTypeById(Integer id);
	
	public LinkedList<ProductType> getByFather(ProductType productType);
	
}
