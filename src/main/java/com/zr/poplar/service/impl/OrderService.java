package com.zr.poplar.service.impl;

import java.util.List;

import com.zr.poplar.dao.IOrderDao;
import com.zr.poplar.dao.impl.OrderDao;
import com.zr.poplar.pojo.MyOrder;
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
	public boolean addOrder(Orderform orderform) {
		return dao.addOrder(orderform);
	}
	
	/**
	 * 删除订单
	 * @return 
	 */
	@Override
	public boolean deleteOrder(Integer id) {
		return dao.deleteOrder(id);
	}
	
	/**
	 * 显示所有订单
	 */
	@Override
	public List<MyOrder> showAllOrder() {
		return dao.showAllOrder();
	}
	
	/**
	 * 根据用户ID查询所有订单
	 */
	@Override
	public List<MyOrder> findById(Integer custormerId) {
		// TODO Auto-generated method stub
		return dao.findById(custormerId);
	}

}
