package tushu.product.mapper;


import java.util.LinkedList;
import java.util.List;

import tushu.model.ProductTypeDO;

public interface ProductTypeDOMapper {
	
    int deleteByPrimaryKey(Integer id);

    int insert(ProductTypeDO record);

    int insertSelective(ProductTypeDO record);

    ProductTypeDO selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(ProductTypeDO record);

    int updateByPrimaryKey(ProductTypeDO record);
    
    List<ProductTypeDO> getRoot();
    
    LinkedList<ProductTypeDO> getByFather(Integer id);
}