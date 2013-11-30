package tushu.product.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import tushu.model.OrderFormDO;

public interface OrderFormDOMapper {
    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table order_form
     *
     * @mbggenerated Sun Sep 15 15:26:33 CST 2013
     */
    int deleteByPrimaryKey(Long id);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table order_form
     *
     * @mbggenerated Sun Sep 15 15:26:33 CST 2013
     */
    int insert(OrderFormDO record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table order_form
     *
     * @mbggenerated Sun Sep 15 15:26:33 CST 2013
     */
    int insertSelective(OrderFormDO record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table order_form
     *
     * @mbggenerated Sun Sep 15 15:26:33 CST 2013
     */
    OrderFormDO selectByPrimaryKey(Long id);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table order_form
     *
     * @mbggenerated Sun Sep 15 15:26:33 CST 2013
     */
    int updateByPrimaryKeySelective(OrderFormDO record);
    
    int updateOrderType(@Param("id") Long id, @Param("type") String type);
    
    int updateOrderProgress(@Param("id") Long id, @Param("type") String type);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table order_form
     *
     * @mbggenerated Sun Sep 15 15:26:33 CST 2013
     */
    int updateByPrimaryKey(OrderFormDO record);
    
    /**
     * 根据user_Id,order_Type获 取购物车 或 未付款 或 已付款 或 未付款和已付款 类型的订单
     */
    List<OrderFormDO> getOrders(@Param("user_Id") Integer user_Id, @Param("shopping_cart") String shopping_cart, 
    		@Param("non_payment") String non_payment, @Param("account_paid") String account_paid);
    
    OrderFormDO getOrder(@Param("user_Id") Integer user_Id, @Param("type") String type, @Param("workId") Integer workId);
}