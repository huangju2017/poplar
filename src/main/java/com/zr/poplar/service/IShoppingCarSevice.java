package com.zr.poplar.service;

import java.util.List;

import com.zr.poplar.pojo.ShoppingCar;
import com.zr.poplar.pojo.ShoppingCarExt;

public interface IShoppingCarSevice {

	/**
	 * 添加购物车
	 * @param shoppingcar
	 * @return
	 */
	Boolean addShoppingCar(ShoppingCar shoppingcar);
	
	/**
	 * 删除购物车
	 * @param id
	 * @return
	 */
	Boolean deleteShoppingCar(Integer id);
	
	/**
	 * 显示所有数据
	 * @param customer_id
	 * @return
	 */
	List<ShoppingCarExt> showShoppingCar(Integer customer_id);
	
	/**
	 * 修改商品数量
	 * @param shoppingcar_sum
	 */
	void updateShopingCar(Integer shoppingcar_sum);
	
}
