package com.zr.poplar.service.impl;

import java.util.List;

import com.zr.poplar.dao.IOrderDao;
import com.zr.poplar.dao.impl.OrderDao;
import com.zr.poplar.pojo.Orderform;
import com.zr.poplar.service.IOrderService;

/**
 * 订单实现类
 * @author OrderService
 *
 */
public class OrderService implements IOrderService{
	
	/**
	 * 数据实现层
	 */
	IOrderDao dao = new OrderDao();
	
	/**
	 * 添加订单
	 */
	@Override
	public Orderform addOrder(Orderform orderform) {
		return dao.addOrder(orderform);
	}
	
	/**
	 * 删除订单
	 */
	@Override
	public void deleteOrder(Integer id) {
		dao.deleteOrder(id);
	}
	
	/**
	 * 显示所有订单
	 */
	@Override
	public List<Orderform> showAllOrder() {
		return dao.showAllOrder();
	}
	
	/**
	 * 根据用户ID查询所有订单
	 */
	@Override
	public List<Orderform> showById() {
		return dao.showById();
	}

}
