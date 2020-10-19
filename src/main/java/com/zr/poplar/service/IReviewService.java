package com.zr.poplar.service;

import java.util.List;

import com.zr.poplar.pojo.Goods;
import com.zr.poplar.pojo.Review;
import com.zr.poplar.pojo.ReviewExt;

/**
 * 评论接口
 * @author IReviewDao
 *
 */
public interface IReviewService {
	
	/**
	 * 添加评论
	 * @param goods
	 * @param customerId
	 * @return
	 */
	Boolean addReview(Review review);
	
	/**
	 * 撤回评论
	 * @param goodsId
	 * @return
	 */
	Boolean deleteAllReview(Integer customerId);
	
	/**
	 * 展示所有评论
	 * @param goodsId
	 * @return
	 */
	List<ReviewExt> showAllReview();
	
}
