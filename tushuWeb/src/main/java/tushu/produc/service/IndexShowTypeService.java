package tushu.produc.service;

import java.util.List;

import tushu.business.product.object.IndexShowType;
import tushu.business.product.object.Product;

public interface IndexShowTypeService {

	public List<IndexShowType<Product>> getIndexShowTypes();
}
