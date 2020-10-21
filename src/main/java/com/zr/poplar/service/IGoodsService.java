package com.zr.poplar.service;

import java.util.List;

import com.zr.poplar.pojo.Goods;

/**
 * 商品接口
 * 
 * @author IGoodsDao
 *
 */
public interface IGoodsService {

	/**
	 * 添加商品
	 * 
	 * @param addGoods
	 * @return
	 */
	Boolean addGoods(Goods goods);

	/**
	 * 删除商品
	 * 
	 * @param deleteGoods
	 * @return
	 */
	Boolean deleteGoods(Integer id);

	/**
	 * 显示所有商品
	 * 
	 * @return showAllGoods
	 */
	List<Goods> showAllGoods();

	/**
	 * 根据商品名称查找商品
	 * 
	 * @param findGoodsByType
	 * @return
	 */
	List<Goods> findGoodsByName(String goodsName);

	/**
	 * 根据id修改商品信息
	 * 
	 * @return
	 */
	Boolean changeGoods(Goods goods);

	/**
	 * 商品上架或下架
	 */
	Boolean lowerOrUpper(String status, Integer id);

	/**
	 * 根据id 获取该商品的信息
	 */
	Goods productpage(Integer goodsId);

	/**
	 * 根据物品类型查看商品
	 * @param goodsType
	 * @return
	 */
	List<Goods> showSort(String goodsType);

	/**
	 * 根据id回显商品
	 * @param gid
	 * @return
	 */
	Goods showGoods(Integer gid);

}