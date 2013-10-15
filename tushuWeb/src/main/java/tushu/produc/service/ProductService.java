package tushu.produc.service;

import java.util.List;

import tushu.business.product.object.IndexShowType;
import tushu.business.product.object.Product;
import tushu.enums.ProductColumn;

public interface ProductService {

	public List<Product> getByIndexShowType(IndexShowType<Product> type);
	
	public Product getById(Integer id);
	
	public void updateViewCount(Integer id, Integer viewCount);
	
	public void updateSaledCount(Integer id, Integer saledCount);
	
	/**
	 * 以某一列为条件获取一个size大小的Product集合,
	 * 如：获取销量前三的商品集合等
	 * @param column
	 * @param size
	 * @return
	 */
	public List<Product> getByColumn(ProductColumn column, Integer size);
	
	public List<Product> getAll();
}
