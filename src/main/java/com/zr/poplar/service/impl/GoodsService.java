package com.zr.poplar.service.impl;

import java.util.List;

import com.zr.poplar.dao.IGoodsDao;
import com.zr.poplar.dao.impl.GoodsDao;
import com.zr.poplar.pojo.Goods;
import com.zr.poplar.service.IGoodsService;

/**
 * 商品实现类
 * 
 * @author GoodsService
 *
 */
public class GoodsService implements IGoodsService {

	/**
	 * 数据实现层
	 */
	IGoodsDao dao = new GoodsDao();

	/**
	 * 添加商品
	 */
	@Override
	public Boolean addGoods(Goods goods) {
		return dao.addGoods(goods);
	}

	/**
	 * 删除商品
	 */
	@Override
	public Boolean deleteGoods(Integer id) {
		return dao.deleteGoods(id);
	}

	/**
	 * 显示所有商品
	 */
	@Override
	public List<Goods> showAllGoods() {
		return dao.showAllGoods();
	}

	/**
	 * 根据商品名称查找商品
	 */
	@Override
	public List<Goods> findGoodsByName(String goodsName) {
		return dao.findGoodsByName(goodsName);
	}

	/**
	 * 根据ID修改商品信息
	 */
	@Override
	public Boolean changeGoods(Goods goods) {
		return dao.changeGoods(goods);
	}

	@Override
	public Boolean lowerOrUpper(String status, Integer id) {
		return dao.lowerOrUpper(status, id);
	}
	
	/**
	 * 根据id 获取该商品的信息
	 * 
	 */
	@Override
	public Goods productpage(Integer goodsId) {
		return dao.productpage(goodsId);
	}

	/**
	 * 
	 */
	@Override
	public List<Goods> showSort(String goodsType) {
		return dao.showSort(goodsType);
		
	}

	/**
	 * 
	 */
	@Override
	public Goods showGoods(Integer gid) {
		return dao.showGoods(gid);
	}

}
