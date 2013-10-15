package tushu.user.mapper;

import java.util.List;

import tushu.model.InformDO;

public interface InformDOMapper {
	
    int deleteByPrimaryKey(Integer id);

    int insert(InformDO record);

    int insertSelective(InformDO record);

    InformDO selectByPrimaryKey(Integer id);
    
    List<InformDO> selectByUserDO(Integer userId);

    int updateByPrimaryKeySelective(InformDO record);

    int updateByPrimaryKeyWithBLOBs(InformDO record);

    int updateByPrimaryKey(InformDO record);
}