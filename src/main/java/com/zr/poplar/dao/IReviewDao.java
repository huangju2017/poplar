package com.zr.poplar.dao;

import java.util.List;

import com.zr.poplar.pojo.Review;

/**
 * 评论接口
 * @author IReviewDao
 *
 */
public interface IReviewDao {
	
	
	/**
	 * 撤回评论
	 * @param goodsId
	 * @return
	 */
	Boolean deleteAllReview(Integer goodsId);
	
	/**
	 * 展示所有评论
	 * @param goodsId
	 * @return
	 */
	List<Review> showAllReview(Integer goodsId);

	/**
	 * 添加评论
	 */
	Boolean addReview(Review review);
	
}
