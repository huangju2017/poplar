package com.zr.poplar.dao;

import java.util.List;

import com.zr.poplar.pojo.Goods;

/**
 * 商品接口
 * @author IGoodsDao
 *
 */
public interface IGoodsDao {
	
	/**
	 * 添加商品
	 * @param addGoods
	 * @return
	 */
	Boolean addGoods(Goods goods);
	
	/**
	 * 删除商品
	 * @param deleteGoods
	 * @return
	 */
	Boolean deleteGoods(Integer id);
	
	/**
	 * 显示所有商品
	 * @return showAllGoods
	 */
	List<Goods> showAllGoods();
	
	/**
	 * 根据商品类型查找商品
	 * @param findGoodsByType
	 * @return
	 */
	List<Goods> findGoodsByType(String goodsType);
	
	/**
	 * 根据id修改商品信息
	 * @param id
	 * @return
	 */
	Goods changeGoods(Integer id);
	
}
