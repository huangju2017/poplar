package com.zr.poplar.dao.impl;

import java.sql.SQLException;
import java.util.List;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import com.zr.poplar.dao.IShoppingCarDao;
import com.zr.poplar.pojo.ShoppingCar;
import com.zr.poplar.pojo.ShoppingCarExt;
import com.zr.poplar.util.TxDBUtils;

public class ShoppingCarDao implements IShoppingCarDao{
	
	/**
	 * 添加购物车
	 */
	@Override
	public Boolean addShoppingCar(ShoppingCar shoppingcar) {
		String sql="insert into shoppingcar values(null,?,?,?,?,?)";
		System.err.println("1");
		
		QueryRunner runner=new QueryRunner(TxDBUtils.getSource());
		
		try {
			int line=runner.update(sql,shoppingcar.getGoodsId(),shoppingcar.getCustomerId(),shoppingcar.getShoppingcarSum(),shoppingcar.getSumGoodsnumber(),shoppingcar.getOrderId());
			if (line>0) {
				return true;
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		return null;
	}
	
	/**
	 * 删除购物车
	 */
	@Override
	public Boolean deleteShoppingCar(Integer id) {
		
		String sql="delete from shoppingcar where shoppingCarId=?";
		
		QueryRunner runner=new QueryRunner(TxDBUtils.getSource());
		try {
			int update=runner.update(sql,id);
			System.out.println("line:"+update);
			if (update>0) {
				return true;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return null;
	}
	
	/**
	 * 显示所有数据
	 */
	@Override
	public List<ShoppingCarExt> showShoppingCar(Integer customer_id) {
		String sql="SELECT s.customerId,s.shoppingCarId,s.goodsId,g.goodsImg,g.goodsName,g.goodsPrice,s.shoppingcarSum,s.sumGoodsnumber,s.orderId\n" + 
				"FROM shoppingcar s,goods g WHERE s.goodsId=g.goodsId AND s.customerId=?";
		QueryRunner runner=new QueryRunner(TxDBUtils.getSource());
		try {
			List<ShoppingCarExt> shoppingcars = runner.query(sql, new BeanListHandler<ShoppingCarExt>(ShoppingCarExt.class),customer_id);
			System.out.println("shoppingcars:"+shoppingcars);
			if (shoppingcars.size()>0) {
				return shoppingcars;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return null;
	}
}
