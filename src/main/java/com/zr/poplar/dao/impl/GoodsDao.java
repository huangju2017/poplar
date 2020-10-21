package com.zr.poplar.dao.impl;

import java.sql.SQLException;
import java.util.List;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
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
		String sql = "delete from goods where goodsId=?";
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

		String sql = "select * from goods where goodsName like ?";
		try {
			QueryRunner runner = new QueryRunner(TxDBUtils.getSource());
			return runner.query(sql, new BeanListHandler<Goods>(Goods.class),"%"+goodsName+"%");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	/**
	 * 根据ID修改商品信息
	 */
	@Override
	public Boolean changeGoods(Goods goods) {
		String sql = "update goods set goodsName=?,goodsPrice=?,goodsNumber=?,goodsType=?,goodsContent=? where goodsId=?";
		try {
			QueryRunner runner = new QueryRunner(TxDBUtils.getSource());
			int line = runner.update(sql, goods.getGoodsName(), goods.getGoodsPrice(), goods.getGoodsNumber(),
					goods.getGoodsType(), goods.getGoodsContent(), goods.getGoodsId());
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
		String sql = "update goods set goodsStatus=? where goodsId=?";
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

	/**
	 * 根据id获取该商品信息
	 */
	@Override
	public Goods productpage(Integer goodsId) {
		String sql = "select * from goods where goodsId=?";
		try {
			QueryRunner runner = new QueryRunner(TxDBUtils.getSource());
			return runner.query(sql, new BeanHandler<Goods>(Goods.class), goodsId);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public List<Goods> showSort(String goodsType) {
		String sql = "select * from goods where goodsType=?";
		QueryRunner runner = new QueryRunner(TxDBUtils.getSource());
		try {
			return runner.query(sql, new BeanListHandler<Goods>(Goods.class), goodsType);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public Goods showGoods(Integer gid) {
		String sql ="select * from goods where goodsId=?";
		QueryRunner runner = new QueryRunner(TxDBUtils.getSource());
		try {
			return runner.query(sql, new BeanHandler<Goods>(Goods.class), gid);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}

}
