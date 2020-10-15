package com.zr.poplar.dao.impl;

import java.util.List;

import com.zr.poplar.dao.IGoodsDao;
import com.zr.poplar.pojo.Goods;

/**
 * 商品实现类
 * @author GoodsService
 *
 */
public class GoodsService implements IGoodsDao{
	
	/**
	 * 添加商品
	 */
	@Override
	public Boolean addGoods(Goods goods) {
		return null;
	}
	
	/**
	 * 删除商品
	 */
	@Override
	public Boolean deleteGoods(Integer id) {
		return null;
	}
	
	/**
	 * 显示所有商品
	 */
	@Override
	public List<Goods> showAllGoods() {
		return null;
	}
	
	/**
	 * 根据商品类型查找商品
	 */
	@Override
	public List<Goods> findGoodsByType(String goodsType) {
		return null;
	}
	
	/**
	 * 根据ID修改商品信息
	 */
	@Override
	public Goods changeGoods(Integer id) {
		return null;
	}

}
