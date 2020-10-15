package com.zr.poplar.dao;

import java.util.List;

import com.zr.poplar.pojo.Orderform;

/**
 * 订单接口
 * @author IOrderDao
 *
 */
public interface IOrderDao {
	/**
	 * 添加订单
	 * @param orderform
	 * @return
	 */
	Orderform addOrder(Orderform orderform);
	
	/**
	 * 根据ID删除订单
	 * @param deleteOrder
	 */
	void deleteOrder(Integer id);
	
	/**
	 * （商家使用）显示所有订单
	 * @return showAllOrder
	 */
	List<Orderform> showAllOrder();
	
	/**
	 * 用户订单显示（根据客户ID查询所有订单）
	 * @return
	 */
	List<Orderform> showById();
	
	
	
}
