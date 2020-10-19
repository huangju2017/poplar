package com.zr.poplar.dao.impl;

import java.sql.SQLException;
import java.util.List;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import com.zr.poplar.dao.IReviewDao;
import com.zr.poplar.pojo.Emp;
import com.zr.poplar.pojo.Goods;
import com.zr.poplar.pojo.Review;
import com.zr.poplar.pojo.ReviewExt;
import com.zr.poplar.util.TxDBUtils;

/**
 * 评论实现类
 * @author ReviewService
 *
 */
public class ReviewDao implements IReviewDao{
	
	/**
	 * 调用工具类
	 */
	QueryRunner runner = new QueryRunner(TxDBUtils.getSource());
	
	/**
	 * 添加评论
	 */
	@Override
	public Boolean addReview(Review review) {
		String sql = "insert into review values(null,?,?,?,?)";
		
		try {
			int lint = runner.update(sql, review.getCustomerId(),review.getGoodsId(),review.getReviewContent(),review.getReviwDate());
			
			if (lint > 0) {
				return true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return false;
	}
	
	/**
	 * 撤销评论
	 */
	@Override
	public Boolean deleteAllReview(Integer customerId) {
		String sql = "delete from review where customerId = ?";
		
		try {
			runner.update(sql, customerId);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}
	
	/**
	 * 展示所有评论
	 */
	@Override
	public List<ReviewExt> showAllReview() {
		String sql = "select r.reviewId,c.customerName,g.goodsName,r.reviewContent,r.reviwDate from review r,customer c,goods g WHERE r.customerId=c.customerId AND r.goodsId=g.goodsId";
		
		try {
			return runner.query(sql, new BeanListHandler<ReviewExt>(ReviewExt.class));
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}

}
