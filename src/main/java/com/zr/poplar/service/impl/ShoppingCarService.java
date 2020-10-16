package com.zr.poplar.service.impl;

import java.util.List;

import com.zr.poplar.dao.IShoppingCarDao;
import com.zr.poplar.dao.impl.ShoppingCarDao;
import com.zr.poplar.pojo.ShoppingCar;
import com.zr.poplar.service.IShoppingCarSevice;

public class ShoppingCarService implements IShoppingCarSevice{
	
	/**
	 * 数据实现层
	 */
	IShoppingCarDao dao = new ShoppingCarDao();
	
	/**
	 * 添加购物车
	 */
	@Override
	public Boolean addShoppingCar(ShoppingCar shoppingcar) {
		return null;
	}
	
	/**
	 * 删除购物车
	 */
	@Override
	public Boolean deleteShoppingCar(Integer id) {
		return null;
	}
	
	/**
	 * 显示所有数据
	 */
	@Override
	public List<ShoppingCar> showShoppingCar(Integer customer_id) {
		return null;
	}
	
	/**
	 * 修改商品数量
	 */
	@Override
	public void updateShopingCar(Integer shoppingcar_sum) {
		
	}

}
