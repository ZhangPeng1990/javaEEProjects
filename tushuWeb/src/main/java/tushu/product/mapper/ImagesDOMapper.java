package tushu.product.mapper;

import tushu.model.ImagesDO;

public interface ImagesDOMapper {
    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table images
     *
     * @mbggenerated Mon Sep 09 16:18:50 CST 2013
     */
    int deleteByPrimaryKey(Integer id);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table images
     *
     * @mbggenerated Mon Sep 09 16:18:50 CST 2013
     */
    int insert(ImagesDO record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table images
     *
     * @mbggenerated Mon Sep 09 16:18:50 CST 2013
     */
    int insertSelective(ImagesDO record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table images
     *
     * @mbggenerated Mon Sep 09 16:18:50 CST 2013
     */
    ImagesDO selectByPrimaryKey(Integer id);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table images
     *
     * @mbggenerated Mon Sep 09 16:18:50 CST 2013
     */
    int updateByPrimaryKeySelective(ImagesDO record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table images
     *
     * @mbggenerated Mon Sep 09 16:18:50 CST 2013
     */
    int updateByPrimaryKey(ImagesDO record);
}