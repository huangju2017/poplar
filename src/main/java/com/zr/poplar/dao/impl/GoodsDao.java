package com.zr.poplar.dao.impl;

import java.util.List;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import com.zr.poplar.dao.IGoodsDao;
import com.zr.poplar.pojo.Goods;
import com.zr.poplar.util.TxDBUtils;

/**
 * 商品实现类
 * 
 * @author GoodsService
 *
 */
public class GoodsDao implements IGoodsDao {

	/**
	 * 添加商品
	 */
	@Override
	public Boolean addGoods(Goods goods) {

		String sql = "insert into goods value(null,?,?,?,?,?,?,?,?)";
		QueryRunner runner = new QueryRunner(TxDBUtils.getSource());

		try {
			int line = runner.update(sql, goods.getGoodsName(), goods.getGoodsPrice(), goods.getGoodsNumber(),
					goods.getGoodsType(), goods.getGoodsImg(), goods.getGoodsContent(), goods.getGoodsStatus(),
					goods.getDateTime());
			if (line > 0)
				return true;
		} catch (Exception e) {
			e.printStackTrace();
		}

		return false;
	}

	/**
	 * 删除商品
	 */
	@Override
	public Boolean deleteGoods(Integer id) {
		String sql = "delete from goods where goods_id=?";
		try {
			QueryRunner runner = new QueryRunner(TxDBUtils.getSource());
			int line = runner.update(sql, id);
			if (line > 0)
				return true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	/**
	 * 显示所有商品
	 */
	@Override
	public List<Goods> showAllGoods() {
		String sql = "select * from goods";
		try {
			QueryRunner runner = new QueryRunner(TxDBUtils.getSource());
			return runner.query(sql, new BeanListHandler<Goods>(Goods.class));

		} catch (Exception e) {
			e.printStackTrace();
		}

		return null;
	}

	/**
	 * 根据商品名称查找商品
	 */
	@Override
	public List<Goods> findGoodsByName(String goodsName) {

		String sql = "select * from goods where goods_name like %?%";
		try {
			QueryRunner runner = new QueryRunner(TxDBUtils.getSource());
			return runner.query(sql, new BeanListHandler<Goods>(Goods.class), goodsName);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	/**
	 * 根据ID修改商品信息
	 */
	@Override
	public Boolean changeGoods(Goods goods, Integer id) {
		String sql = "update goods set goods_name=?,goods_price=?,goods_number=?,goods_type=?,goods_content=?";
		try {
			QueryRunner runner = new QueryRunner(TxDBUtils.getSource());
			int line = runner.update(sql);
			if (line > 0)
				return true;

		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}

	/**
	 * 商品上架或下架
	 */
	@Override
	public Boolean lowerOrUpper(String status, Integer id) {
		String sql = "update goods set goods_status=? where goods_id=?";
		try {
			QueryRunner runner = new QueryRunner(TxDBUtils.getSource());
			int line = runner.update(sql, status, id);
			if (line > 0)
				return true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;

	}

}
