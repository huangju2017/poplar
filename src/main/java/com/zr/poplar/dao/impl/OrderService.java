package com.zr.poplar.dao.impl;

import java.util.List;

import com.zr.poplar.dao.IOrderDao;
import com.zr.poplar.pojo.Orderform;

/**
 * 订单实现类
 * @author OrderService
 *
 */
public class OrderService implements IOrderDao{
	
	/**
	 * 添加订单
	 */
	@Override
	public Orderform addOrder(Orderform orderform) {
		return null;
	}
	
	/**
	 * 删除订单
	 */
	@Override
	public void deleteOrder(Integer id) {
		
	}
	
	/**
	 * 显示所有订单
	 */
	@Override
	public List<Orderform> showAllOrder() {
		return null;
	}
	
	/**
	 * 根据用户ID查询所有订单
	 */
	@Override
	public List<Orderform> showById() {
		// TODO Auto-generated method stub
		return null;
	}

}
