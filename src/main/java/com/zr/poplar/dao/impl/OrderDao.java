package com.zr.poplar.dao.impl;

import java.sql.SQLException;
import java.util.List;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import com.zr.poplar.dao.IOrderDao;
import com.zr.poplar.pojo.MyOrder;
import com.zr.poplar.pojo.Orderform;
import com.zr.poplar.util.TxDBUtils;

/**
 * 订单实现类
 * 
 * @author OrderService
 *
 */
public class OrderDao implements IOrderDao {

	/**
	 * 动态代理 获取预编译处理SQL语句对象
	 */
	QueryRunner runner = new QueryRunner(TxDBUtils.getSource());

	/**
	 * 添加订单
	 */
	@Override
	public boolean addOrder(Orderform orderform) {
		// 添加订单的SQL语句
		String sql = "insert into orderform values(null,?,?,?,?,?,?,?)";

		// 执行SQL语句
		try {
			int line = runner.update(sql, orderform.getOrderNumber(), orderform.getOrderGoodsCount(),
					orderform.getTotalPrice(), orderform.getCustomerId(), orderform.getGoodsId(),
					orderform.getPayStatus(), orderform.getCreateTime());
			if (line > 0) {
				System.out.println("添加数据成功");
				return true;
			} else {
				System.out.println("添加数据失败");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return false;
	}

	/**
	 * 删除订单
	 */
	@Override
	public boolean deleteOrder(Integer id) {

		String sql = "delete from orderform where orderId=?";

		try {
			int line = runner.update(sql, id);
			if (line > 0) {
				System.out.println("删除数据成功");
				return true;
			} else {
				System.out.println("删除数据失败");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return false;
	}

	/**
	 * 显示所有订单
	 */
	@Override
	public List<MyOrder> showAllOrder() {

		String sql = "SELECT orderId, orderNumber, goodsName, goodsPrice,orderGoodsCount, payStatus, createTime \r\n" + 
        		"FROM goods g JOIN orderform o WHERE g.goodsId=o.goodsId ";

		try {
			return runner.query(sql, new BeanListHandler<MyOrder>(MyOrder.class));
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return null;
	}

	
	/**
	 * 根据用户ID查询所有订单
	 */
	@Override
	public List<MyOrder> findById(Integer custormerId) {

            String sql = "SELECT orderId, orderNumber, goodsName, goodsPrice,orderGoodsCount, payStatus, createTime \r\n" + 
            		"FROM goods g JOIN orderform o WHERE g.goodsId=o.goodsId AND o.customerId=?";
            try {
            	return runner.query(sql, new BeanListHandler<MyOrder>(MyOrder.class),custormerId);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		
		return null;
	}

	
}
