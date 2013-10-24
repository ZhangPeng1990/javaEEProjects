package tushu.user.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import tushu.model.UserDO;

public interface UserDOMapper<T extends AbstractDO, PK extends java.io.Serializable> {
	
	PK deleteByPrimaryKey(Long id);

    int insert(UserDO record);

    int insertSelective(UserDO record);

    UserDO selectByPrimaryKey(Long id);
    
    List<UserDO> checkUserByNameAndPass(@Param("userName") String userName, @Param("passWord") String passWord);
    
    List<UserDO> getAll();

    int updateByPrimaryKeySelective(UserDO record);

    int updateByPrimaryKey(UserDO record);
    
    int findByName(String userName);
}