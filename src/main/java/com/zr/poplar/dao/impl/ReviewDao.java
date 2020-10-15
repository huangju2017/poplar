package com.zr.poplar.dao.impl;

import java.util.List;

import com.zr.poplar.dao.IReviewDao;
import com.zr.poplar.pojo.Goods;
import com.zr.poplar.pojo.Review;

/**
 * 评论实现类
 * @author ReviewService
 *
 */
public class ReviewDao implements IReviewDao{
	
	/**
	 * 添加评论
	 */
	@Override
	public Boolean addReview(Goods goods, Integer customerId) {
		return null;
	}
	
	/**
	 * 撤销评论
	 */
	@Override
	public Boolean deleteAllReview(Integer goodsId) {
		return null;
	}
	
	/**
	 * 展示所有评论
	 */
	@Override
	public List<Review> showAllReview(Integer goodsId) {
		return null;
	}

}
