package tushu.product.mapper;

import tushu.model.SysConfigDO;


public interface SysConfigDOMapper {
    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table sys_config
     *
     * @mbggenerated Sat Nov 16 22:02:23 CST 2013
     */
    int deleteByPrimaryKey(Integer id);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table sys_config
     *
     * @mbggenerated Sat Nov 16 22:02:23 CST 2013
     */
    int insert(SysConfigDO record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table sys_config
     *
     * @mbggenerated Sat Nov 16 22:02:23 CST 2013
     */
    int insertSelective(SysConfigDO record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table sys_config
     *
     * @mbggenerated Sat Nov 16 22:02:23 CST 2013
     */
    SysConfigDO selectByPrimaryKey(Integer id);
    
    SysConfigDO selectByConfigKey(String key);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table sys_config
     *
     * @mbggenerated Sat Nov 16 22:02:23 CST 2013
     */
    int updateByPrimaryKeySelective(SysConfigDO record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table sys_config
     *
     * @mbggenerated Sat Nov 16 22:02:23 CST 2013
     */
    int updateByPrimaryKeyWithBLOBs(SysConfigDO record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table sys_config
     *
     * @mbggenerated Sat Nov 16 22:02:23 CST 2013
     */
    int updateByPrimaryKey(SysConfigDO record);
}